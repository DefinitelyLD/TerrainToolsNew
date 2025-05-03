using UnityEngine;

namespace TerrainTools {
    public struct TerrainToolsMasker {
        public readonly void MaskHeightmapPass(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var terrain = context.GetTerrain();
            var brushData = context.GetBrushData();

            var finalHeightmap = context.GetRenderTexture(ContextConstants.FinalTerrainHeightmap);
            var heightmapMask = context.GetRenderTexture(ContextConstants.TerrainMaskTexture);
            var bufferHeightmap = context.GetRenderTexture(ContextConstants.BufferHeightmapTexture);
            var terrainMask = context.GetRenderTexture(ContextConstants.TerrainMaskTexture);

            var dispatchSize = context.GetDispatchSize(bufferHeightmap.GetSize());

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.MaskHeightmap, "HeightmapTexture", finalHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.MaskHeightmap, "HeightmapMaskTexture", heightmapMask);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.MaskHeightmap, "OutputHeightmapTexture", bufferHeightmap);

            commandBuffer.SetComputeFloatParam(computeShader, "TerrainMaskBaseHeight", brushData.terrainMaskBaseHeight);
            commandBuffer.SetComputeFloatParam(computeShader, "TerrainMaskBorder", brushData.terrainMaskBorder);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.MaskHeightmap, dispatchSize.x, dispatchSize.y, dispatchSize.z);

            commandBuffer.CopyTexture(bufferHeightmap, finalHeightmap);

            commandBuffer.CopyTexture(terrainMask, terrain.terrainData.holesTexture);
        }
    }
}
