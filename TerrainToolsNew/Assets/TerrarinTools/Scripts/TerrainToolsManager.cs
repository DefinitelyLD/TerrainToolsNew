using System;
using System.Data;
using System.Linq;
using System.Reflection;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using Debug = UnityEngine.Debug;

namespace TerrainTools {

    public struct TerrainToolsManagerMutateData {
        public float brushSmoothness;
        public float brushStrength;
        public float brushAngle;
        public Vector2Int brushSize;

        public int brushShapeIndex;

        public Type brushType;

        public float brushFallback;
    }

    public class TerrainToolsManager {

        private readonly TerrainToolsResources m_resources;
        private readonly TerrainBrush[] m_modes;
        
        private readonly InputModule m_inputModule;
        private int m_currentModeIndex = 0;

        private int m_currentBrushShapeIndex = 0;
        private float m_brushSmoothess = 1f;
        private float m_brushStrength = 1f;
        private float m_brushAngle = 0;
        private Vector2Int m_brushSize = new Vector2Int(1, 1);

        private float m_brushFallback = 1;
        private Vector2 m_pointerPosition = Vector2.zero;

        private float m_deltaTime = 0.016f;

        private TerrainToolsContext m_context;

        private const int THREAD_GROUP_SIZE = 32;

        private GraphicsFence m_fence;
        private bool m_submitted = false;

        public void Mutate(TerrainToolsManagerMutateData data) {

            m_brushAngle = data.brushAngle;
            m_brushSmoothess = data.brushSmoothness;
            m_brushStrength = data.brushStrength;
            m_brushAngle = data.brushAngle;
            m_brushSize = data.brushSize;

            m_currentBrushShapeIndex = data.brushShapeIndex;

            m_currentModeIndex = Array.FindIndex(m_modes, mode => mode.GetType() == data.brushType);

            m_brushFallback = data.brushFallback;
        }

        public void Tick() {
            var camera = Camera.main;
            Debug.Assert(camera != null, "No camera found in the scene.");

            var eventSystem = EventSystem.current;
            Debug.Assert(eventSystem != null, "No event system found in the scene.");

            if(m_inputModule.IsMouseLeftClickHold() == false)
                return;

            if (eventSystem.IsPointerOverGameObject())
                return;

            var realPointerPosition = m_inputModule.GetMousePosition();
            m_pointerPosition = Vector2.Lerp(m_pointerPosition, realPointerPosition, m_brushFallback);
            m_pointerPosition = realPointerPosition;

            var ray = camera.ScreenPointToRay(m_pointerPosition);
            if (Physics.Raycast(ray, out RaycastHit hit) == false)
                return;

            var terrain = m_context.GetTerrain();
            var heightmapResolution = terrain.terrainData.heightmapResolution;
            var terrainSize = terrain.terrainData.size;

            var heightmapSize = new Vector2Int(heightmapResolution, heightmapResolution);

            if (hit.transform.gameObject != terrain.gameObject)
                return;

            if (m_submitted) {
                m_submitted = !m_fence.passed;
            }

            var hitPoint = new Vector3(hit.point.x, terrain.transform.position.y, hit.point.z);
            var pointerTerrainPos = hitPoint - terrain.transform.position;

            var actualBrushSize = new Vector2Int(
                (int)(Mathf.Sqrt(Mathf.Pow(m_brushSize.x, 2) + Mathf.Pow(m_brushSize.y, 2)) * 1),
                (int)(Mathf.Sqrt(Mathf.Pow(m_brushSize.x, 2) + Mathf.Pow(m_brushSize.y, 2)) * 1));

            var brushPosition = new Vector2Int(
                (int)(((heightmapResolution / terrainSize.x) * pointerTerrainPos.x) - (actualBrushSize.x * 0.5f)),
                (int)(((heightmapResolution / terrainSize.z) * pointerTerrainPos.z) - (actualBrushSize.y * 0.5f)));

            var newBrushData = new BrushData();
            newBrushData.brushPosition = brushPosition;
            newBrushData.brushSize = m_brushSize;
            newBrushData.angle = m_brushAngle;
            newBrushData.actualBrushSize = actualBrushSize;

            newBrushData.currentBrushIndex = m_currentBrushShapeIndex;
            newBrushData.smoothness = m_brushSmoothess;
            newBrushData.brushStrength = m_brushStrength;
            newBrushData.deltaTime = m_deltaTime;

            m_context.UpdateData(newBrushData);

            var commandBuffer = m_context.GetCommandBuffer();
            commandBuffer.Clear();

            var heightmapFormat = terrain.terrainData.heightmapTexture.graphicsFormat;

            // resizing brush mask
            if (m_context.IsRenderTextureExists(ContextConstants.TerrainBrushMaskTexture) == false) {
                m_context.CreateRenderTexture(ContextConstants.TerrainBrushMaskTexture, m_brushSize, GraphicsFormat.R32_SFloat, false);
            }

            var brushMaskTexture = m_context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);

