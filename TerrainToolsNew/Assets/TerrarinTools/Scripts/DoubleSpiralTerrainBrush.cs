using System;
using UnityEngine;

namespace TerrainTools {
    [TerrainBrush]
    public sealed class DoubleSpiralTerrainBrush : TerrainBrush {
        private const float ROTATE_SPEED = 200.0f;
        private const float EXPEND_SPEED = 1f;
        private const float DESIRED_ARC = 0.1f;

        private Vector2Int m_brushSize = Vector2Int.zero;
        private Vector2Int m_actualBrushSize = Vector2Int.zero;
        private Vector2Int m_brushPosition = Vector2Int.zero;

        private Vector3 m_pointerPosition = Vector3.zero;

        private Vector2Int m_secondBrushSize = Vector2Int.zero;
        private Vector2Int m_secondActualBrushSize = Vector2Int.zero;
        private Vector2Int m_secondBrushPosition = Vector2Int.zero;

        private Vector3 m_secondPointerPosition = Vector3.zero;

        private bool m_editing = false;

        private float m_angle = -1;
        private float m_secondAngle = -1;

        private float m_lastAngle = 0;
        private float m_secondLastAngle = 0;

        private float m_radius = -1;
        private float m_secondRadius = 1;

        private float m_lastRadius = 0;
        private float m_secondLastRadius = 0;

        private Camera m_camera = null;
        private Material m_secondHologramMaterial;

        public override BrushType GetBrushType() {
            return BrushType.Heightmap;
        }

        public override void Prepare(IBrushContext context) {
            var brushData = context.GetBrushData();

            if (m_angle >= 0f) {
                m_angle += brushData.deltaTime * ROTATE_SPEED;
            }
            if (m_radius >= 0f) {
                m_radius += brushData.deltaTime * EXPEND_SPEED;
            }

            if (m_secondAngle >= 0f) {
                m_secondAngle += brushData.deltaTime * ROTATE_SPEED;
            }
            if (m_secondRadius <= 0f) {
                m_secondRadius -= brushData.deltaTime * EXPEND_SPEED;
            }
        }

        public override void OnBrushDown(IBrushContext context) {

            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var brushData = context.GetBrushData();

            m_angle = brushData.angle;
            m_radius = 0.1f;
            m_editing = true;

            m_secondAngle = brushData.angle;
            m_secondRadius = -0.1f;

            var patternBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SpiralBrush, "OutputBrushHeightmapTexture", patternBrushHeightmapResultTexture);

            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", brushData.deltaTime);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushHeight", brushData.brushHeight);

