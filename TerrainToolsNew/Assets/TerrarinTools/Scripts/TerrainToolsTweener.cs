using UnityEngine;

namespace TerrainTools {
    public struct TerrainToolsTweener {
        public readonly void TweenHeightmapPass(IBrushContext context, TweenData data, RenderTexture output) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var terrain = context.GetTerrain();

            var finalHeightmap = context.GetRenderTexture(ContextConstants.FinalTerrainHeightmap);
            var bufferHeightmap = context.GetRenderTexture(ContextConstants.BufferHeightmapTexture);

            var dispatchSize = context.GetDispatchSize(finalHeightmap.GetSize());

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "HeightmapTexture", finalHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "OutputHeightmapTexture", bufferHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "TweenStateHeightmap", output);

            commandBuffer.SetComputeFloatParam(computeShader, "TweenStrength", data.strength);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", data.deltaTime);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.Tween, dispatchSize.x, dispatchSize.y, dispatchSize.z);

            commandBuffer.CopyTexture(bufferHeightmap, output);
        }
    }
}