            if (brushMaskTexture.CheckSize(m_brushSize) == false) {
                if (m_submitted) {
                    if (m_fence.passed == false) {
                        TerrainToolsUtils.Log("Waiting for the fence to pass before resizing texture.");
                        return;
                    }
                }

                m_context.DestroyRenderTexture(ContextConstants.TerrainBrushMaskTexture);
                brushMaskTexture = m_context.CreateRenderTexture(ContextConstants.TerrainBrushMaskTexture, m_brushSize, GraphicsFormat.R32_SFloat, false);
            }
            //--

            // the texture where result of the heightmap brushes will be stored
            if(m_context.IsRenderTextureExists(ContextConstants.TerrainHeightmapTexture) == false) {
                m_context.CreateRenderTexture(ContextConstants.TerrainHeightmapTexture, heightmapSize, heightmapFormat, false);
            }

            var heightmapTexture = m_context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

            if(heightmapTexture.CheckSize(heightmapSize) == false) {
                if (m_submitted) {
                    if (m_fence.passed == false) {
                        TerrainToolsUtils.Log("Waiting for the fence to pass before resizing texture.");
                        return;
                    }
                }

                m_context.DestroyRenderTexture(ContextConstants.TerrainHeightmapTexture);
                heightmapTexture = m_context.CreateRenderTexture(ContextConstants.TerrainHeightmapTexture, heightmapSize, heightmapFormat, false);
            }
            //--

            // getting brush heightmap, the region of terrain under the brush.
            if (m_context.IsRenderTextureExists(ContextConstants.TerrainBrushHeightTexture) == false) {
                m_context.CreateRenderTexture(ContextConstants.TerrainBrushHeightTexture, actualBrushSize, heightmapFormat, false);
            }

            var brushHeightmap = m_context.GetRenderTexture(ContextConstants.TerrainBrushHeightTexture);

            if(brushHeightmap.CheckSize(actualBrushSize) == false) {
                if (m_submitted) {
                    if (m_fence.passed == false) {
                        TerrainToolsUtils.Log("Waiting for the fence to pass before resizing texture.");
                        return;
                    }
                }

                m_context.DestroyRenderTexture(ContextConstants.TerrainBrushHeightTexture);
                brushHeightmap = m_context.CreateRenderTexture(ContextConstants.TerrainBrushHeightTexture, actualBrushSize, heightmapFormat, false);
            }
            //--

            // the texture which will mask the heightmap
            if(m_context.IsRenderTextureExists(ContextConstants.TerrainMaskTexture) == false) {
                var texture = m_context.CreateRenderTexture(ContextConstants.TerrainMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, false);

                // resizing mask texture
                commandBuffer.Blit(m_resources.TerrainMask, texture, m_resources.BlitMaterial);
            }

            var maskTexture = m_context.GetRenderTexture(ContextConstants.TerrainMaskTexture);

            if (maskTexture.CheckSize(heightmapSize) == false) {
                if (m_submitted) {
                    if (m_fence.passed == false) {
                        TerrainToolsUtils.Log("Waiting for the fence to pass before resizing texture.");
                        return;
                    }
                }

                m_context.DestroyRenderTexture(ContextConstants.TerrainMaskTexture);
                maskTexture = m_context.CreateRenderTexture(ContextConstants.TerrainMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, false);

                // resizing mask texture
                 commandBuffer.Blit(m_resources.TerrainMask, maskTexture, m_resources.BlitMaterial);
            }
            //--

            // the texture which will store the result of the heightmap operation
            if (m_context.IsRenderTextureExists(ContextConstants.TerrainBrushHeightmapResultTexture) == false) {
                m_context.CreateRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture, actualBrushSize, heightmapFormat, true);
            }

