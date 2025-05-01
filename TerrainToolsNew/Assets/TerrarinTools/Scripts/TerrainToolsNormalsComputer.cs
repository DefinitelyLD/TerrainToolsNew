using UnityEngine;

namespace TerrainTools {
    public struct TerrainToolsNormalsComputer {
        public readonly void ComputeNormalsPass(IBrushContext context, RenderTexture output) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var blitMaterial = context.GetBlitMaterial();

            var terrain = context.GetTerrain();

            var bufferNormalmap = context.GetRenderTexture(ContextConstants.BufferNormalmapTexture);
            var unityTerrainHeightmap = terrain.terrainData.heightmapTexture;

            var dispatchSize = context.GetDispatchSize(bufferNormalmap.GetSize());
            var terrainSize = terrain.terrainData.size;

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.ComputeNormals, "NormalmapTexture", bufferNormalmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.ComputeNormals, "HeightmapTexture", unityTerrainHeightmap);

            commandBuffer.SetComputeFloatParams(computeShader, "TerrainSize", terrainSize.x, terrainSize.y, terrainSize.z);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.ComputeNormals, dispatchSize.x, dispatchSize.y, dispatchSize.z);

            commandBuffer.CopyTexture(bufferNormalmap, 0, 0, output, 0, 0);
            commandBuffer.GenerateMips(output);
        }
    }
}