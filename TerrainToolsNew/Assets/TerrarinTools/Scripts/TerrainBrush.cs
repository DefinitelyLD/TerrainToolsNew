using UnityEngine;

namespace TerrainTools {

    public abstract class TerrainBrush {
        public abstract BrushType GetBrushType();

        public virtual void Prepare(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var blitMaterial = context.GetBlitMaterial();

            var brushData = context.GetBrushData();
            var terrain = context.GetTerrain();

            if (GetBrushType() == BrushType.Heightmap) {

                var heightmapSize = terrain.terrainData.heightmapTexture.GetSize();
                var terrainHeightmap = context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

                var virtualTerrainHeightmap = context.GetRenderTexture(ContextConstants.VirtualTerrainHeightmap);

                var brushHeightmap = context.GetRenderTexture(ContextConstants.TerrainBrushHeightTexture);
                var brushResultHeightmap = context.GetRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);

                // slicing brush size and position to be inbounds of the heightmap.
                var slicingOps = new SlicingOperations();
                var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.heightmapBrushPosition, heightmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(brushData.heightmapBrushPosition, heightmapSize, brushData.heightmapActualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.heightmapBrushPosition, heightmapSize);
                slicedBrushPositionShift = new Vector2Int(Mathf.Abs(slicedBrushPositionShift.x), Mathf.Abs(slicedBrushPositionShift.y));

                commandBuffer.Blit(virtualTerrainHeightmap, terrainHeightmap, blitMaterial);

                // getting brush heightmap
                commandBuffer.CopyTexture(
                    virtualTerrainHeightmap, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                    brushHeightmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);

                // copy the brush height to result brush heightmap
                commandBuffer.Blit(brushHeightmap, brushResultHeightmap, blitMaterial);

            }else if (GetBrushType() == BrushType.Splatmap) {
                Debug.Assert(context.IsRenderTextureExists(ContextConstants.Splatmap_Brush_Result_0_Texture), "May be there are no terrain layers.");

                var brushResult0Splatmap = context.GetRenderTexture(ContextConstants.Splatmap_Brush_Result_0_Texture);
                var brushResult1Splatmap = context.GetRenderTexture(ContextConstants.Splatmap_Brush_Result_1_Texture);
                var virtualSplatmap0 = context.GetRenderTexture(ContextConstants.VirtualSplatmap_0_Texture);
                var virtualSplatmap1 = context.GetRenderTexture(ContextConstants.VirtualSplatmap_1_Texture);

/*                var splatmap0 = context.GetRenderTexture(ContextConstants.Splatmap_0_Texture);
                var splatmap1 = context.GetRenderTexture (ContextConstants.Splatmap_1_Texture);*/

                var splatmapSize = virtualSplatmap0.GetSize();

                // slicing brush size and position to be inbounds of the heightmap.
                var slicingOps = new SlicingOperations();
                var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.alphamapBrushPosition, splatmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(brushData.alphamapBrushPosition, splatmapSize, brushData.alphamapActualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.alphamapBrushPosition, splatmapSize);
                slicedBrushPositionShift = new Vector2Int(Mathf.Abs(slicedBrushPositionShift.x), Mathf.Abs(slicedBrushPositionShift.y));

                // getting brush heightmap
                commandBuffer.CopyTexture(
                    virtualSplatmap0, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                    brushResult0Splatmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);

                commandBuffer.CopyTexture(
                    virtualSplatmap1, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                    brushResult1Splatmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);
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
                var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.heightmapBrushPosition, heightmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(brushData.heightmapBrushPosition, heightmapSize, brushData.heightmapActualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.heightmapBrushPosition, heightmapSize);
                slicedBrushPositionShift = new Vector2Int(Mathf.Abs(slicedBrushPositionShift.x), Mathf.Abs(slicedBrushPositionShift.y));

                commandBuffer.CopyTexture(brushResultHeightmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                    virtualTerrainHeightmap, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);

            }
            else if(GetBrushType() == BrushType.Splatmap) {

                var brushResult0Splatmap = context.GetRenderTexture(ContextConstants.Splatmap_Brush_Result_0_Texture);
                var brushResult1Splatmap = context.GetRenderTexture(ContextConstants.Splatmap_Brush_Result_1_Texture);
                var virtualSplatmap0 = context.GetRenderTexture(ContextConstants.VirtualSplatmap_0_Texture);
                var virtualSplatmap1 = context.GetRenderTexture(ContextConstants.VirtualSplatmap_1_Texture);

/*                var splatmap0 = context.GetRenderTexture(ContextConstants.Splatmap_0_Texture);
                var splatmap1 = context.GetRenderTexture (ContextConstants.Splatmap_1_Texture);*/

                var splatmapSize = virtualSplatmap0.GetSize();

                // slicing brush size and position to be inbounds of the heightmap.
                var slicingOps = new SlicingOperations();
                var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.alphamapBrushPosition, splatmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(brushData.alphamapBrushPosition, splatmapSize, brushData.alphamapActualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.heightmapBrushPosition, splatmapSize);
                slicedBrushPositionShift = new Vector2Int(Mathf.Abs(slicedBrushPositionShift.x), Mathf.Abs(slicedBrushPositionShift.y));

                commandBuffer.CopyTexture(brushResult0Splatmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                    virtualSplatmap0, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);

                commandBuffer.CopyTexture(brushResult1Splatmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                    virtualSplatmap1, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);
            }
        }
        
