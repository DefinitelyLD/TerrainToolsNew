using System;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;
using Debug = UnityEngine.Debug;

namespace TerrainTools {

    public struct TerrainToolsManagerUpdateData {
        public float brushStrength;
        public float brushAngle;
        public Vector2Int brushSize;
        public int brushHeight;

        public int brushShapeIndex;

        public Type brushType;

        public float brushFallback;
        public float deltaTime;
        public float tweenStrength;

        public int splatIndex;

        public float waterSimFactor;

    }

    public class TerrainToolsManager : IDisposable {

        private readonly TerrainToolsResources m_resources;
        private readonly TerrainBrush[] m_modes;
        
        private readonly InputModule m_inputModule;
        private int m_currentModeIndex = 0;

        private int m_currentBrushShapeIndex = 0;

        private Vector2Int m_brushSize;
        private int m_brushHeight;
        private float m_brushStrength;
        private float m_brushAngle;

        private int m_splatIndex;
        private float m_waterSimFactor;

        private float m_tweenStrength;

        private float m_brushFallback = 1;
        private Vector2 m_pointerPosition = Vector2.zero;

        private float m_deltaTime = 0.016f;

        private TerrainToolsContext m_context;

        private const int THREAD_GROUP_SIZE = 32;

        private bool m_disposed;
        private readonly Stopwatch m_stopwatch;

        private readonly FenceManager m_fenceManager;
        private bool m_terrainTapped;

        public void UpdateData(TerrainToolsManagerUpdateData data) {

            m_brushAngle = data.brushAngle;
            m_brushStrength = data.brushStrength;
            m_brushAngle = data.brushAngle;
            m_brushSize = data.brushSize;
            m_brushHeight = data.brushHeight;
            m_tweenStrength = data.tweenStrength;

            m_currentBrushShapeIndex = data.brushShapeIndex;

            m_currentModeIndex = Array.FindIndex(m_modes, mode => mode.GetType() == data.brushType);

            m_brushFallback = data.brushFallback;
            m_deltaTime = data.deltaTime;

            m_splatIndex = data.splatIndex;
            m_waterSimFactor = data.waterSimFactor;
        }


