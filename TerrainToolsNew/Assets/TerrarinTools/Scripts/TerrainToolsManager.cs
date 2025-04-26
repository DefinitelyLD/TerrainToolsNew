using PlasticPipe.PlasticProtocol.Messages;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using Debug = UnityEngine.Debug;
using Object = UnityEngine.Object;

namespace TerrainTools {

    public abstract class TerrainBrush {

        public virtual void Prepare(IBrushContext context) {
            // default implementation does nothing
        }

        public abstract void OnBrushDown(IBrushContext context);
        public abstract void OnBrushUpdate(IBrushContext context);
        public abstract void OnBrushUp(IBrushContext context);

        public virtual void RenderHologram(IBrushContext context) {
            // default implementation does nothing
        }
    }

    public interface IBrushContext {

        CommandBuffer GetCommandBuffer();

        bool IsTexture2DExists(string name);
        bool IsRenderTextureExists(string name);
        bool IsGraphicsTextureExists(string name);

        Texture2D CreateTexture2D(string name, Vector2Int size, GraphicsFormat format);
        RenderTexture CreateRenderTexture(string name, Vector2Int size, GraphicsFormat format);
        GraphicsTexture CreateGraphicsTexture(string name, Vector2Int size, GraphicsFormat format);

        Texture2D GetTexture2D(string name);
        RenderTexture GetRenderTexture(string name);
        GraphicsTexture GetGraphicsTexture(string name);

        void DestroyTexture2D(string name);
        void DestroyRenderTexture(string name);
        void DestroyGraphicsTexture(string name);

        bool IsMeshsExists(string name);
        Mesh GetMesh(string name);
        Mesh CreateMesh(string name, Vector3[] vertices, int[] triangles, Vector2[] uv, bool supportLargeIndcies);
        void DestroyMesh(string name);

        Terrain GetTerrain();

        ComputeShader GetCompute();

        BrushData GetBrushData();
        Texture2D GetCurrentBrushShape();
    }

    public sealed class TerrainToolsContext : IBrushContext, IDisposable {

        private bool m_disposed;

        private Terrain m_terrain;
        private CommandBuffer m_commandBuffer;
        private readonly ComputeShader m_compute;

        private readonly Texture2D[] m_brushShapes;
        private BrushData m_brushData;

        private readonly Dictionary<string, RenderTexture> m_renderTextures;
        private readonly Dictionary<string, Texture2D> m_textures;
        private readonly Dictionary<string, GraphicsTexture> m_graphicsTexture;
        private readonly Dictionary<string, Mesh> m_meshes;

        public TerrainToolsContext(Terrain terrain, ComputeShader compute, Texture2D[] brushShapes) {
            m_terrain = terrain;

            m_commandBuffer = new CommandBuffer();
            m_compute = compute;

            m_textures = new();
            m_renderTextures = new();
            m_graphicsTexture = new();
            m_meshes = new();
            m_brushShapes = brushShapes;
        }

        public void UpdateData(BrushData brushData) {
            m_brushData = brushData;
        }

        private void Dispose(bool disposing) {
            if (!m_disposed) {
                if (disposing) {
                    m_terrain = null;

                    m_meshes.Clear();
                    m_commandBuffer.Dispose();
                    m_commandBuffer = null;

                    foreach (var texture in m_textures) {
                        if (texture.Value != null) {
                            Object.Destroy(texture.Value);
                        }
                    }
                    m_textures.Clear();

                    foreach (var renderTexture in m_renderTextures) {
                        if (renderTexture.Value != null) {
                            renderTexture.Value.Release();
                            Object.Destroy(renderTexture.Value);
                        }
                    }
                    m_renderTextures.Clear();

                    foreach (var graphicsTexture in m_graphicsTexture) {
                        if (graphicsTexture.Value != null) {
                            graphicsTexture.Value.Dispose();
                        }
                    }
                    m_graphicsTexture.Clear();

                }


                m_disposed = true;
            }
        }

        ~TerrainToolsContext() {
            Dispose(disposing: false);
        }

        public void Dispose() {
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }

        public bool IsTexture2DExists(string name) {
            Debug.Assert(name != null && name != string.Empty);
            return m_textures.ContainsKey(name);
        }

        public bool IsRenderTextureExists(string name) {
            Debug.Assert(name != null && name != string.Empty);
            return m_renderTextures.ContainsKey(name);
        }

        public bool IsGraphicsTextureExists(string name) {
            Debug.Assert(name != null && name != string.Empty);
            return m_graphicsTexture.ContainsKey(name);
        }

        public Texture2D CreateTexture2D(string name, Vector2Int size, GraphicsFormat format) {
            Debug.Assert(name != null && name != string.Empty);
            Debug.Assert(IsTexture2DExists(name) == false, $"Texture2D with name {name} already exists");

            var texture = new Texture2D(size.x, size.y, format, 0, TextureCreationFlags.None);
            m_textures.Add(name, texture);

            return texture;
        }

        public RenderTexture CreateRenderTexture(string name, Vector2Int size, GraphicsFormat format) {
            Debug.Assert(name != null && name != string.Empty);
            Debug.Assert(IsRenderTextureExists(name) == false, $"RenderTexture with name {name} already exists");

            var renderTexture = new RenderTexture(size.x, size.y, 0, format, 0);
            m_renderTextures.Add(name, renderTexture);

            return renderTexture;
        }

