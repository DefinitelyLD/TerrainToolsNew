using UnityEngine;

namespace TerrainTools {
    public sealed class TerrainToolsSetuper : MonoBehaviour {
        [Tooltip("Terrain tools resources to use.")]
        [SerializeField]
        private TerrainToolsResources Resources;

        private void Start() {
            TerrainToolsController.Setup(Terrain.activeTerrain, Resources);
        }
    }
}
