using UnityEngine;
using UnityEngine.Experimental.Rendering;

namespace TerrainTools {
    public struct DefaultResourcesOps {
        public readonly void CreateAndResizeDefaultResources(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();

            var terrain = context.GetTerrain(); 
            var brushData = context.GetBrushData();
            
            var blitMaterial = context.GetBlitMaterial();
            var hasFencePassed = brushData.hasResourceFencePassed;

            var heightmapFormat = terrain.terrainData.heightmapTexture.graphicsFormat;
            var normalmapFormat = terrain.normalmapTexture.graphicsFormat;

            var heightmapSize = terrain.terrainData.heightmapTexture.GetSize();
            var normalmapSize = terrain.normalmapTexture.GetSize();

            var actualBrushSize = brushData.actualBrushSize;

            // resizing brush mask
            if (context.IsRenderTextureExists(ContextConstants.TerrainBrushMaskTexture) == false) {
                var texture = context.CreateRenderTexture(ContextConstants.TerrainBrushMaskTexture, brushData.brushSize, GraphicsFormat.R32_SFloat, false);

                // resizing brush mask
                var brushTexture = context.GetCurrentBrushShape();
                commandBuffer.Blit(brushTexture, texture, blitMaterial);
            }

            var brushMaskTexture = context.GetRenderTexture(ContextConstants.TerrainBrushMaskTexture);

            if (brushMaskTexture.CheckSize(brushData.brushSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(ContextConstants.TerrainBrushMaskTexture);
                brushMaskTexture = context.CreateRenderTexture(ContextConstants.TerrainBrushMaskTexture, brushData.brushSize, GraphicsFormat.R32_SFloat, false);
            }
            //--

            // the texture where result of the heightmap brushes will be stored
            if (context.IsRenderTextureExists(ContextConstants.TerrainHeightmapTexture) == false) {
                context.CreateRenderTexture(ContextConstants.TerrainHeightmapTexture, heightmapSize, heightmapFormat, true);
            }

            var heightmapTexture = context.GetRenderTexture(ContextConstants.TerrainHeightmapTexture);

            if (heightmapTexture.CheckSize(heightmapSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(ContextConstants.TerrainHeightmapTexture);
                heightmapTexture = context.CreateRenderTexture(ContextConstants.TerrainHeightmapTexture, heightmapSize, heightmapFormat, true);
            }
            //--

            // getting brush heightmap, the region of terrain under the brush.
            if (context.IsRenderTextureExists(ContextConstants.TerrainBrushHeightTexture) == false) {
                context.CreateRenderTexture(ContextConstants.TerrainBrushHeightTexture, actualBrushSize, heightmapFormat, false);
            }

            var brushHeightmap = context.GetRenderTexture(ContextConstants.TerrainBrushHeightTexture);

            if (brushHeightmap.CheckSize(actualBrushSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(ContextConstants.TerrainBrushHeightTexture);
                brushHeightmap = context.CreateRenderTexture(ContextConstants.TerrainBrushHeightTexture, actualBrushSize, heightmapFormat, false);
            }
            //--

            // the texture which will mask the heightmap
            if (context.IsRenderTextureExists(ContextConstants.TerrainMaskTexture) == false) {
                var texture = context.CreateRenderTexture(ContextConstants.TerrainMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, false);

                // resizing mask texture
                commandBuffer.Blit(context.GetTerrainMaskTexture(), texture, blitMaterial);
            }

            var maskTexture = context.GetRenderTexture(ContextConstants.TerrainMaskTexture);

            if (maskTexture.CheckSize(heightmapSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(ContextConstants.TerrainMaskTexture);
                maskTexture = context.CreateRenderTexture(ContextConstants.TerrainMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, false);

                // resizing mask texture
                commandBuffer.Blit(context.GetTerrainMaskTexture(), maskTexture, blitMaterial);
            }
            //--

            // the texture which will store the result of the heightmap operation
            if (context.IsRenderTextureExists(ContextConstants.TerrainBrushHeightmapResultTexture) == false) {
                context.CreateRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture, actualBrushSize, heightmapFormat, true);
            }

            var heightmapResultTexture = context.GetRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);

            if (heightmapResultTexture.CheckSize(actualBrushSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture);
                heightmapResultTexture = context.CreateRenderTexture(ContextConstants.TerrainBrushHeightmapResultTexture, actualBrushSize, heightmapFormat, true);
            }
            //--
            if (context.IsRenderTextureExists(ContextConstants.VirtualTerrainHeightmap) == false) {
                context.CreateRenderTexture(ContextConstants.VirtualTerrainHeightmap, heightmapSize, heightmapFormat, true);

                context.RegisterHeightmapCompositive(ContextConstants.VirtualTerrainHeightmap);
            }
            var virtualTerrainHeightmap = context.GetRenderTexture(ContextConstants.VirtualTerrainHeightmap);

            if (virtualTerrainHeightmap.CheckSize(heightmapSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }
                context.DestroyRenderTexture(ContextConstants.VirtualTerrainHeightmap);
                virtualTerrainHeightmap = context.CreateRenderTexture(ContextConstants.VirtualTerrainHeightmap, heightmapSize, heightmapFormat, true);
            }
            //--
            if (context.IsRenderTextureExists(ContextConstants.FinalTerrainHeightmap) == false) {
                context.CreateRenderTexture(ContextConstants.FinalTerrainHeightmap, heightmapSize, heightmapFormat, true);
            }

            var finalTerrainHeightmap = context.GetRenderTexture(ContextConstants.FinalTerrainHeightmap);

            if (finalTerrainHeightmap.CheckSize(heightmapSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }
                context.DestroyRenderTexture(ContextConstants.FinalTerrainHeightmap);
                finalTerrainHeightmap = context.CreateRenderTexture(ContextConstants.FinalTerrainHeightmap, heightmapSize, heightmapFormat, true);
            }
            //--
            if (context.IsRenderTextureExists(ContextConstants.BufferHeightmapTexture) == false) {
                context.CreateRenderTexture(ContextConstants.BufferHeightmapTexture, heightmapSize, heightmapFormat, true);
            }

            var bufferHeightmapTexture = context.GetRenderTexture(ContextConstants.BufferHeightmapTexture);

            if (bufferHeightmapTexture.CheckSize(heightmapSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }
                context.DestroyRenderTexture(ContextConstants.FinalTerrainHeightmap);
                bufferHeightmapTexture = context.CreateRenderTexture(ContextConstants.BufferHeightmapTexture, heightmapSize, heightmapFormat, true);
            }
            //--
            if (context.IsRenderTextureExists(ContextConstants.BufferNormalmapTexture) == false) {
                context.CreateRenderTexture(ContextConstants.BufferNormalmapTexture, normalmapSize, normalmapFormat, true);    
            }

            var bufferNormalmapTexture = context.GetRenderTexture (ContextConstants.BufferNormalmapTexture);

            if (bufferHeightmapTexture.CheckSize(normalmapSize) == false) {
                context.DestroyRenderTexture(ContextConstants.BufferNormalmapTexture);

                bufferNormalmapTexture = context.CreateRenderTexture(ContextConstants.BufferNormalmapTexture, normalmapSize, normalmapFormat, true);
            }
            //--

            if (context.IsDebugMode()) {
                var debug = context.GetTextureDebug();

                debug.SetTexture("Buffer Normalmap", bufferNormalmapTexture);
                debug.SetTexture("Unity Normalmap", terrain.normalmapTexture);
                debug.SetTexture("Brush Mask", brushMaskTexture);
                debug.SetTexture("Heightmap", heightmapTexture);
                debug.SetTexture("Brush Heightmap", brushHeightmap);
                debug.SetTexture("Heightmap Result", heightmapResultTexture);
                debug.SetTexture("Mask", maskTexture);
                debug.SetTexture("Buffer Heightmap", bufferHeightmapTexture);
                debug.SetTexture("Terrain Heightmap", terrain.terrainData.heightmapTexture);
                debug.SetTexture("Virtual Heightmap", virtualTerrainHeightmap);
                debug.SetTexture("Final Heightmap", finalTerrainHeightmap);
            }
        }
    }
}