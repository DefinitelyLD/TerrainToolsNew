using UnityEngine;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;

namespace TerrainTools {
    public interface IBrushContext {

        CommandBuffer GetCommandBuffer();

        bool IsTexture2DExists(string name);
        bool IsRenderTextureExists(string name);
        bool IsGraphicsTextureExists(string name);

        Texture2D CreateTexture2D(string name, Vector2Int size, GraphicsFormat format);
        RenderTexture CreateRenderTexture(string name, Vector2Int size, GraphicsFormat format, bool readWrite);
        GraphicsTexture CreateGraphicsTexture(string name, Vector2Int size, GraphicsFormat format, bool readWrite);

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
}
