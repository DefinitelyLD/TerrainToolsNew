namespace TerrainTools {
    public struct TerrainToolsComposer {
        public readonly void ComposeHeightmapPass(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var finalTerrainHeightmap = context.GetRenderTexture(ContextConstants.FinalTerrainHeightmap);
            var virtualTerrainHeightmap = context.GetRenderTexture(ContextConstants.VirtualTerrainHeightmap);
            var terrainHeightmap = context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

            var heightmapCompositives = context.GetAllHeightmapCompositives();

            commandBuffer.CopyTexture(virtualTerrainHeightmap, finalTerrainHeightmap);
            var dispatchSize = context.GetDispatchSize(finalTerrainHeightmap.GetSize());

            foreach (var compositive in heightmapCompositives) {
                commandBuffer.CopyTexture(finalTerrainHeightmap, terrainHeightmap);

                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Compose, "HeightmapTexture", terrainHeightmap);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Compose, "CompositiveTexture", compositive);

                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Compose, "OutputHeightmapTexture", finalTerrainHeightmap);

                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.Compose, dispatchSize.x, dispatchSize.y, dispatchSize.z);
            }
        }
    }
    
}
