using System;
using UnityEngine;

namespace TerrainTools {

    [TerrainBrush]
    public sealed class CurveyStripsTerrainBrush : TerrainBrush {
        private const float ROTATE_SPEED = 10.0f;

        private bool m_editing = false;
        private Vector3 m_lastPointerPosition = Vector3Int.zero;

        private float m_angle = -1;
        private float m_newAngle = 0;

        private Camera m_camera = null;

        public override BrushType GetBrushType() {
            return BrushType.Heightmap;
        }

        public override void Prepare(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();

            var brushData = context.GetBrushData();
            var terrain = context.GetTerrain();
            var heightmapSize = terrain.terrainData.heightmapTexture.GetSize();

            var patternBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);
            var patternTexture = context.GetRenderTexture(ContextConstants.PatternTexture);

            if(m_camera == null) {
                m_camera = Camera.main;
            }

            Vector3 mousePos = brushData.pointerPosition;

            // Compute movement delta in world space (XZ plane)
            Vector3 delta = new Vector3(
                mousePos.x - m_lastPointerPosition.x,
                0f,
                mousePos.z - m_lastPointerPosition.z
            );
            if (delta.sqrMagnitude > 0.0001f) {
                // Get angle between world forward and delta direction
                float targetAngle = Mathf.Atan2(delta.x, delta.z) * Mathf.Rad2Deg;

                // Optional: offset by camera Y rotation if needed (depends on how you want object to behave)
                targetAngle -= m_camera.transform.eulerAngles.y;

                // Smooth the angle
                m_newAngle = Mathf.LerpAngle(m_newAngle, targetAngle, ROTATE_SPEED * brushData.deltaTime);
            }
            m_lastPointerPosition = mousePos;
            m_angle = m_newAngle + 90.0f;

            var slicingOps = new SlicingOperations();
            var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.heightmapBrushPosition, heightmapSize);
            var slicedBrushSize = slicingOps.SliceBrushSize(brushData.heightmapBrushPosition, heightmapSize, brushData.heightmapActualBrushSize);
            var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.heightmapBrushPosition, heightmapSize);
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

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.CurveyStripsBrush, "HeightmapTexture", terrainHeightmapTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.CurveyStripsBrush, "BrushHeightmapTexture", brushHeightmapTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.CurveyStripsBrush, "BrushMaskTexture", brushShapeTexture);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.CurveyStripsBrush, "OutputBrushHeightmapTexture", patternBrushHeightmapResultTexture);

            commandBuffer.SetComputeFloatParam(computeShader, "BrushStrength", brushData.brushStrength);
            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", brushData.deltaTime);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushHeight", brushData.brushHeight);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushStripCount", brushData.stripCount);

            commandBuffer.SetComputeIntParams(computeShader, "BrushPosition", brushData.heightmapBrushPosition.x, brushData.heightmapBrushPosition.y);
            commandBuffer.SetComputeIntParams(computeShader, "BrushSize", brushData.heightmapBrushSize.x, brushData.heightmapBrushSize.y);
            commandBuffer.SetComputeIntParams(computeShader, "ActualBrushSize", brushData.heightmapActualBrushSize.x, brushData.heightmapActualBrushSize.y);

            m_editing = true;
        }

        public override void OnBrushUp(IBrushContext context) {
            //m_angle = -1;

            m_editing = false;
        }

        public override void OnBrushUpdate(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var stripBrushDispatchSize = context.GetBrushDispatchSize();
            var brushData = context.GetBrushData();

            commandBuffer.SetComputeFloatParam(computeShader, "BrushAngle", m_angle);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.CurveyStripsBrush, stripBrushDispatchSize.x, stripBrushDispatchSize.y, stripBrushDispatchSize.z);

            var patternTexture = context.GetRenderTexture(ContextConstants.PatternTexture);
            var patternBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);

            var heightmapSize = patternTexture.GetSize();

            var slicingOps = new SlicingOperations();
            var slicedBrushPosition = slicingOps.SliceBrushPosition(brushData.heightmapBrushPosition, heightmapSize);
            var slicedBrushSize = slicingOps.SliceBrushSize(brushData.heightmapBrushPosition, heightmapSize, brushData.heightmapActualBrushSize);
            var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(brushData.heightmapBrushPosition, heightmapSize);
            slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

            commandBuffer.CopyTexture(patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                patternTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);

            m_lastPointerPosition = brushData.pointerPosition;
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

            var maskTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);
            var terrainMask = context.GetRenderTexture(ContextConstants.TerrainMaskTexture);

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
            hologramMaterial.SetTexture("_TerrainMask", terrainMask);

            var angle = m_editing ? m_angle : brushData.angle;
            hologramMaterial.SetFloat("_Angle", angle);

            Graphics.DrawMesh(hologramMesh, terrainPosition, Quaternion.identity, hologramMaterial, terrain.gameObject.layer, m_camera);
        }
    }
}