            commandBuffer.SetComputeIntParams(computeShader, "BrushSize", m_brushSize.x, m_brushSize.y);
            commandBuffer.SetComputeIntParams(computeShader, "ActualBrushSize", m_actualBrushSize.x, m_actualBrushSize.y);
            commandBuffer.SetComputeFloatParam(computeShader, "BrushAngle", 0);
        }

        public override void OnBrushUp(IBrushContext context) {
            m_angle = -1;
            m_radius = -1;

            m_secondAngle = -1;
            m_secondRadius = 1;

            m_editing = false;
        }

        public override void OnBrushUpdate(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var dispatchSize = context.GetDispatchSize();
            var brushData = context.GetBrushData();

            var patternBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);
            var patternTexture = context.GetRenderTexture(ContextConstants.PatternTexture);

            var terrain = context.GetTerrain();

            var heightmapSize = patternTexture.GetSize();
            var terrainSize = terrain.terrainData.size;

            float arc = m_radius * (Mathf.Deg2Rad * (m_angle - m_lastAngle));
            var subDivs = (int)(arc / DESIRED_ARC) + 1;

            for (var i = 0; i < subDivs; i++) {
                float angle = Mathf.LerpAngle(m_lastAngle, m_angle, i / (float)subDivs);
                float radius = Mathf.Lerp(m_lastRadius, m_radius, i / (float)subDivs);

                var dir = new Vector3(Mathf.Cos(angle * Mathf.Deg2Rad), 0, Mathf.Sin(angle * Mathf.Deg2Rad));
                m_pointerPosition = brushData.pointerPosition + (dir * radius);

                var brushSizingOps = new BrushSizeOperations();
                m_brushSize = brushSizingOps.BrushSizeToTexelSize(new Vector2Int(brushData.userBrushSize.x, brushData.userBrushSize.y), terrainSize, heightmapSize.x);
                m_actualBrushSize = brushSizingOps.TexelBrushSizeToActualBrushSize(m_brushSize);
                m_brushPosition = brushSizingOps.BrushPointerPositionToTexelPosition(m_pointerPosition, m_actualBrushSize, terrainSize, heightmapSize.x);

                var slicingOps = new SlicingOperations();
                var slicedBrushPosition = slicingOps.SliceBrushPosition(m_brushPosition, heightmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(m_brushPosition, heightmapSize, m_actualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(m_brushPosition, heightmapSize);
                slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

                commandBuffer.CopyTexture(
                    patternTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                    patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);

                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.SpiralBrush, dispatchSize.x, dispatchSize.y, dispatchSize.z);

                commandBuffer.CopyTexture(patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                    patternTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);
            }

            float secondArc = Mathf.Abs(m_secondRadius) * (Mathf.Deg2Rad * (m_secondAngle - m_secondLastAngle));
            var secondSubDivs = (int)(secondArc / DESIRED_ARC) + 1;

            for (var i = 0; i < secondSubDivs; i++) {
                float angle = Mathf.LerpAngle(m_secondLastAngle, m_secondAngle, i / (float)secondSubDivs);
                float radius = Mathf.Lerp(m_secondLastRadius, m_secondRadius, i / (float)secondSubDivs);

                var dir = new Vector3(Mathf.Cos(angle * Mathf.Deg2Rad), 0, Mathf.Sin(angle * Mathf.Deg2Rad));
                m_secondPointerPosition = brushData.pointerPosition + (dir * radius);

                var brushSizingOps = new BrushSizeOperations();
                m_secondBrushSize = brushSizingOps.BrushSizeToTexelSize(new Vector2Int(brushData.userBrushSize.x, brushData.userBrushSize.y), terrainSize, heightmapSize.x);
                m_secondActualBrushSize = brushSizingOps.TexelBrushSizeToActualBrushSize(m_secondBrushSize);
                m_secondBrushPosition = brushSizingOps.BrushPointerPositionToTexelPosition(m_secondPointerPosition, m_secondActualBrushSize, terrainSize, heightmapSize.x);

                var slicingOps = new SlicingOperations();
                var slicedBrushPosition = slicingOps.SliceBrushPosition(m_secondBrushPosition, heightmapSize);
                var slicedBrushSize = slicingOps.SliceBrushSize(m_secondBrushPosition, heightmapSize, m_secondActualBrushSize);
                var slicedBrushPositionShift = slicingOps.GetSlicedPositionShift(m_secondBrushPosition, heightmapSize);
                slicedBrushPositionShift = new Vector2Int(Math.Abs(slicedBrushPositionShift.x), Math.Abs(slicedBrushPositionShift.y));

                commandBuffer.CopyTexture(
                    patternTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y, slicedBrushSize.x, slicedBrushSize.y,
                    patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y);

                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.SpiralBrush, dispatchSize.x, dispatchSize.y, dispatchSize.z);

                commandBuffer.CopyTexture(patternBrushHeightmapResultTexture, 0, 0, slicedBrushPositionShift.x, slicedBrushPositionShift.y, slicedBrushSize.x, slicedBrushSize.y,
                    patternTexture, 0, 0, slicedBrushPosition.x, slicedBrushPosition.y);
            }

            m_lastAngle = m_angle;
            m_lastRadius = m_radius;

            m_secondLastAngle = m_secondAngle;
            m_secondLastRadius = m_secondRadius;

            if (Input.GetKeyDown(KeyCode.Space)) {
                Debug.Log("");
            }
        }

        public override void CopyResults(IBrushContext context) {
            // nothing
        }
        private void RenderSecondHologram(IBrushContext context) {
            if (context.IsMeshsExists(ContextConstants.HologramMesh) == false) {
                return;
            }

            if (m_secondHologramMaterial == null) {
                m_secondHologramMaterial = new Material(context.GetHologramMaterial());
                m_secondHologramMaterial.renderQueue = 3001; // after default transparent
            }
            var hologramMaterial = m_secondHologramMaterial;
            var hologramMesh = context.GetMesh(ContextConstants.HologramMesh);
            var terrain = context.GetTerrain();
            var brushData = context.GetBrushData();

            var unityTerrainHeightmap = terrain.terrainData.heightmapTexture;
            var terrainSize = terrain.terrainData.size;
            var heightmapSize = unityTerrainHeightmap.GetSize();

            var brushSizingOps = new BrushSizeOperations();
            var pointerPosition = m_editing ? m_secondPointerPosition : brushData.pointerPosition;

            m_secondBrushSize = brushSizingOps.BrushSizeToTexelSize(new Vector2Int(brushData.userBrushSize.x, brushData.userBrushSize.y), terrainSize, heightmapSize.x);
            m_secondActualBrushSize = brushSizingOps.TexelBrushSizeToActualBrushSize(m_secondBrushSize);
            m_secondBrushPosition = brushSizingOps.BrushPointerPositionToTexelPosition(pointerPosition, m_secondActualBrushSize, terrainSize, heightmapSize.x);

            var maskTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);

            var terrainPosition = terrain.GetPosition();
            var offsetPosition = (terrainSize.x / heightmapSize.x) * 0.5f;
            terrainPosition.x -= offsetPosition;
            terrainPosition.z -= offsetPosition;

            Vector4 bounds = new Vector4();
            var offsetBounds = new Vector2(m_secondActualBrushSize.x - m_secondBrushSize.x, m_secondActualBrushSize.y - m_secondBrushSize.y);
            offsetBounds.x *= 0.5f;
            offsetBounds.y *= 0.5f;
            var innerBrushPosition = new Vector2(m_secondBrushPosition.x, m_secondBrushPosition.y);
            innerBrushPosition.x += offsetBounds.x;
            innerBrushPosition.y += offsetBounds.y;

            innerBrushPosition.x /= heightmapSize.x;
            innerBrushPosition.y /= heightmapSize.y;

            bounds.x = innerBrushPosition.x;
            bounds.y = innerBrushPosition.y;
            bounds.z = bounds.x + (m_secondBrushSize.x / (float)heightmapSize.x);
            bounds.w = bounds.y + (m_secondBrushSize.y / (float)heightmapSize.y);

            Debug.Log(bounds);

            hologramMaterial.SetTexture("_Heightmap", unityTerrainHeightmap);
            hologramMaterial.SetVector("_TerrainSize", terrainSize);
            hologramMaterial.SetVector("_Bounds", bounds);
            hologramMaterial.SetTexture("_Mask", maskTexture);

            hologramMaterial.SetFloat("_Angle", 0);

            Graphics.DrawMesh(hologramMesh, terrainPosition, Quaternion.identity, hologramMaterial, terrain.gameObject.layer, m_camera);
        }
        private void RenderFirstHologram(IBrushContext context) {
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
            var pointerPosition = m_editing ? m_pointerPosition : brushData.pointerPosition;

            m_brushSize = brushSizingOps.BrushSizeToTexelSize(new Vector2Int(brushData.userBrushSize.x, brushData.userBrushSize.y), terrainSize, heightmapSize.x);
            m_actualBrushSize = brushSizingOps.TexelBrushSizeToActualBrushSize(m_brushSize);
            m_brushPosition = brushSizingOps.BrushPointerPositionToTexelPosition(pointerPosition, m_actualBrushSize, terrainSize, heightmapSize.x);

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

            hologramMaterial.SetFloat("_Angle", 0);

            Graphics.DrawMesh(hologramMesh, terrainPosition, Quaternion.identity, hologramMaterial, terrain.gameObject.layer, m_camera);
        }

        public override void RenderHologram(IBrushContext context) {
            if (m_camera == null) {
                m_camera = Camera.main;
            }

            RenderSecondHologram(context);
            RenderFirstHologram(context);
        }
    }
}
