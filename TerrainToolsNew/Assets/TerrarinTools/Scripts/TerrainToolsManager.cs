using System;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using Debug = UnityEngine.Debug;

namespace TerrainTools {

    public struct TerrainToolsManagerMutateData {
        public float brushStrength;
        public float brushAngle;
        public Vector2Int brushSize;
        public int brushHeight;

        public int brushShapeIndex;

        public Type brushType;

        public float brushFallback;
        public float deltaTime;
        public float tweenStrength;
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

        private float m_tweenStrength;

        private float m_brushFallback = 1;
        private Vector2 m_pointerPosition = Vector2.zero;

        private float m_deltaTime = 0.016f;

        private TerrainToolsContext m_context;

        private const int THREAD_GROUP_SIZE = 32;

        private bool m_disposed;
        private readonly Stopwatch m_stopwatch;

        private readonly FenceManager m_fenceManager;

        public void Mutate(TerrainToolsManagerMutateData data) {

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
        }

        public void Tick() {
            Debug.Assert(m_context != null, "Context is not initialized or Destroyed.");

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

            m_stopwatch.Reset();
            m_stopwatch.Start();

            var hasFencePassed = m_fenceManager.IsFencePassed();

            var hitPoint = new Vector3(hit.point.x, terrain.transform.position.y, hit.point.z);
            var pointerTerrainPos = hitPoint - terrain.transform.position;

            var brushSizeOps = new BrushSizeOperations();
            var texelBrushSize = brushSizeOps.BrushSizeToTexelSize(m_brushSize, terrainSize, heightmapResolution);
            var gpuBrushHeight = brushSizeOps.BrushHeightToGPUHeightValue(m_brushHeight, terrainSize);

            var actualBrushSize = brushSizeOps.TexelBrushSizeToActualBrushSize(texelBrushSize);

            var brushPosition = brushSizeOps.BrushPointerPositionToTexelPosition(pointerTerrainPos, actualBrushSize, terrainSize, heightmapResolution);
            var brushStripeCount = brushSizeOps.CalculateStripCount(m_brushSize, m_brushHeight);

            var newBrushData = new BrushData();
            newBrushData.brushPosition = brushPosition;
            newBrushData.brushSize = texelBrushSize;
            newBrushData.brushHeight = gpuBrushHeight;
            newBrushData.angle = m_brushAngle;
            newBrushData.stripCount = brushStripeCount;
            newBrushData.actualBrushSize = actualBrushSize;

            newBrushData.currentBrushIndex = m_currentBrushShapeIndex;
            newBrushData.brushStrength = m_brushStrength;
            newBrushData.deltaTime = m_deltaTime;
            newBrushData.hasResourceFencePassed = hasFencePassed;
            newBrushData.tweenData = new TweenData() {
                deltaTime = m_deltaTime,
                strength = m_tweenStrength,
            };

            TerrainToolsTextureDebug textureDebug = null;
            if (m_context.IsDebugMode()) {
                var debug = GameObject.Find("[Terrain Tools Texture Debug]");
                if (debug == null) {
                    debug = new GameObject("[Terrain Tools Texture Debug]");
                    textureDebug = debug.AddComponent<TerrainToolsTextureDebug>();
                }

                textureDebug.Clear();
            }

            m_context.UpdateData(newBrushData, textureDebug);

            var commandBuffer = m_context.GetCommandBuffer();
            commandBuffer.Clear();

            var currentMode = m_modes[m_currentModeIndex];

            // recording commands from current brush mode
            currentMode.Prepare(m_context);

            if (m_inputModule.IsMouseLeftClickDown())
                currentMode.OnBrushDown(m_context);

            currentMode.OnBrushUpdate(m_context);

            if (m_inputModule.IsMouseLeftClickUp())
                currentMode.OnBrushUp(m_context);

            currentMode.CopyResults(m_context);
            currentMode.Compose(m_context);

            var fence = commandBuffer.CreateGraphicsFence(GraphicsFenceType.CPUSynchronisation, SynchronisationStageFlags.AllGPUOperations);
            m_fenceManager.RegisterFence(fence);
            // -- --

            // sumbitting for execution
            HDRPTerrainToolsInjectionPass.CommandBuffer = commandBuffer;
            HDRPTerrainToolsInjectionPass.SubmitPass = true;

            m_stopwatch.Stop();
            TerrainToolsUtils.Log($"Brush gpu commands recording took: {m_stopwatch.ElapsedMilliseconds} ms" +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                $" | {(m_stopwatch.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");
        }

        public TerrainToolsManager(Terrain terrain, TerrainToolsResources resources) {

            m_resources = resources;

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

            m_context = new TerrainToolsContext(terrain, m_resources, THREAD_GROUP_SIZE);
            TerrainToolsUtils.LoggingEnabled = m_resources.DebugMode;

            var terrainSettingsOps = new TerrainSettingsOperations();
            terrainSettingsOps.SetTerrainSettings(terrain, m_resources);

            m_fenceManager = new();
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