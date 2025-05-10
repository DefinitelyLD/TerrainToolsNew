using UnityEngine;

namespace TerrainTools {
    public struct TerrainToolsTweener {
        public readonly void TweenHeightmapPass(IBrushContext context, RenderTexture outputHeightmap, Texture2D outputSplat0, Texture2D outputSplat1) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var data = context.GetBrushData().tweenData;

            var finalHeightmap = context.GetRenderTexture(ContextConstants.FinalTerrainHeightmap);
            var bufferHeightmap = context.GetRenderTexture(ContextConstants.BufferHeightmapTexture);

            var virtualSplatmap0 = context.GetRenderTexture(ContextConstants.VirtualSplatmap_0_Texture);
            var virtualSplatmap1 = context.GetRenderTexture (ContextConstants.VirtualSplatmap_0_Texture);

            var bufferSplatmap0 = context.GetRenderTexture(ContextConstants.BufferSplatmap_0_Texture);
            var bufferSplatmap1 = context.GetRenderTexture(ContextConstants.BufferSplatmap_1_Texture);

            var heightmapDispatchSize = context.GetDispatchSize(finalHeightmap.GetSize());

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "HeightmapTexture", finalHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "OutputHeightmapTexture", bufferHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.Tween, "TweenStateHeightmap", outputHeightmap);

            commandBuffer.SetComputeFloatParam(computeShader, "TweenStrength", data.strength);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", data.deltaTime);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.Tween, heightmapDispatchSize.x, heightmapDispatchSize.y, heightmapDispatchSize.z);
            commandBuffer.CopyTexture(bufferHeightmap, outputHeightmap);

            if (outputSplat0 != null) {

                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.TweenSplats, "SplatmapTexture_0", virtualSplatmap0);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.TweenSplats, "SplatmapTexture_1", virtualSplatmap1);

                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.TweenSplats, "OutputBrushSplatmapTexture_0", bufferSplatmap0);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.TweenSplats, "OutputBrushSplatmapTexture_1", bufferSplatmap1);

                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.TweenSplats, "TweenStateSplatmapTexture_0", outputSplat0);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.TweenSplats, "TweenStateSplatmapTexture_1", outputSplat1);

                var splatmapDispatchSize = context.GetDispatchSize(bufferSplatmap0.GetSize());
                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.TweenSplats, splatmapDispatchSize.x, splatmapDispatchSize.y, splatmapDispatchSize.z);

                commandBuffer.CopyTexture(virtualSplatmap0, 0, 0, bufferSplatmap0, 0, 0);
                commandBuffer.CopyTexture(virtualSplatmap1, 0, 0, bufferSplatmap1, 0, 0);

                commandBuffer.GenerateMips(bufferSplatmap0);
                commandBuffer.GenerateMips(bufferSplatmap1);

                commandBuffer.CopyTexture(bufferSplatmap0, outputSplat0);
                commandBuffer.CopyTexture(bufferSplatmap1, outputSplat1);
            }
        }
    }
}