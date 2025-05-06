using UnityEngine;

namespace TerrainTools {
    public struct BrushData {
        public Vector2Int userBrushSize;
        public Vector3 pointerPosition;

        public Vector2Int heightmapBrushPosition;
        public Vector2Int heightmapBrushSize;
        public Vector2Int heightmapActualBrushSize;

        public Vector2Int alphamapBrushPosition;
        public Vector2Int alphamapBrushSize;
        public Vector2Int alphamapActualBrushSize;

        public int splatIndex;

        public float angle;

        public float stripCount;
        public float brushStrength;
        public float brushHeight;
        
        public float deltaTime;

        public int currentBrushIndex;

        public bool hasResourceFencePassed;

        public TweenData tweenData;

        public float terrainMaskBaseHeight;
        public int terrainMaskBorder;
    }
}
