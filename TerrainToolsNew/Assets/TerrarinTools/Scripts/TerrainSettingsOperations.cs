using UnityEngine;
using Debug = UnityEngine.Debug;

namespace TerrainTools {
    public struct TerrainSettingsOperations {
        public readonly void SetTerrainSettings(Terrain terrain, TerrainToolsResources resources) {
            if (resources.AutoAdjustPixelError) {
                var pixelError = 1;

                if (terrain.heightmapPixelError != pixelError) {
                    TerrainToolsUtils.Log($"Pixel error set to {terrain.heightmapPixelError}->{pixelError} for the terrain.");

                    terrain.heightmapPixelError = pixelError;
                }
            }

            if (terrain.drawInstanced != true) {
                Debug.Assert(false, "Terrain Draw Insranced is not checked in terrain settings. Terrain Draw Instanced must be checked in the editor, It can't be set at runtime.");
            }
        }
    }
}