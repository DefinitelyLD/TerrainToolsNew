using System.Runtime.InteropServices;
using UnityEngine;

namespace TerrainTools {

    public abstract class TerrainBrush {
        public abstract BrushType GetBrushType();

        public virtual void Prepare(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var blitMaterial = context.GetBlitMaterial();

            var brushData = context.GetBrushData();

            var brushMaskTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);

            var brushTexture = context.GetCurrentBrushShape();
            commandBuffer.Blit(brushTexture, brushMaskTexture, blitMaterial);

            var terrain = context.GetTerrain();
            var heightmapSize = terrain.terrainData.heightmapTexture.GetSize();
            var terrainHeightmap = context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

            if (GetBrushType() == BrushType.Heightmap) {

                var virtualTerrainHeightmap = context.GetRenderTexture(ContextConstants.VirtualTerrainHeightmap);

                var brushHeightmap = context.GetRenderTexture(ContextConstants.TerrainBrushHeightTexture);
                var brushResultHeightmap = context.GetRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);

                // slicing brush size and position to be inbounds of the heightmap.
                var slicingOps = new SlicingOperations();
                var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.brushPosition, heightmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(brushData.brushPosition, heightmapSize, brushData.actualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.brushPosition, heightmapSize);
                slicedBrushPositionShift = new Vector2Int(Mathf.Abs(slicedBrushPositionShift.x), Mathf.Abs(slicedBrushPositionShift.y));

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
                slicedBrushPositionShift = new Vector2Int(Mathf.Abs(slicedBrushPositionShift.x), Mathf.Abs(slicedBrushPositionShift.y));

                commandBuffer.CopyTexture(brushResultHeightmap, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                    virtualTerrainHeightmap, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);
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
            var offsetBounds = new Vector2(brushData.actualBrushSize.x - brushData.brushSize.x, brushData.actualBrushSize.y - brushData.brushSize.y);
            offsetBounds.x *= 0.5f;
            offsetBounds.y *= 0.5f;
            var innerBrushPosition = new Vector2(brushData.brushPosition.x, brushData.brushPosition.y);
            innerBrushPosition.x += offsetBounds.x;
            innerBrushPosition.y += offsetBounds.y;

            innerBrushPosition.x /= heightmapSize.x;
            innerBrushPosition.y /= heightmapSize.y;

            bounds.x = innerBrushPosition.x;
            bounds.y = innerBrushPosition.y;
            bounds.z = bounds.x + (brushData.brushSize.x / (float)heightmapSize.x);
            bounds.w = bounds.y + (brushData.brushSize.y / (float)heightmapSize.y);

            Debug.Log($"Hologram Bounds: {bounds} Brush Position: {innerBrushPosition} Actual Brush Size: {brushData.actualBrushSize}, BrushSize: {brushData.brushSize}");

            hologramMaterial.SetTexture("_Heightmap", unityTerrainHeightmap);
            hologramMaterial.SetVector("_TerrainSize", terrainSize);
            hologramMaterial.SetVector("_Bounds", bounds);
            hologramMaterial.SetTexture("_Mask", maskTexture);

            Graphics.DrawMesh(hologramMesh, terrainPosition, Quaternion.identity, hologramMaterial, terrain.gameObject.layer, Camera.main);
        }
    }
    
}
