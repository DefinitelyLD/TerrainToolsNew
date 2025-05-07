using System;
using UnityEngine;

namespace TerrainTools {
    [TerrainBrush]
    public sealed class WaterRaiseTerrainBrush : TerrainBrush {
        public override BrushType GetBrushType() {
            return BrushType.Other;
        }

        public override void Prepare(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();

            var brushData = context.GetBrushData();
            var terrain = context.GetTerrain();
            var heightmapSize = terrain.terrainData.heightmapTexture.GetSize();

            var waterBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.WaterBrushResultMaskTexture);
            var addtiveWaterTexture = context.GetRenderTexture(ContextConstants.AdditiveWaterDensitymapTexture);

            var slicingOps = new SlicingOperations();
            var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.heightmapBrushPosition, heightmapSize);
            var slicedBrushSize = slicingOps.SliceBrushSize(brushData.heightmapBrushPosition, heightmapSize, brushData.heightmapActualBrushSize);
            var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.heightmapBrushPosition, heightmapSize);
            slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

            commandBuffer.CopyTexture(
                addtiveWaterTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                waterBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);
        }

        public override void OnBrushDown(IBrushContext context) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var brushData = context.GetBrushData();

            var brushShapeTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);
            var waterBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.WaterBrushResultMaskTexture);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.WaterRaiseBrush, "BrushMaskTexture", brushShapeTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.WaterRaiseBrush, "OutputBrushHeightmapTexture", waterBrushHeightmapResultTexture);

            commandBuffer.SetComputeFloatParam(computeShader, "BrushStrength", brushData.brushStrength);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushAngle", brushData.angle);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", brushData.deltaTime);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushHeight", brushData.brushHeight);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushStripCount", brushData.stripCount);

            commandBuffer.SetComputeIntParams(computeShader, "BrushPosition", brushData.heightmapBrushPosition.x, brushData.heightmapBrushPosition.y);
            commandBuffer.SetComputeIntParams(computeShader, "BrushSize", brushData.heightmapBrushSize.x, brushData.heightmapBrushSize.y);
            commandBuffer.SetComputeIntParams(computeShader, "ActualBrushSize", brushData.heightmapActualBrushSize.x, brushData.heightmapActualBrushSize.y);
        }

        public override void OnBrushUp(IBrushContext context) {
        }

        public override void OnBrushUpdate(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var waterBrushDispatchSize = context.GetBrushDispatchSize();

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.WaterRaiseBrush, waterBrushDispatchSize.x, waterBrushDispatchSize.y, waterBrushDispatchSize.z);

            var waterAdditiveDensity = context.GetRenderTexture(ContextConstants.AdditiveWaterDensitymapTexture);
            var waterBrushMaskResultTexture = context.GetRenderTexture(ContextConstants.WaterBrushResultMaskTexture);

            var brushData = context.GetBrushData();
            var heightmapSize = waterAdditiveDensity.GetSize();

            var slicingOps = new SlicingOperations();
            var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.heightmapBrushPosition, heightmapSize);
            var slicedBrushSize = slicingOps.SliceBrushSize(brushData.heightmapBrushPosition, heightmapSize, brushData.heightmapActualBrushSize);
            var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.heightmapBrushPosition, heightmapSize);
            slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

            commandBuffer.CopyTexture(waterBrushMaskResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                waterAdditiveDensity, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);
        }

        public override void CopyResults(IBrushContext context) {
            // nothing
        }
    }
}