        public GraphicsTexture CreateGraphicsTexture(string name, Vector2Int size, GraphicsFormat format) {
            Debug.Assert(name != null && name != string.Empty);
            Debug.Assert(IsGraphicsTextureExists(name) == false, $"GraphicsTexture with name {name} already exists");

            GraphicsTextureDescriptor desc = new GraphicsTextureDescriptor();
            desc.width = size.x;
            desc.height = size.y;
            desc.depth = 0;
            desc.arrayLength = 1;
            desc.format = format;
            desc.dimension = TextureDimension.Tex2D;
            desc.mipCount = 0;
            desc.flags = GraphicsTextureDescriptorFlags.None;
            desc.numSamples = 0;

            var graphicsTexture = new GraphicsTexture(desc);
            m_graphicsTexture.Add(name, graphicsTexture);

            return graphicsTexture;
        }

        public Texture2D GetTexture2D(string name) {
            Debug.Assert(name != null && name != string.Empty);
            Debug.Assert(m_graphicsTexture.ContainsKey(name), $"Texture2D with name {name} does not exist");

            return m_textures[name];
        }

        public RenderTexture GetRenderTexture(string name) {
            Debug.Assert(name != null && name != string.Empty);
            Debug.Assert(m_renderTextures.ContainsKey(name), $"RenderTexture with name {name} does not exist");

            return m_renderTextures[name];
        }

        public GraphicsTexture GetGraphicsTexture(string name) {
            Debug.Assert(name != null && name != string.Empty);
            Debug.Assert(m_graphicsTexture.ContainsKey(name), $"GraphicsTexture with name {name} does not exist");

            return m_graphicsTexture[name];
        }

        public void DestroyTexture2D(string name) {
            Debug.Assert(name != null && name != string.Empty);

            var texture = GetTexture2D(name);
            Object.Destroy(texture);

            m_textures.Remove(name);
        }

        public void DestroyRenderTexture(string name) {
            Debug.Assert(name != null && name != string.Empty);

            var renderTexture = GetRenderTexture(name);
            renderTexture.Release();
            Object.Destroy(renderTexture);

            m_renderTextures.Remove(name);
        }

        public void DestroyGraphicsTexture(string name) {
            Debug.Assert(name != null && name != string.Empty);

            var graphicsTexture = GetGraphicsTexture(name);
            graphicsTexture.Dispose();

            m_graphicsTexture.Remove(name);
        }

        public bool IsMeshsExists(string name) {
            Debug.Assert(name != null && name != string.Empty);
            return m_meshes.ContainsKey(name);
        }

        public Mesh GetMesh(string name) {
            Debug.Assert(name != null && name != string.Empty);
            Debug.Assert(IsMeshsExists(name), $"Mesh with name {name} does not exist");

            return m_meshes[name];
        }

        public Mesh CreateMesh(string name, Vector3[] vertices, int[] triangles, Vector2[] uv, bool supportLargeIndcies) {
            Debug.Assert(name != null && name != string.Empty);


            var mesh = new Mesh();
            if (supportLargeIndcies) {
                mesh.indexFormat = IndexFormat.UInt32;
            }

            mesh.vertices = vertices;
            mesh.triangles = triangles;
            mesh.uv = uv;

            mesh.RecalculateNormals();
            mesh.RecalculateBounds();

            m_meshes.Add(name, mesh);

            return mesh;
        }

        public void DestroyMesh(string name) {
            Debug.Assert(name != null && name != string.Empty);

            m_meshes.Remove(name);
        }

        public Terrain GetTerrain() {
            return m_terrain;
        }

        public CommandBuffer GetCommandBuffer() {
            return m_commandBuffer;
        }

        public ComputeShader GetCompute() {
            return m_compute;
        }

        public BrushData GetBrushData() {
            return m_brushData;
        }

        public Texture2D GetCurrentBrushShape() {
            return m_brushShapes[m_brushData.currentBrushIndex];
        }
    }



    public class TerrainToolsManager {
        private readonly TerrainBrush[] m_brushes;
        private int m_currentBrushIndex = 0;

        private readonly InputModule m_inputModule;







        public TerrainToolsManager() {

            // getting all brushes defined in this assembly
            var assembly = Assembly.GetAssembly(typeof(TerrainToolsManager));
            var brushesTypes = assembly
                .GetTypes()
                .Where(type => type.CustomAttributes.Where(info => info.AttributeType == typeof(TerrainBrushAttribute)).Count() > 0)
                .ToArray();
            var brushCount = brushesTypes.Count();
            Debug.Assert(brushCount > 0, $"No brushes found in the assembly: {assembly.FullName}");

            // creating instances of the brushes
            m_brushes = new TerrainBrush[brushCount];
            try {
                for (var i = 0; i < brushCount; i++) {
                    m_brushes[i] = (TerrainBrush)Activator.CreateInstance(brushesTypes[i]);

                    TerrainToolsUtils.Log($"Brush created: {m_brushes[i].GetType().Name}");
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
        }
    }
}
