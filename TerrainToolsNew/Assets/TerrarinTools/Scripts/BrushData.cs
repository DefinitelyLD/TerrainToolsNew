using UnityEngine;

namespace TerrainTools {
    public struct BrushData {
        public Vector2Int brushPosition;
        public Vector2Int brushSize;
        public float angle;
        public Vector2Int actualBrushSize;

        public float brushStrength;
        public float brushFlatHeight;
        
        public float deltaTime;

        public int currentBrushIndex;
    }
}
