using UnityEngine;
using Debug = UnityEngine.Debug;

namespace TerrainTools {
    public struct TerrainSettingsOperations {
        public void SetTerrainSettings(Terrain terrain, TerrainToolsResources resources) {
            var heightmapResolution = terrain.terrainData.heightmapResolution;

            var pixelError = 0;
            if (resources.ForcePixelErrorToZero == false) {
                if (heightmapResolution == 1025) {
                    pixelError = 1;
                } else if (heightmapResolution == 2049) {
                    pixelError = 2;
                } else if (heightmapResolution == 4097) {
                    pixelError = 4;
                }
            }

            if (resources.ConstantTerrainLODS) {
                var maxComplexity = 0;
                if (heightmapResolution == 1025) {
                    maxComplexity = 1;
                } else if (heightmapResolution == 2049) {
                    maxComplexity = 2;
                } else if (heightmapResolution == 4097) {
                    maxComplexity = 3;
                }

                if (terrain.heightmapMaximumLOD != maxComplexity) {
                    TerrainToolsUtils.Log($"Heightmap maximum LOD set to {terrain.heightmapMaximumLOD}->{maxComplexity} for the terrain.");
                    terrain.heightmapMaximumLOD = maxComplexity;
                }
            }

            if (terrain.heightmapPixelError != pixelError) {
                TerrainToolsUtils.Log($"Pixel error set to {terrain.heightmapPixelError}->{pixelError} for the terrain.");

                terrain.heightmapPixelError = pixelError;
            }

            if (terrain.drawInstanced != true) {
                Debug.Assert(false, "Terrain Draw Insranced is not checked in terrain settings. Terrain Draw Instanced must be checked in the editor, It can't be set at runtime.");
            }
        }
    }
}