        public virtual void RenderHologram(IBrushContext context) {
            if(context.IsMeshsExists(ContextConstants.HologramMesh) == false) {
                return;
            }
            var hologramMaterial = context.GetHologramMaterial();
            var hologramMesh = context.GetMesh(ContextConstants.HologramMesh);
            var terrain = context.GetTerrain();
            var brushData = context.GetBrushData();

            var unityTerrainHeightmap = terrain.terrainData.heightmapTexture;
            var terrainSize = terrain.terrainData.size;
            var heightmapSize = unityTerrainHeightmap.GetSize();

            var maskTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);

            var terrainPosition = terrain.GetPosition();
            var offsetPosition = (terrainSize.x / heightmapSize.x) * 0.5f;
            terrainPosition.x -= offsetPosition;
            terrainPosition.z -= offsetPosition;

            Vector4 bounds = new Vector4();
            var offsetBounds = new Vector2(brushData.heightmapActualBrushSize.x - brushData.heightmapBrushSize.x, brushData.heightmapActualBrushSize.y - brushData.heightmapBrushSize.y);
            offsetBounds.x *= 0.5f;
            offsetBounds.y *= 0.5f;
            var innerBrushPosition = new Vector2(brushData.heightmapBrushPosition.x, brushData.heightmapBrushPosition.y);
            innerBrushPosition.x += offsetBounds.x;
            innerBrushPosition.y += offsetBounds.y;

            innerBrushPosition.x /= heightmapSize.x;
            innerBrushPosition.y /= heightmapSize.y;

            bounds.x = innerBrushPosition.x;
            bounds.y = innerBrushPosition.y;
            bounds.z = bounds.x + (brushData.heightmapBrushSize.x / (float)heightmapSize.x);
            bounds.w = bounds.y + (brushData.heightmapBrushSize.y / (float)heightmapSize.y);

            hologramMaterial.SetTexture("_Heightmap", unityTerrainHeightmap);
            hologramMaterial.SetVector("_TerrainSize", terrainSize);
            hologramMaterial.SetVector("_Bounds", bounds);
            hologramMaterial.SetTexture("_Mask", maskTexture);
            hologramMaterial.SetFloat("_Angle", brushData.angle);

            Graphics.DrawMesh(hologramMesh, terrainPosition, Quaternion.identity, hologramMaterial, terrain.gameObject.layer, Camera.main);
        }
    }
    
}
