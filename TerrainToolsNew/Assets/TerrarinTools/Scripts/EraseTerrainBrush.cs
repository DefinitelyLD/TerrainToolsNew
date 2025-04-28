using System;
using UnityEngine;

namespace TerrainTools {

    [TerrainBrush]
    public sealed class EraseTerrainBrush : TerrainBrush {
        public override BrushType GetBrushType() {
            return BrushType.Heightmap;
        }

        public override void OnBrushDown(IBrushContext context) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var brushHeightmapTexture = context.GetRenderTexture(ContextConstants.TerrainBrushHeightTexture);
            var outputBrushHeightmapTexture = context.GetRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);
            var brushShapeTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);
            var terrainHeightmapTexture = context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

            var brushData = context.GetBrushData();

            var heightmapSize = new Vector2Int(terrainHeightmapTexture.width, terrainHeightmapTexture.height);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.EraseBrush, "TerrainHeightmapTexture", terrainHeightmapTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.EraseBrush, "BrushHeightmapTexture", brushHeightmapTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.EraseBrush, "BrushMaskTexture", brushShapeTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.EraseBrush, "OutputBrushHeightmapTexture", outputBrushHeightmapTexture);

            commandBuffer.SetComputeFloatParam(computeShader, "BrushStrength", brushData.brushStrength);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushAngle", brushData.angle);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", brushData.deltaTime);

            commandBuffer.SetComputeIntParams(computeShader, "BrushPosition", brushData.brushPosition.x, brushData.brushPosition.y);
            commandBuffer.SetComputeIntParams(computeShader, "BrushSize", brushData.brushSize.x, brushData.brushSize.y);
            commandBuffer.SetComputeIntParams(computeShader, "ActualBrushSize", brushData.actualBrushSize.x, brushData.actualBrushSize.y);
        }

        public override void OnBrushUp(IBrushContext context) {
        }

        public override void OnBrushUpdate(IBrushContext context) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var dispatchSize = context.GetDispatchSize();

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.EraseBrush, dispatchSize.x, dispatchSize.y, dispatchSize.z);
        }
    }
}