            var heightmapResultTexture = m_context.GetRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);

            if (heightmapResultTexture.CheckSize(actualBrushSize) == false) {
                if (m_submitted) {
                    if (m_fence.passed == false) {
                        TerrainToolsUtils.Log("Waiting for the fence to pass before resizing texture.");
                        return;
                    }
                }

                m_context.DestroyRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);
                heightmapResultTexture = m_context.CreateRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture, actualBrushSize, heightmapFormat, true);
            }
            //--

            if(terrain.heightmapPixelError != 0) {
                terrain.heightmapPixelError = 0;
            }
            if(terrain.drawInstanced != true) {
                Debug.Assert(false, "Terrain Draw Insranced is not checked in terrain settings. Terrain Draw Instanced must be checked in the editor, It can't be set at runtime.");
            }

            if (m_resources.DebugMode) {
                if (GameObject.Find("[Terrain Tools Texture Debug]") == null) {
                    var debug = new GameObject("[Terrain Tools Texture Debug]");
                    debug.AddComponent<TerrainToolsTextureDebug>();
                } else {
                    var debug = GameObject.Find("[Terrain Tools Texture Debug]");
                    var debugComponent = debug.GetComponent<TerrainToolsTextureDebug>();

                    debugComponent.Clear();

                    debugComponent.SetTexture("Brush Mask", brushMaskTexture);
                    debugComponent.SetTexture("Heightmap", heightmapTexture);
                    debugComponent.SetTexture("Brush Heightmap", brushHeightmap);
                    debugComponent.SetTexture("Heightmap Result", heightmapResultTexture);
                    debugComponent.SetTexture("Mask", maskTexture);
                    debugComponent.SetTexture("Terrain Heightmap", terrain.terrainData.heightmapTexture);
                }
            }

            // slicing brush size and position to be inbounds of the heightmap.
            var slicingOps = new SlicingOperations();
            var slicedBrushPosition = slicingOps.SliceBrushPosition(brushPosition, heightmapSize);
            var slicedBrushSize = slicingOps.SliceBrushSize(brushPosition, heightmapSize, actualBrushSize);
            var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushPosition, heightmapSize);
            slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

            var computeShader = m_context.GetCompute();
            var dispatchSize = m_context.GetDispatchSize();

            // resizing brush mask
            var brushTexture = m_context.GetCurrentBrushShape();
            commandBuffer.Blit(brushTexture, brushMaskTexture, m_resources.BlitMaterial);

            // getting heightmap
            commandBuffer.Blit(terrain.terrainData.heightmapTexture, heightmapTexture, m_resources.BlitMaterial);

            // getting brush heightmap
            commandBuffer.CopyTexture(
                heightmapTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                brushHeightmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);

            // copy the brush height to result brush heightmap
            commandBuffer.Blit(brushHeightmap, heightmapResultTexture, m_resources.BlitMaterial);

            var currentMode = m_modes[m_currentModeIndex];

            // recording commands from current brush mode
            if (m_inputModule.IsMouseLeftClickDown())
                currentMode.OnBrushDown(m_context);

            currentMode.OnBrushUpdate(m_context);

            if (m_inputModule.IsMouseLeftClickUp())
                currentMode.OnBrushUp(m_context);


            // if the current brush was heightmap brush then update the terrain's heightmap with the result
            if (currentMode.GetBrushType() == BrushType.Heightmap) {

                commandBuffer.CopyTexture(heightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                    terrain.terrainData.heightmapTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);

                // renewing the heightmap texture copy
                commandBuffer.Blit(terrain.terrainData.heightmapTexture, heightmapTexture, m_resources.BlitMaterial);

                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.MaskHeightmap, "HeightmapTexture", heightmapTexture);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.MaskHeightmap, "OutputHeightmapTexture", terrain.terrainData.heightmapTexture);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.MaskHeightmap, "HeightmapMaskTexture", maskTexture);

                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.MaskHeightmap, dispatchSize.x, dispatchSize.y, dispatchSize.z);
            }

            m_fence = commandBuffer.CreateGraphicsFence(GraphicsFenceType.CPUSynchronisation, SynchronisationStageFlags.AllGPUOperations);

            // sumbitting for execution
            HDRPTerrainToolsInjectionPass.CommandBuffer = commandBuffer;
            HDRPTerrainToolsInjectionPass.SubmitPass = true;

            m_submitted = true;
        }

        public TerrainToolsManager(Terrain terrain, TerrainToolsResources resources) {

            m_resources = resources;

            // getting all brushes defined in this assembly
            var assembly = Assembly.GetAssembly(typeof(TerrainToolsManager));
            var brushesTypes = assembly
                .GetTypes()
                .Where(type => type.CustomAttributes.Where(info => info.AttributeType == typeof(TerrainBrushAttribute)).Count() > 0)
                .ToArray();
            var brushCount = brushesTypes.Count();
            Debug.Assert(brushCount > 0, $"No brushes found in the assembly: {assembly.FullName}");

            // creating instances of the brushes
            m_modes = new TerrainBrush[brushCount];
            try {
                for (var i = 0; i < brushCount; i++) {
                    m_modes[i] = (TerrainBrush)Activator.CreateInstance(brushesTypes[i]);

                    TerrainToolsUtils.Log($"Brush created: {m_modes[i].GetType().Name}");
                }
            } catch (Exception e) {
                Debug.LogError($"Error creating brushes: {e.Message}");
                throw;
            }

            // getting the input module
            var inputModuleTypes = assembly
                .GetTypes()
                .Where(type => type.CustomAttributes.Where(info => info.AttributeType == typeof(InputModuleAttribute)).Count() > 0)
                .OrderByDescending(type => (int)type.GetCustomAttribute<InputModuleAttribute>().Type)
                .ToArray();

            Debug.Assert(inputModuleTypes.Length > 0, $"No input module found in the assembly: {assembly.FullName}");
            try {
                // create instance where the at the 0 index is prioritized to be custom one.
                m_inputModule = (InputModule)Activator.CreateInstance(inputModuleTypes[0]);

                TerrainToolsUtils.Log($"Input module created: {m_inputModule.GetType().Name}");

            } catch (Exception e) {
                Debug.LogError($"Error creating input module: {e.Message}");
                throw;
            }

            m_context = new TerrainToolsContext(terrain, m_resources, THREAD_GROUP_SIZE);
            TerrainToolsUtils.LoggingEnabled = m_resources.DebugMode;

            if (terrain.heightmapPixelError != 0) {
                terrain.heightmapPixelError = 0;
            }

            TerrainToolsUtils.Log("Pixel error set to 0 for the terrain.");
        }
    }
}