        public void Tick() {
            Debug.Assert(m_context != null, "Context is not initialized or Destroyed.");

            var camera = Camera.main;
            Debug.Assert(camera != null, "No camera found in the scene.");

            var eventSystem = EventSystem.current;
            Debug.Assert(eventSystem != null, "No event system found in the scene.");

            var hasFencePassed = m_fenceManager.IsFencePassed();

            var terrain = m_context.GetTerrain();
            var heightmapResolution = terrain.terrainData.heightmapResolution;
            var alphamapResolution = terrain.terrainData.alphamapResolution;
            var terrainSize = terrain.terrainData.size;

            var brushSizeOps = new BrushSizeOperations();
            var heightmapTexelBrushSize = brushSizeOps.BrushSizeToTexelSize(m_brushSize, terrainSize, heightmapResolution);
            var gpuBrushHeight = brushSizeOps.BrushHeightToGPUHeightValue(m_brushHeight, terrainSize);

            var gpuTerrainMaskBaseHeight = brushSizeOps.BrushHeightToGPUHeightValue(m_resources.TerrainMaskBaseHeight, terrainSize);
            var gpuTerrainMaskBorder = brushSizeOps.BrushSizeToTexelSize(new Vector2Int(m_resources.TerrainMaskBorder, m_resources.TerrainMaskBorder), terrainSize, heightmapResolution).x;

            var heightmapActualBrushSize = brushSizeOps.TexelBrushSizeToActualBrushSize(heightmapTexelBrushSize);
            var brushStripeCount = brushSizeOps.CalculateStripCount(m_brushSize, m_brushHeight);

            var splatmapTexelBrushSize = brushSizeOps.BrushSizeToTexelSize(m_brushSize, terrainSize, alphamapResolution);
            var splatmapActualBrushSize = brushSizeOps.TexelBrushSizeToActualBrushSize(splatmapTexelBrushSize);

            var newBrushData = new BrushData();
            newBrushData.userBrushSize = m_brushSize;
            newBrushData.heightmapBrushSize = heightmapTexelBrushSize;
            newBrushData.brushHeight = gpuBrushHeight;
            newBrushData.angle = m_brushAngle;
            newBrushData.stripCount = brushStripeCount;
            newBrushData.heightmapActualBrushSize = heightmapActualBrushSize;
            newBrushData.alphamapActualBrushSize = splatmapActualBrushSize;
            newBrushData.alphamapBrushSize = splatmapTexelBrushSize;
            newBrushData.splatIndex = m_splatIndex;

            newBrushData.currentBrushIndex = m_currentBrushShapeIndex;
            newBrushData.brushStrength = m_brushStrength;
            newBrushData.deltaTime = m_deltaTime;
            newBrushData.hasResourceFencePassed = hasFencePassed;
            newBrushData.tweenData = new TweenData() {
                deltaTime = m_deltaTime,
                strength = m_tweenStrength,
            };

            newBrushData.terrainMaskBaseHeight = gpuTerrainMaskBaseHeight;
            newBrushData.terrainMaskBorder = gpuTerrainMaskBorder;

            if (m_context.IsDebugMode()) {
                var debug = m_context.GetDebugView();
                debug.Clear();
            }

            m_context.UpdateData(newBrushData);

            var commandBuffer = m_context.GetCommandBuffer();
            commandBuffer.Clear();

            var resourcesOps = new DefaultResourcesOps();
            resourcesOps.CreateAndResizeDefaultResources(m_context);

            var unityTerrainHeightmap = terrain.terrainData.heightmapTexture;
            var unityTerrainNormalmap = terrain.normalmapTexture;

            Texture2D unitySplatmap0 = null;
            Texture2D unitySplatmap1 = null;
            int splatmapsCount = terrain.terrainData.alphamapTextureCount;
            if (splatmapsCount > 0) {
                Debug.Assert(splatmapsCount == 2, "Atleasts 5 layers must be present on terrain.");
                unitySplatmap0 = terrain.terrainData.alphamapTextures[0];
                unitySplatmap1 = terrain.terrainData.alphamapTextures[1];
            }

            m_stopwatch.Reset();
            m_stopwatch.Start();

            // composing
            var composer = new TerrainToolsComposer();
            composer.ComposeHeightmapPass(m_context);

            // masking
            var masker = new TerrainToolsMasker();
            masker.MaskHeightmapPass(m_context);

            // tweening
            var tweener = new TerrainToolsTweener();
            tweener.TweenHeightmapPass(m_context, unityTerrainHeightmap, unitySplatmap0, unitySplatmap1);

            m_stopwatch.Stop();

            TerrainToolsUtils.Log($"Post process gpu commands recording took: {m_stopwatch.ElapsedMilliseconds} ms" +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");


            m_stopwatch.Reset();
            m_stopwatch.Start();

            var waterPasses = new TerrainToolsWaterPasses();
            waterPasses.SimulatePass(m_context, unityTerrainHeightmap);
            waterPasses.GenerateWaterMapsPass(m_context, unityTerrainHeightmap);

            TerrainToolsUtils.Log($"Water gpu commands recording took: {m_stopwatch.ElapsedMilliseconds} ms" +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");

            m_stopwatch.Stop();
            //-----------------------------------

            if (m_inputModule.IsMouseLeftClickUp() && m_terrainTapped) {
                m_modes[m_currentModeIndex].OnBrushUp(m_context);

                m_terrainTapped = false;
            }

            var realPointerPosition = m_inputModule.GetMousePosition();
            m_pointerPosition = Vector2.Lerp(m_pointerPosition, realPointerPosition, m_brushFallback);
            //m_pointerPosition = realPointerPosition;

            var ray = camera.ScreenPointToRay(m_pointerPosition);
            if (Physics.Raycast(ray, out RaycastHit hit, float.PositiveInfinity, ~0, QueryTriggerInteraction.Ignore) == false) {
                SubmitCommandBuffer(commandBuffer);
                return;
            }

            if (hit.transform.gameObject != terrain.gameObject) {
                SubmitCommandBuffer(commandBuffer);
                return;
            }
            if (eventSystem.IsPointerOverGameObject()) {
                SubmitCommandBuffer(commandBuffer);
                return;
            }

            var hitPoint = new Vector3(hit.point.x, terrain.transform.position.y, hit.point.z);
            var pointerTerrainPos = hitPoint - terrain.transform.position;

            var heightmapBrushPosition = brushSizeOps.BrushPointerPositionToTexelPosition(pointerTerrainPos, heightmapActualBrushSize, terrainSize, heightmapResolution);
            var alphamapBrushPosition = brushSizeOps.BrushPointerPositionToTexelPosition(pointerTerrainPos, splatmapActualBrushSize, terrainSize, alphamapResolution);

            newBrushData.heightmapBrushPosition = heightmapBrushPosition;
            newBrushData.alphamapBrushPosition = alphamapBrushPosition;
            newBrushData.pointerPosition = pointerTerrainPos;
            m_context.UpdateData(newBrushData);

            m_stopwatch.Reset();
            m_stopwatch.Start();

            m_modes[m_currentModeIndex].RenderHologram(m_context);

            m_stopwatch.Stop();

            TerrainToolsUtils.Log($"Hologram drawing took: {m_stopwatch.ElapsedMilliseconds} ms" +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");

            if (m_inputModule.IsMouseLeftClickDown()) {
                m_terrainTapped = true;

                m_modes[m_currentModeIndex].OnBrushDown(m_context);
            }

            if (m_terrainTapped == false) {
                SubmitCommandBuffer(commandBuffer);
                return;
            }

            RecordBrushCommands(commandBuffer);
            SubmitCommandBuffer(commandBuffer);
        }

        private void RecordBrushCommands(CommandBuffer commandBuffer) {
            m_stopwatch.Reset();
            m_stopwatch.Start();

            var currentMode = m_modes[m_currentModeIndex];
            // recording commands from current brush mode
            currentMode.Prepare(m_context);
            currentMode.OnBrushUpdate(m_context);
            currentMode.CopyResults(m_context);

            m_stopwatch.Stop();
            TerrainToolsUtils.Log($"Brush editing gpu commands recording took: {m_stopwatch.ElapsedMilliseconds} ms" +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");
        }

        private void SubmitCommandBuffer(CommandBuffer commandBuffer) {
            //commandBuffer.CopyTexture(m_context.GetTerrain().terrainData.heightmapTexture, m_context.GetTexture2D(ContextConstants.APIGetHeightTexture));

            m_stopwatch.Reset();
            m_stopwatch.Start();

            var fence = commandBuffer.CreateGraphicsFence(GraphicsFenceType.CPUSynchronisation, SynchronisationStageFlags.AllGPUOperations);
            m_fenceManager.RegisterFence(fence);

            Graphics.ExecuteCommandBuffer(commandBuffer);
            //HDRPTerrainToolsInjectionPass.CommandBuffer = commandBuffer;
            //HDRPTerrainToolsInjectionPass.SubmitPass = true;

            m_stopwatch.Stop();
            TerrainToolsUtils.Log($"Brush gpu commands immediate execution took: {m_stopwatch.ElapsedMilliseconds} ms" +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");

            var terrain = m_context.GetTerrain();

            m_stopwatch.Reset();
            m_stopwatch.Start();

            terrain.Flush();

            m_stopwatch.Stop();

            TerrainToolsUtils.Log($"Terarin flushing took : {m_stopwatch.ElapsedMilliseconds} ms" +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");
        }

        public TerrainToolsManager(Terrain terrain, TerrainToolsResources resources) {

            m_resources = resources;
            TerrainToolsUtils.LoggingEnabled = m_resources.DebugMode;

            m_stopwatch = new();

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

            TerrainToolsDebugView debugView = null;
            if (m_resources.DebugMode) {
                var debug = GameObject.Find("[Terrain Tools Texture Debug]");
                if (debug == null) {
                    debug = new GameObject("[Terrain Tools Texture Debug]");
                    debugView = debug.AddComponent<TerrainToolsDebugView>();
                } else {
                    debugView = debug.GetComponent<TerrainToolsDebugView>();
                }

                debugView.Clear();
            }


            // creating water
            WaterInstances waterInstances = new WaterInstances();
            waterInstances.WaterSurface = GameObject.Instantiate(m_resources.WaterPrefabs.WaterSurfacePrefab, terrain.transform).GetComponent<WaterSurface>();
            waterInstances.WaterExcluder = GameObject.Instantiate(m_resources.WaterPrefabs.WaterExcluderPrefab, terrain.transform).GetComponent<WaterExcluder>();
            waterInstances.WaterDeformDecal = GameObject.Instantiate(m_resources.WaterPrefabs.WaterDeformDecalPrefab, terrain.transform).GetComponent<WaterDecal>();
            waterInstances.IceLayer = GameObject.Instantiate(m_resources.WaterPrefabs.IceLayerPrefab, terrain.transform).GetComponent<IceLayer>();

            m_context = new TerrainToolsContext(terrain, m_resources, THREAD_GROUP_SIZE, debugView, waterInstances);

            var terrainSettingsOps = new TerrainSettingsOperations();
            terrainSettingsOps.SetTerrainSettings(terrain, m_resources);

            m_fenceManager = new();

            var commandBuffer = m_context.GetCommandBuffer();
            commandBuffer.SetRenderTarget(terrain.terrainData.heightmapTexture);
            commandBuffer.ClearRenderTarget(false, true, Color.black);

            Graphics.ExecuteCommandBuffer(commandBuffer);
            terrain.terrainData.DirtyHeightmapRegion(new RectInt(0, 0, terrain.terrainData.heightmapResolution, terrain.terrainData.heightmapResolution), TerrainHeightmapSyncControl.HeightAndLod);

        }

        protected virtual void Dispose(bool disposing) {
            if (!m_disposed) {
                if (disposing) {
                    m_context.Dispose();
                    m_context = null;
                }

                m_disposed = true;
            }
        }

        public void Dispose() {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }
    }
}