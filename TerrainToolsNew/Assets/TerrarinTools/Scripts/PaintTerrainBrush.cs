using System;
using System.Numerics;

namespace TerrainTools {
    public sealed class PaintTerrainBrush : TerrainBrush {
        public override BrushType GetBrushType() {
            return BrushType.Splatmap;
        }

        public override void OnBrushDown(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var brushData = context.GetBrushData();

            var resultSplatmap_0 = context.GetRenderTexture(ContextConstants.Splatmap_Brush_Result_0_Texture);
            var resultSplatmap_1 = context.GetRenderTexture(ContextConstants.Splatmap_Brush_Result_1_Texture);
            var brushShapeTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.PaintBrush, "OutputBrushSplatmapTexture_0", resultSplatmap_0);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.PaintBrush, "OutputBrushSplatmapTexture_1", resultSplatmap_1);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.PaintBrush, "BrushMaskTexture", brushShapeTexture);

            commandBuffer.SetComputeFloatParam(computeShader, "SplatmapId", brushData.splatIndex);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushStrength", brushData.brushStrength);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushAngle", brushData.angle);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", brushData.deltaTime);

            commandBuffer.SetComputeIntParams(computeShader, "BrushPosition", brushData.alphamapBrushPosition.x, brushData.alphamapBrushPosition.y);
            commandBuffer.SetComputeIntParams(computeShader, "BrushSize", brushData.alphamapBrushSize.x, brushData.alphamapBrushSize.y);
            commandBuffer.SetComputeIntParams(computeShader, "ActualBrushSize", brushData.alphamapActualBrushSize.x, brushData.alphamapActualBrushSize.y);

            unsafe {
                var splatChannelIndex = brushData.splatIndex % 4;
                var splatChannelMask = stackalloc int[4];
                for(var i = 0; i < 4; i++) {
                    splatChannelMask[i] = 0;
                }
                splatChannelMask[splatChannelIndex] = 1;

                commandBuffer.SetComputeIntParams(computeShader, "SplatmapChannelMask", splatChannelMask[0], splatChannelMask[1], splatChannelMask[2], splatChannelMask[3]);
            }
        }

        public override void OnBrushUp(IBrushContext context) {
            // nothing.
        }

        public override void OnBrushUpdate(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var dispatchSize = context.GetBrushDispatchSize();

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.PaintBrush, dispatchSize.x, dispatchSize.y, dispatchSize.z);
        }
    }
}
