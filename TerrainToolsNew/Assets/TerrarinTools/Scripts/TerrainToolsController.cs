using UnityEngine;

namespace TerrainTools {

    public sealed class TerrainToolsController : MonoBehaviour {

        [Header("Controls:")]
        [SerializeField]
        private Vector2Int BrushSize = new Vector2Int(30, 30);
        [SerializeField]
        private float BrushStrength = 1f;
        [SerializeField]
        private float BrushAngle = 0;
        [SerializeField]
        private int BrushFlatHeight = 1;
        [SerializeField]
        private int BrushShapeIndex = 0;

        [SerializeField]
        private BrushMode BrushType = BrushMode.Raise;

        [SerializeField]
        private float BrushFall = 1;

        [Header("References:")]
        [Tooltip("The terrain on which to work.")]
        [SerializeField]
        private Terrain Terrain;

        [Tooltip("The resources to use for the brushes.")]
        [SerializeField]
        private TerrainToolsResources ToolsResources;

        private TerrainToolsManager m_manager;

        private void Start() {
            Debug.Assert(Terrain != null, $"Terrain are not assigned, {name}");
            Debug.Assert(ToolsResources != null, $"Resources are not assigned, {name}");

            m_manager = new TerrainToolsManager(Terrain, ToolsResources);
        }

        private void Update() {
            if(m_manager != null) {

                m_manager.Mutate(new TerrainToolsManagerMutateData() {
                    brushAngle = BrushAngle,
                    brushSize = BrushSize,
                    brushStrength = BrushStrength,
                    brushHeight = BrushFlatHeight,


                    brushType = BrushType.GetName(),

                    brushShapeIndex = BrushShapeIndex,

                    brushFallback = BrushFall,

                    deltaTime = Time.deltaTime
                });

                m_manager.Tick();
            }
        }

        private void OnDestroy() {
            if (m_manager != null) {
                m_manager.Dispose();
                m_manager = null;
            }
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
