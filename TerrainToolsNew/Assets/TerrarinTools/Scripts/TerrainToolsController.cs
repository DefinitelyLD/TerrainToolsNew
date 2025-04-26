using UnityEngine;

namespace TerrainTools {

    public sealed class TerrainToolsController : MonoBehaviour {

        [Tooltip("The terrain on which to work.")]
        [SerializeField]
        private Terrain Terrain;

        [Header("References:")]
        [Tooltip("The resources to use for the brushes.")]
        [SerializeField]
        private TerrainToolsResources ToolsResources;

        private TerrainToolsManager m_manager;

        private void Start() {
            Debug.Assert(Terrain != null, $"Terrain are not assigned, {name}");
            Debug.Assert(ToolsResources != null, $"Resources are not assigned, {name}");

            m_manager = new TerrainToolsManager(ToolsResources);
        }

        public void SetReferences(TerrainToolsControllerReferences references) {
            Debug.Assert(Terrain == null, "Terrain is already assigned.");
            Debug.Assert(ToolsResources == null, "Terrain Tools Resources is already assigned.");

            Debug.Assert(references.terrain != null);
            Debug.Assert(references.resources != null);

            Terrain = references.terrain;
            ToolsResources = references.resources;
        }

        public static void Setup(Terrain terrain, TerrainToolsResources resources) {
            Debug.Assert(terrain != null && resources != null);

            Debug.Assert(resources.Brushes.Length > 0, "No Brushe Shapes Supplied.");
            Debug.Assert(resources.TerrainBrushesCompute != null, "Terrain Brushes Compute Shader not Supplied.");

            var controllerObject = new GameObject("[Terrain Tools Controller]");
            controllerObject.transform.SetParent(terrain.transform);
            var controller = controllerObject.AddComponent<TerrainToolsController>();

            controller.SetReferences(new TerrainToolsControllerReferences() {
                terrain = terrain,
                resources = resources
            });
        }
    }
}
