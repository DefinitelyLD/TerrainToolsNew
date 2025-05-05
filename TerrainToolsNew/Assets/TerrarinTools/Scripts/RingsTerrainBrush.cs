using System;
using UnityEngine;

namespace TerrainTools {
    [TerrainBrush]
    public sealed class RingsTerrainBrush : TerrainBrush {
        private const float ROTATE_SPEED = 200.0f;
        private const int USER_BRUSH_X_SIZE = 5;

        private Vector2Int m_brushSize = Vector2Int.zero;
        private Vector2Int m_actualBrushSize = Vector2Int.zero;
        private Vector2Int m_brushPosition = Vector2Int.zero;

        private bool m_editing = false;

        public override BrushType GetBrushType() {
            return BrushType.Heightmap;
        }

        private float m_angle = -1;

        public override void Prepare(IBrushContext context) { 
            var commandBuffer = context.GetCommandBuffer();

            var brushData = context.GetBrushData();
            var terrain = context.GetTerrain();
            var heightmapSize = terrain.terrainData.heightmapTexture.GetSize();
            
            var patternBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);
            var patternTexture = context.GetRenderTexture(ContextConstants.PatternTexture);

            if (m_angle >= 0f) {
                m_angle += brushData.deltaTime * ROTATE_SPEED;
            }

            var slicingOps = new SlicingOperations();
            var slicedBrushPosition = slicingOps.SliceBrushPosition(m_brushPosition, heightmapSize);
            var slicedBrushSize = slicingOps.SliceBrushSize(m_brushPosition, heightmapSize, m_actualBrushSize);
            var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(m_brushPosition, heightmapSize);
            slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

            commandBuffer.CopyTexture(
                patternTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);
        }

        public override void OnBrushDown(IBrushContext context) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var brushData = context.GetBrushData();

            if (m_angle < 0) {
                m_angle = brushData.angle;
            }

            var brushHeightmapTexture = context.GetRenderTexture(ContextConstants.TerrainBrushHeightTexture);
            var brushShapeTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);
            var terrainHeightmapTexture = context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

            var patternBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.RingsBrush, "HeightmapTexture", terrainHeightmapTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.RingsBrush, "BrushHeightmapTexture", brushHeightmapTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.RingsBrush, "BrushMaskTexture", brushShapeTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.RingsBrush, "OutputBrushHeightmapTexture", patternBrushHeightmapResultTexture);

            commandBuffer.SetComputeFloatParam(computeShader, "BrushStrength", brushData.brushStrength);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", brushData.deltaTime);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushHeight", brushData.brushHeight);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushStripCount", brushData.stripCount);

            commandBuffer.SetComputeIntParams(computeShader, "BrushPosition", m_brushPosition.x, m_brushPosition.y);
            commandBuffer.SetComputeIntParams(computeShader, "BrushSize", m_brushSize.x, m_brushSize.y);
            commandBuffer.SetComputeIntParams(computeShader, "ActualBrushSize", m_actualBrushSize.x, m_actualBrushSize.y);

            m_editing = true;
        }

        public override void OnBrushUp(IBrushContext context) {
            //m_angle = -1;

            m_editing = false;
        }

        public override void OnBrushUpdate(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var stripBrushDispatchSize = context.GetDispatchSize();
            var brushData = context.GetBrushData();

            commandBuffer.SetComputeFloatParam(computeShader, "BrushAngle", m_angle);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.RingsBrush, stripBrushDispatchSize.x, stripBrushDispatchSize.y, stripBrushDispatchSize.z);

            var patternTexture = context.GetRenderTexture(ContextConstants.PatternTexture);
            var patternBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);

            var heightmapSize = patternTexture.GetSize();

            var slicingOps = new SlicingOperations();
            var slicedBrushPosition = slicingOps.SliceBrushPosition(m_brushPosition, heightmapSize);
            var slicedBrushSize = slicingOps.SliceBrushSize(m_brushPosition, heightmapSize, m_actualBrushSize);
            var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(m_brushPosition, heightmapSize);
            slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

            commandBuffer.CopyTexture(patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                patternTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);
        }

        public override void CopyResults(IBrushContext context) {
            // nothing
        }

        public override void RenderHologram(IBrushContext context) {
            if (context.IsMeshsExists(ContextConstants.HologramMesh) == false) {
                return;
            }
            var hologramMaterial = context.GetHologramMaterial();
            var hologramMesh = context.GetMesh(ContextConstants.HologramMesh);
            var terrain = context.GetTerrain();
            var brushData = context.GetBrushData();

            var unityTerrainHeightmap = terrain.terrainData.heightmapTexture;
            var terrainSize = terrain.terrainData.size;
            var heightmapSize = unityTerrainHeightmap.GetSize();

            var brushSizingOps = new BrushSizeOperations();
            m_brushSize = brushSizingOps.BrushSizeToTexelSize(new Vector2Int(USER_BRUSH_X_SIZE, brushData.userBrushSize.y), terrainSize, heightmapSize.x);
            m_actualBrushSize = brushSizingOps.TexelBrushSizeToActualBrushSize(m_brushSize);
            m_brushPosition = brushSizingOps.BrushPointerPositionToTexelPosition(brushData.pointerPosition, m_actualBrushSize, terrainSize, heightmapSize.x);

            var maskTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);

            var terrainPosition = terrain.GetPosition();
            var offsetPosition = (terrainSize.x / heightmapSize.x) * 0.5f;
            terrainPosition.x -= offsetPosition;
            terrainPosition.z -= offsetPosition;

            Vector4 bounds = new Vector4();
            var offsetBounds = new Vector2(m_actualBrushSize.x - m_brushSize.x, m_actualBrushSize.y - m_brushSize.y);
            offsetBounds.x *= 0.5f;
            offsetBounds.y *= 0.5f;
            var innerBrushPosition = new Vector2(m_brushPosition.x, m_brushPosition.y);
            innerBrushPosition.x += offsetBounds.x;
            innerBrushPosition.y += offsetBounds.y;

            innerBrushPosition.x /= heightmapSize.x;
            innerBrushPosition.y /= heightmapSize.y;

            bounds.x = innerBrushPosition.x;
            bounds.y = innerBrushPosition.y;
            bounds.z = bounds.x + (m_brushSize.x / (float)heightmapSize.x);
            bounds.w = bounds.y + (m_brushSize.y / (float)heightmapSize.y);

            hologramMaterial.SetTexture("_Heightmap", unityTerrainHeightmap);
            hologramMaterial.SetVector("_TerrainSize", terrainSize);
            hologramMaterial.SetVector("_Bounds", bounds);
            hologramMaterial.SetTexture("_Mask", maskTexture);

            var angle = m_editing ? m_angle : brushData.angle;
            hologramMaterial.SetFloat("_Angle", angle);

            Graphics.DrawMesh(hologramMesh, terrainPosition, Quaternion.identity, hologramMaterial, terrain.gameObject.layer, Camera.main);
        }
    }
}
