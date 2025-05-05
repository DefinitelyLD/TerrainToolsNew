using System;
using UnityEngine;

namespace TerrainTools {
    public struct BrushSizeOperations {
        public static readonly Vector3 BrushSizeToWorldSize = new Vector3(0.1f, 0.1f, 0.1f);

        public readonly float CalculateStripCount(Vector2Int brushSize, int brushHeight) {
            const float heightReference = 2f;
            const float lengthReference = 7f;
            const float referenceStripCount = 1f;

            //float length = (brushSize.x + brushSize.y) * 0.5f;
            float length = brushSize.y;

            float heightMultiple = brushHeight / heightReference;
            float lengthMultiple = length / lengthReference;

            // Prevent division by zero
            if (Mathf.Approximately(heightMultiple, 0f))
                return 1f;

            float stripCount = (referenceStripCount / heightMultiple) * lengthMultiple;
            if((int)stripCount % 2 == 0) {
                stripCount++;
            }

            return Mathf.Max((int)stripCount, 1.0f); // Ensure minimum of 1
        }


        public readonly Vector2Int BrushPointerPositionToTexelPosition(Vector3 terrainLocalPointerPosition, Vector2Int actualBrushSize, Vector3 terrainSize, int textureResolution) {
            return new Vector2Int(
                    (int)(((textureResolution / terrainSize.x) * terrainLocalPointerPosition.x) - (actualBrushSize.x * 0.5f)),
                    (int)(((textureResolution / terrainSize.z) * terrainLocalPointerPosition.z) - (actualBrushSize.y * 0.5f)));
        }

        public readonly Vector2Int TexelBrushSizeToActualBrushSize(Vector2Int texelBrushSize) {
            return new Vector2Int(
                    (int)(Mathf.Sqrt(Mathf.Pow(texelBrushSize.x, 2) + Mathf.Pow(texelBrushSize.y, 2)) * 1),
                    (int)(Mathf.Sqrt(Mathf.Pow(texelBrushSize.x, 2) + Mathf.Pow(texelBrushSize.y, 2)) * 1));
        }

        public readonly float GPUBrushHeightToCPUWorldHeight(float gpuHeight, Vector3 terrainSize) {
            return gpuHeight * 2f * terrainSize.y;
        }

        public readonly float GPUBrushHeightToCPUNormalizedHeight(float gpuHeight) {
            return gpuHeight * 2f;
        }
        
        public readonly float BrushHeightToGPUHeightValue(int brushHeight, Vector3 terrainSize) {
            var heightInWorldUnits = brushHeight * BrushSizeToWorldSize.y;

            var normalizedHeight = heightInWorldUnits / terrainSize.y;

            return normalizedHeight * 0.5f;
        }

        public readonly Vector2Int BrushSizeToTexelSize(Vector2Int brushSize, Vector3 terrainSize, int textureResolution) {
            var texelPerWorldUnit = new Vector2(textureResolution / terrainSize.x, textureResolution / terrainSize.z);

            var brushSizeWorldUnits = new Vector2(brushSize.x * BrushSizeToWorldSize.x, brushSize.y * BrushSizeToWorldSize.z);

            var brushSizeTexelUnits = new Vector2(brushSizeWorldUnits.x * texelPerWorldUnit.x, brushSizeWorldUnits.y * texelPerWorldUnit.y);

            return new Vector2Int((int)brushSizeTexelUnits.x, (int)brushSizeTexelUnits.y);
        }
    }
}