using UnityEngine;

namespace TerrainTools {

    [CreateAssetMenu(fileName = "TerrainToolsResources", menuName = "Terrain Tools/Terrain Tools Resources", order = 0)]
    public sealed class TerrainToolsResources : ScriptableObject {
        [Header("Resources:")]
        [Tooltip("The Brushes shapes/masks.")]
        public Texture2D[] Brushes;

        [Header("Water:")]
        public Material WaterDeformDecalMaterial;
        public WaterPrefabs WaterPrefabs;

        [Header("Mask:")]
        [Tooltip("The Shape to mask the terrain with.")]
        public Texture2D TerrainMask;
        [Tooltip("The region inside of the mask to also act as outside mask.")]
        public int TerrainMaskBorder = 3;
        [Tooltip("The height of the terrain that will be maintained at all cost.")]
        public int TerrainMaskBaseHeight = 3;

        [Header("Shaders And Materials:")]
        [Tooltip("The compute shader containg all the brushes kernels.")]
        public ComputeShader TerrainBrushesCompute;
        [Tooltip("The material which will be used to blit textures.")]
        public Material BlitMaterial;
        [Tooltip("The shader which will be used to draw hologram.")]
        public Material HologramMaterial;

        [Header("Detail Settings:")]
        [Tooltip("Auto Adjust pixel error to 1.")]
        public bool AutoAdjustPixelError = false;

        [Header("Debug Settings:")]
        [Tooltip("Whether to turn on debug mode.")]
        public bool DebugMode = false;
    }
}
