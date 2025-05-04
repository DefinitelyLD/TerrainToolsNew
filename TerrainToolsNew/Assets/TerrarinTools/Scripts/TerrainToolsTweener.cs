using UnityEngine;

namespace TerrainTools {
    public struct TerrainToolsTweener {
        public readonly void TweenHeightmapPass(IBrushContext context, RenderTexture output) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var data = context.GetBrushData().tweenData;

            var finalHeightmap = context.GetRenderTexture(ContextConstants.FinalTerrainHeightmap);
            var bufferHeightmap = context.GetRenderTexture(ContextConstants.BufferHeightmapTexture);

            var virtualWaterTexture = context.GetRenderTexture(ContextConstants.VirtualWaterMaskTexture);
            var finalWaterTexture = context.GetRenderTexture(ContextConstants.FinalWaterMaskTexture);
            var bufferWaterMask = context.GetRenderTexture(ContextConstants.BufferWaterMaskTexture);

            var dispatchSize = context.GetDispatchSize(finalHeightmap.GetSize());

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "HeightmapTexture", finalHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "OutputHeightmapTexture", bufferHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "TweenStateHeightmap", output);

            commandBuffer.SetComputeFloatParam(computeShader, "TweenStrength", data.strength);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", data.deltaTime);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.Tween, dispatchSize.x, dispatchSize.y, dispatchSize.z);
            commandBuffer.CopyTexture(bufferHeightmap, output);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "HeightmapTexture", virtualWaterTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "OutputHeightmapTexture", finalWaterTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "TweenStateHeightmap", bufferWaterMask);

            commandBuffer.SetComputeFloatParam(computeShader, "TweenStrength", data.strength * 0.5f);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.Tween, dispatchSize.x, dispatchSize.y, dispatchSize.z);
            commandBuffer.CopyTexture(finalWaterTexture, bufferWaterMask);
        }
    }
}