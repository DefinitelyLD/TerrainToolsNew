using UnityEngine;

namespace TerrainTools {
    public struct TerrainToolsComposer {
        public readonly void ComposeHeightmapPass(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var finalTerrainHeightmap = context.GetRenderTexture(ContextConstants.FinalTerrainHeightmap);
            var virtualTerrainHeightmap = context.GetRenderTexture(ContextConstants.VirtualTerrainHeightmap);
            var bufferHeightmap = context.GetRenderTexture(ContextConstants.BufferHeightmapTexture);

            var heightmapCompositives = context.GetAllHeightmapCompositives();

            var dispatchSize = context.GetDispatchSize(finalTerrainHeightmap.GetSize());

            commandBuffer.SetRenderTarget(bufferHeightmap);
            commandBuffer.ClearRenderTarget(false, true, Color.black);

            foreach (var compositive in heightmapCompositives) {
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Compose, "HeightmapTexture", bufferHeightmap);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Compose, "CompositiveHeightmapTexture", compositive);

                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Compose, "OutputHeightmapTexture", finalTerrainHeightmap);

                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.Compose, dispatchSize.x, dispatchSize.y, dispatchSize.z);

                commandBuffer.CopyTexture(finalTerrainHeightmap, bufferHeightmap);
            }
        }
    }
    
}