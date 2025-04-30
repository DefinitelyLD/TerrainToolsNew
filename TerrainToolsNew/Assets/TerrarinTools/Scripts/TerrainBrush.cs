using System;
using UnityEngine;

namespace TerrainTools {

    public abstract class TerrainBrush {

        public abstract BrushType GetBrushType();

        public virtual void Prepare(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var brushData = context.GetBrushData();
            var blitMaterial = context.GetBlitMaterial();

            if (GetBrushType() == BrushType.Heightmap) {

                var virtualTerrainHeightmap = context.GetRenderTexture(ContextConstants.VirtualTerrainHeightmap);
                var terrainHeightmap = context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

                var brushHeightmap = context.GetRenderTexture(ContextConstants.TerrainBrushHeightTexture);
                var brushResultHeightmap = context.GetRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);

                var heightmapSize = new Vector2Int(virtualTerrainHeightmap.width, virtualTerrainHeightmap.height);

                // slicing brush size and position to be inbounds of the heightmap.
                var slicingOps = new SlicingOperations();
                var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.brushPosition, heightmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(brushData.brushPosition, heightmapSize, brushData.actualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.brushPosition, heightmapSize);
                slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

                commandBuffer.Blit(virtualTerrainHeightmap, terrainHeightmap, blitMaterial);

                // getting brush heightmap
                commandBuffer.CopyTexture(
                    virtualTerrainHeightmap, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                    brushHeightmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);

                // copy the brush height to result brush heightmap
                commandBuffer.Blit(brushHeightmap, brushResultHeightmap, blitMaterial);
            }
        }

        public abstract void OnBrushDown(IBrushContext context);
        public abstract void OnBrushUpdate(IBrushContext context);
        public abstract void OnBrushUp(IBrushContext context);

        public virtual void CopyResults(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var brushData = context.GetBrushData();

            if (GetBrushType() == BrushType.Heightmap) {
                var virtualTerrainHeightmap = context.GetRenderTexture(ContextConstants.VirtualTerrainHeightmap);
                var brushResultHeightmap = context.GetRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);

                var heightmapSize = new Vector2Int(virtualTerrainHeightmap.width, virtualTerrainHeightmap.height);

                // slicing brush size and position to be inbounds of the heightmap.
                var slicingOps = new SlicingOperations();
                var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.brushPosition, heightmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(brushData.brushPosition, heightmapSize, brushData.actualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.brushPosition, heightmapSize);
                slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

                commandBuffer.CopyTexture(brushResultHeightmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                    virtualTerrainHeightmap, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);
            }
        }
        public virtual void Compose(IBrushContext context) {
            if (GetBrushType() == BrushType.Heightmap) {
                // composing
                var composer = new TerrainToolsComposer();
                composer.ComposeHeightmapPass(context);

                // masking
                var masker = new TerrainToolsMasker();
                masker.MaskHeightmapPass(context);
            }
        }


        public virtual void RenderHologram(IBrushContext context) {

        }
    }
    
}
