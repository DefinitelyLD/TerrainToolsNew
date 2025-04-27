using System;
using System.Collections.Generic;
using System.Data;
using UnityEngine;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using Debug = UnityEngine.Debug;
using Object = UnityEngine.Object;

namespace TerrainTools {

    public sealed class TerrainToolsContext : IBrushContext, IDisposable {

        private bool m_disposed;

        private Terrain m_terrain;
        private CommandBuffer m_commandBuffer;

        private readonly TerrainToolsResources m_resources;
        private BrushData m_brushData;

        private readonly Dictionary<string, RenderTexture> m_renderTextures;
        private readonly Dictionary<string, Texture2D> m_textures;
        private readonly Dictionary<string, GraphicsTexture> m_graphicsTexture;
        private readonly Dictionary<string, Mesh> m_meshes;

        public readonly int THREAD_GROUP_SIZE;

        public TerrainToolsContext(Terrain terrain, TerrainToolsResources resources, int threadGroupSize) {
            m_terrain = terrain;

            m_commandBuffer = new CommandBuffer();
            m_resources = resources;

            m_textures = new();
            m_renderTextures = new();
            m_graphicsTexture = new();
            m_meshes = new();
            THREAD_GROUP_SIZE = threadGroupSize;
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

        public RenderTexture CreateRenderTexture(string name, Vector2Int size, GraphicsFormat format, bool readWrite) {
            Debug.Assert(name != null && name != string.Empty);
            Debug.Assert(IsRenderTextureExists(name) == false, $"RenderTexture with name {name} already exists");


            var desc = new RenderTextureDescriptor();
            desc.volumeDepth = 1;
            desc.useMipMap = false;
            desc.bindMS = false;
            desc.graphicsFormat = format;
            desc.depthBufferBits = 0;
            desc.dimension = TextureDimension.Tex2D;
            desc.width = size.x;
            desc.height = size.y;
            desc.enableRandomWrite = readWrite;
            desc.msaaSamples = 1;

            var renderTexture = new RenderTexture(desc);
            m_renderTextures.Add(name, renderTexture);

            return renderTexture;
        }

        public GraphicsTexture CreateGraphicsTexture(string name, Vector2Int size, GraphicsFormat format, bool readWrite) {
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
            desc.flags = GraphicsTextureDescriptorFlags.RandomWriteTarget;
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
            return m_resources.TerrainBrushesCompute;
        }

        public BrushData GetBrushData() {
            return m_brushData;
        }

        public Texture2D GetCurrentBrushShape() {
            return m_resources.Brushes[m_brushData.currentBrushIndex];
        }

        public Vector3Int GetDispatchSize() {
            return new Vector3Int(
                m_brushData.actualBrushSize.y / THREAD_GROUP_SIZE + 1,
                m_brushData.actualBrushSize.y / THREAD_GROUP_SIZE + 1,
                1
            );
        }

        public int GetThreadGroupSize() {
            return THREAD_GROUP_SIZE;
        }
    }
}
