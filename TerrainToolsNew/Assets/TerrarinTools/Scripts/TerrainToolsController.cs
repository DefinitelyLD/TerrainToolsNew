using UnityEngine;

namespace TerrainTools {

    public sealed class TerrainToolsController : MonoBehaviour {

        [Header("Controls:")]
        public Vector2Int BrushSize = new Vector2Int(30, 30);
        public float BrushStrength = 1f;
        public float BrushAngle = 0;
        public int BrushHeight = 5;
        public int BrushShapeIndex = 0;

        public BrushMode BrushType = BrushMode.Raise;
        public float TweenStrength = 4;

        public float BrushFall = 0.2f;
        public int SplatIndex = 0;
        public float WaterSimulationFactor = 1.0f;
        public float ExpendSpeed = 10f;
        public float RotateSpeed = 200f;

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

        public APIData GetAPIData() {
            Debug.Assert(m_manager != null);

            return m_manager.GetAPIData();
        }

        private void Update() {
            if(m_manager != null) {

                m_manager.UpdateData(new TerrainToolsManagerUpdateData() {
                    brushAngle = BrushAngle,
                    brushSize = BrushSize,
                    brushStrength = BrushStrength,
                    brushHeight = BrushHeight,

                    brushType = BrushType.GetName(),

                    brushShapeIndex = BrushShapeIndex,

                    brushFallback = BrushFall,

                    deltaTime = Time.deltaTime,
                    tweenStrength = TweenStrength,
                    splatIndex = SplatIndex,
                    waterSimFactor = WaterSimulationFactor,

                    rotateSpeed = RotateSpeed,
                    expendSpeed = ExpendSpeed
                });

                m_manager.Tick();
            }
        }

        [ContextMenu(nameof(ForceSyncTerrain))]
        private void ForceSyncTerrain() {
            var terrain = Terrain.activeTerrain;
            terrain.terrainData.DirtyHeightmapRegion(new RectInt(0, 0, terrain.terrainData.heightmapResolution, terrain.terrainData.heightmapResolution), TerrainHeightmapSyncControl.HeightAndLod);
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

            var apiObject = new GameObject("[Terrain Tools API Provider]");
            apiObject.transform.SetParent(controllerObject.transform);
            apiObject.AddComponent<TerrainToolsAPIDataProvider>();
        }
    }
}
