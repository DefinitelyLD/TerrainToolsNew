using System;
using UnityEngine;

namespace TerrainTools {
    [TerrainBrush]
    public sealed class StripsTerrainBrush : TerrainBrush {

        private const string PATTERN_TEXTURE = "PatternTexture";
        private const string PATTERN_BRUSH_HEIGHTMAP_RESULT_TEXTURE = "PatternBrushTexture";

        public override BrushType GetBrushType() {
            return BrushType.Heightmap;
        }
        public override bool AllowCopyBrushHeightmapResultToTerrainHeightmap() {
            return false;
        }

        public override void OnBrushDown(IBrushContext context) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var brushHeightmapTexture = context.GetRenderTexture(ContextConstants.TerrainBrushHeightTexture);
            var outputBrushHeightmapTexture = context.GetRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);
            var brushShapeTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);
            var terrainHeightmapTexture = context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

            var brushData = context.GetBrushData();

            var terrain = context.GetTerrain();
            var heightmapSize = new Vector2Int(terrainHeightmapTexture.width, terrainHeightmapTexture.height);
            var heightmapResolution = new Vector2Int(terrain.terrainData.heightmapResolution, terrain.terrainData.heightmapResolution);
            var terrainHeightmapFormat = terrain.terrainData.heightmapTexture.graphicsFormat;

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.StripsBrush, "TerrainHeightmapTexture", terrainHeightmapTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.StripsBrush, "BrushHeightmapTexture", brushHeightmapTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.StripsBrush, "BrushMaskTexture", brushShapeTexture);

            commandBuffer.SetComputeFloatParam(computeShader, "BrushStrength", brushData.brushStrength);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushAngle", brushData.angle);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", brushData.deltaTime);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushHeight", brushData.brushHeight);
            commandBuffer.SetComputeIntParam(computeShader, "BrushStripCount", brushData.stripCount);

            commandBuffer.SetComputeIntParams(computeShader, "BrushPosition", brushData.brushPosition.x, brushData.brushPosition.y);
            commandBuffer.SetComputeIntParams(computeShader, "BrushSize", brushData.brushSize.x, brushData.brushSize.y);
            commandBuffer.SetComputeIntParams(computeShader, "ActualBrushSize", brushData.actualBrushSize.x, brushData.actualBrushSize.y);


            if(context.IsRenderTextureExists(PATTERN_BRUSH_HEIGHTMAP_RESULT_TEXTURE) == false) {
                context.CreateRenderTexture(PATTERN_BRUSH_HEIGHTMAP_RESULT_TEXTURE, brushData.actualBrushSize, terrainHeightmapFormat, true);
            }

            var patternBrushHeightmapResultTexture = context.GetRenderTexture(PATTERN_BRUSH_HEIGHTMAP_RESULT_TEXTURE);

            if(patternBrushHeightmapResultTexture.CheckSize(brushData.actualBrushSize) == false) {
                if (!brushData.hasResourceFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(PATTERN_BRUSH_HEIGHTMAP_RESULT_TEXTURE);
                patternBrushHeightmapResultTexture = context.CreateRenderTexture(PATTERN_BRUSH_HEIGHTMAP_RESULT_TEXTURE, brushData.actualBrushSize, terrainHeightmapFormat, true);
            }

            if (context.IsRenderTextureExists(PATTERN_TEXTURE) == false) {
                context.CreateRenderTexture(PATTERN_TEXTURE, heightmapResolution, terrainHeightmapFormat, false);
            }

            var patternTexture = context.GetRenderTexture(PATTERN_TEXTURE);

            if (patternTexture.CheckSize(heightmapResolution) == false) {
                if (!brushData.hasResourceFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(PATTERN_TEXTURE);
                patternTexture = context.CreateRenderTexture(PATTERN_TEXTURE, heightmapResolution, terrainHeightmapFormat, false);
            }

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.StripsBrush, "OutputBrushHeightmapTexture", patternBrushHeightmapResultTexture);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.ComposePatterns, "BrushMaskTexture", brushShapeTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.ComposePatterns, "OutputBrushHeightmapTexture", patternBrushHeightmapResultTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.ComposePatterns, "BrushHeightmapTexture", brushHeightmapTexture);
        }

        public override void OnBrushUp(IBrushContext context) {
        }

        public override void OnBrushUpdate(IBrushContext context) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var stripBrushDispatchSize = context.GetDispatchSize();

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.StripsBrush, stripBrushDispatchSize.x, stripBrushDispatchSize.y, stripBrushDispatchSize.z);

            var patternTexture = context.GetRenderTexture(PATTERN_TEXTURE);
            var patternBrushHeightmapResultTexture = context.GetRenderTexture(PATTERN_BRUSH_HEIGHTMAP_RESULT_TEXTURE);

            var brushData = context.GetBrushData();
            var terrain = context.GetTerrain();

            var heightmapSize = new Vector2Int(terrain.terrainData.heightmapResolution, terrain.terrainData.heightmapResolution);

            var slicingOps = new SlicingOperations();
            var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.brushPosition, heightmapSize);
            var slicedBrushSize = slicingOps.SliceBrushSize(brushData.brushPosition, heightmapSize, brushData.actualBrushSize);
            var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.brushPosition, heightmapSize);
            slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

            commandBuffer.CopyTexture(patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                patternTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);

            var composeDispatchSize = context.GetDispatchSize(heightmapSize);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.ComposePatterns, composeDispatchSize.x, composeDispatchSize.y, composeDispatchSize.z);

            commandBuffer.CopyTexture(patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                terrain.terrainData.heightmapTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);
        }
    }
}
