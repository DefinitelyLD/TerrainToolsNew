using UnityEngine;

namespace TerrainTools {
    public class StickToTerrainHeight : MonoBehaviour {
        public float Strength = 5f;
        public float HeightOffset = 0.5f;

        public Vector2 Bounds = new Vector2(1f, 1f);

        private float height = 0;

        private void Awake() {
            height = transform.position.y;
        }

        private void OnDrawGizmosSelected() {
            Gizmos.color = Color.blue;
            Gizmos.DrawWireCube(transform.position, new Vector3(Bounds.x, 0.1f, Bounds.y));
        }

        private void Update() {

            var position = transform.position;
            position.y = Mathf.Lerp(position.y, height + HeightOffset, Time.deltaTime * Strength);
            transform.position = position;

            var data = TerrainToolsAPIDataProvider.GetAPIData();
            if (data == null) {
                return;
            }

            var ops = new BrushSizeOperations();
            var texelPos = ops.BrushPointerPositionToTexelPosition(position, Vector2Int.zero, data.TerrainSize, data.Size.x);

            var texelBounds = new Vector2Int((int)((data.Size.x / data.TerrainSize.x) * Bounds.x), (int)(((data.Size.x / data.TerrainSize.x) * Bounds.y)));

            var halfBounds = texelBounds / 2;
            var maxDataIndex = data.Size.x * data.Size.y;

            var heighest = ushort.MinValue;

            for (var y = -halfBounds.y; y < halfBounds.y; y++) {
                for (var x = -halfBounds.x; x < halfBounds.x; x++) {
                    int index = ((texelPos.y + y) * data.Size.x) + texelPos.x + x;

                    if (index < 0 || index >= maxDataIndex) {
                        continue;
                    }

                    var value = data.HeightmapData[index];
                    if (value > heighest) {
                        heighest = value;
                    }
                }
            }

            height = (heighest / (float)ushort.MaxValue) * 2f * data.TerrainSize.y;
        }
    }
}