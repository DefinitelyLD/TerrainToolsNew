using UnityEngine;
using UnityEngine.Rendering.HighDefinition;

namespace TerrainTools
{
    public class WaterDeformTester : MonoBehaviour
    {
        public Terrain Terrain;
        public WaterDecal WaterDecal;
        public Material WaterDeformAndMaskMaterial;

        public void Start() {
            var heightmap = Terrain.terrainData.heightmapTexture;

            //WaterDeformAndMaskMaterial.SetTexture("Heightmap", heightmap);
            WaterDecal.material.SetTexture("_Heightmap", heightmap );
            WaterDecal.amplitude = Terrain.terrainData.size.y * 1.9f;
        }
    }
}
