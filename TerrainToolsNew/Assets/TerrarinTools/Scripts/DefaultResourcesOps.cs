using System.Diagnostics;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.Experimental.Rendering;
using Debug = UnityEngine.Debug;

namespace TerrainTools {
    public struct DefaultResourcesOps {
        private const string HOLOGRAM_MESH_VERTICES_BUFFER = "HologramMeshVerticesBuffer";
        private const string HOLOGRAM_MESH_INDICIES_BUFFER = "HologramMeshIndicesBuffer";
        private const string HOLOGRAM_MESH_UVS_BUFFER = "HologramMeshUVsBuffer";

        private const string WATER_MESH_VERTICES_BUFFER = "WaterMeshVerticesBuffer";
        private const string WATER_MESH_INDICIES_BUFFER = "WaterMeshIndicesBuffer";
        private const string WATER_MESH_UVS_BUFFER = "WaterMeshUVsBuffer";

        public readonly void CreateAndResizeDefaultResources(IBrushContext context) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var waterInstances = context.GetWaterInstances();
            var waterDeformMaterial = context.GetWaterDeformDecalMaterial();

            var terrain = context.GetTerrain(); 
            var brushData = context.GetBrushData();
            
            var blitMaterial = context.GetBlitMaterial();
            var hasFencePassed = brushData.hasResourceFencePassed;

            var heightmapFormat = terrain.terrainData.heightmapTexture.graphicsFormat;
            var normalmapFormat = terrain.normalmapTexture.graphicsFormat;
            var holesmapFormat = terrain.terrainData.holesTexture.graphicsFormat;

            var heightmapSize = terrain.terrainData.heightmapTexture.GetSize();
            var normalmapSize = terrain.normalmapTexture.GetSize();
            var holesmapSize = terrain.terrainData.holesTexture.GetSize();

            var terrainSize = terrain.terrainData.size;

            var actualBrushSize = brushData.actualBrushSize;

            var hologramMeshGridCellCount = new Vector2Int(heightmapSize.x + 1, heightmapSize.y + 1);
            var waterExclusionMeshGridCellCount = new Vector2Int(heightmapSize.x, heightmapSize.y);

            int hologramVerticesCount = (hologramMeshGridCellCount.x + 1) * (hologramMeshGridCellCount.y + 1);
            int hologramIndicesCount = hologramMeshGridCellCount.x * hologramMeshGridCellCount.y * 6;

            int waterExclusionVerticesCount = (waterExclusionMeshGridCellCount.x + 1) * (waterExclusionMeshGridCellCount.y + 1);
            int waterExclusionIndicesCount = waterExclusionMeshGridCellCount.x * waterExclusionMeshGridCellCount.y * 6;

            if (context.IsComputeBufferExists(HOLOGRAM_MESH_VERTICES_BUFFER)) {
                Debug.Assert(context.IsComputeBufferExists(HOLOGRAM_MESH_UVS_BUFFER));
                Debug.Assert(context.IsComputeBufferExists(HOLOGRAM_MESH_INDICIES_BUFFER));

                // creating hologram mesh
                if (context.IsMeshsExists(ContextConstants.HologramMesh) == false) {
                    var timer = new Stopwatch();

                    timer.Start();

                    var indices = new int[hologramIndicesCount];
                    var uvs = new Vector2[hologramVerticesCount];
                    var vertices = new Vector3[hologramVerticesCount];

                    var rawVerticesBuffer = context.GetComputeBuffer(HOLOGRAM_MESH_VERTICES_BUFFER);
                    var rawIndicesBuffer = context.GetComputeBuffer(HOLOGRAM_MESH_INDICIES_BUFFER);
                    var rawUVsBuffer = context.GetComputeBuffer(HOLOGRAM_MESH_UVS_BUFFER);

                    rawIndicesBuffer.GetData(indices);
                    rawUVsBuffer.GetData(uvs);
                    rawVerticesBuffer.GetData(vertices);

                    context.CreateMesh(ContextConstants.HologramMesh, vertices, indices, uvs, true);

                    timer.Stop();
                    TerrainToolsUtils.Log($"Time took for CPU to build hologram mesh:  {timer.ElapsedMilliseconds} ms" +
                        $" | {(timer.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                        $" | {(timer.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");

                }

            }

            //--

            if (context.IsComputeBufferExists(WATER_MESH_VERTICES_BUFFER)) {
                Debug.Assert(context.IsComputeBufferExists(WATER_MESH_UVS_BUFFER));
                Debug.Assert(context.IsComputeBufferExists(WATER_MESH_INDICIES_BUFFER));

                // creating water exclusion mesh
                if (context.IsMeshsExists(ContextConstants.WaterExclusionMesh) == false) {
                    var timer = new Stopwatch();

                    timer.Start();

                    var indices = new int[waterExclusionIndicesCount];
                    var uvs = new Vector2[waterExclusionVerticesCount];
                    var vertices = new Vector3[waterExclusionVerticesCount];

                    var rawVerticesBuffer = context.GetComputeBuffer(WATER_MESH_VERTICES_BUFFER);
                    var rawIndicesBuffer = context.GetComputeBuffer(WATER_MESH_INDICIES_BUFFER);
                    var rawUVsBuffer = context.GetComputeBuffer(WATER_MESH_UVS_BUFFER);

                    rawIndicesBuffer.GetData(indices);
                    rawUVsBuffer.GetData(uvs);
                    rawVerticesBuffer.GetData(vertices);

                    var mesh = context.CreateMesh(ContextConstants.WaterExclusionMesh, vertices, indices, uvs, true);

                    timer.Stop();
                    TerrainToolsUtils.Log($"Time took for CPU to build water exclusion mesh:  {timer.ElapsedMilliseconds} ms" +
                        $" | {(timer.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} micro seconds." +
                        $" | {(timer.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns");

                    if (context.IsDebugMode()) {
                        var debug = context.GetDebugView();
                        var obj = new GameObject("Water Exluder Mesh");
                        obj.transform.SetParent(debug.transform);

                        obj.AddComponent<MeshFilter>().mesh = mesh;
                    }

                    waterInstances.WaterExcluder.SetExclusionMesh(mesh);
                }

            }

            //--
            if (context.IsComputeBufferExists(HOLOGRAM_MESH_VERTICES_BUFFER) == false) {

                context.CreateComputeBuffer(HOLOGRAM_MESH_VERTICES_BUFFER, hologramVerticesCount, Marshal.SizeOf<Vector3>(), ComputeBufferType.Default, ComputeBufferMode.Dynamic);
            }
            var hologramVerticesBuffer = context.GetComputeBuffer(HOLOGRAM_MESH_VERTICES_BUFFER);
            //--

            if (context.IsComputeBufferExists(HOLOGRAM_MESH_INDICIES_BUFFER) == false) {

                context.CreateComputeBuffer(HOLOGRAM_MESH_INDICIES_BUFFER, hologramIndicesCount, Marshal.SizeOf<int>(), ComputeBufferType.Default, ComputeBufferMode.Dynamic);
            }
            var hologramIndicesBuffer = context.GetComputeBuffer(HOLOGRAM_MESH_INDICIES_BUFFER);
            //--
            if (context.IsComputeBufferExists(HOLOGRAM_MESH_UVS_BUFFER) == false) {

                context.CreateComputeBuffer(HOLOGRAM_MESH_UVS_BUFFER, hologramVerticesCount, Marshal.SizeOf<Vector2>(), ComputeBufferType.Default, ComputeBufferMode.Dynamic);
            }
            var hologramUvsBuffer = context.GetComputeBuffer(HOLOGRAM_MESH_UVS_BUFFER);
            //--



            if (context.IsComputeBufferExists(WATER_MESH_VERTICES_BUFFER) == false) {

                context.CreateComputeBuffer(WATER_MESH_VERTICES_BUFFER, waterExclusionVerticesCount, Marshal.SizeOf<Vector3>(), ComputeBufferType.Default, ComputeBufferMode.Dynamic);
            }
            var waterVerticesBuffer = context.GetComputeBuffer(WATER_MESH_VERTICES_BUFFER);
            //--

            if (context.IsComputeBufferExists(WATER_MESH_INDICIES_BUFFER) == false) {

                context.CreateComputeBuffer(WATER_MESH_INDICIES_BUFFER, waterExclusionIndicesCount, Marshal.SizeOf<int>(), ComputeBufferType.Default, ComputeBufferMode.Dynamic);
            }
            var waterIndiciesBuffer = context.GetComputeBuffer(WATER_MESH_INDICIES_BUFFER);
            //--
            if (context.IsComputeBufferExists(WATER_MESH_UVS_BUFFER) == false) {

                context.CreateComputeBuffer(WATER_MESH_UVS_BUFFER, waterExclusionVerticesCount, Marshal.SizeOf<Vector2>(), ComputeBufferType.Default, ComputeBufferMode.Dynamic);
            }
            var waterUVsBuffer = context.GetComputeBuffer(WATER_MESH_UVS_BUFFER);
            //--

            // resizing brush mask
            if (context.IsRenderTextureExists(ContextConstants.TerrainBrushMaskTexture) == false) {
                var texture = context.CreateRenderTexture(ContextConstants.TerrainBrushMaskTexture, brushData.brushSize, GraphicsFormat.R32_SFloat, false);

                // resizing brush mask
                //var shape = context.GetCurrentBrushShape();
                //commandBuffer.Blit(shape, texture, blitMaterial);
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
                var texture = context.CreateRenderTexture(ContextConstants.TerrainMaskTexture, holesmapSize, holesmapFormat, false);

                // resizing mask texture
                commandBuffer.Blit(context.GetTerrainMaskTexture(), texture, blitMaterial);
            }

            var maskTexture = context.GetRenderTexture(ContextConstants.TerrainMaskTexture);

            if (maskTexture.CheckSize(holesmapSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(ContextConstants.TerrainMaskTexture);
                maskTexture = context.CreateRenderTexture(ContextConstants.TerrainMaskTexture, holesmapSize, holesmapFormat, false);

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
                context.DestroyRenderTexture(ContextConstants.BufferHeightmapTexture);
                bufferHeightmapTexture = context.CreateRenderTexture(ContextConstants.BufferHeightmapTexture, heightmapSize, heightmapFormat, true);
            }
            //--
            if (context.IsRenderTextureExists(ContextConstants.SecondBufferHeightmapTexture) == false) {
                context.CreateRenderTexture(ContextConstants.SecondBufferHeightmapTexture, heightmapSize, heightmapFormat, true);
            }

            var secondBufferHeightmapTexture = context.GetRenderTexture(ContextConstants.SecondBufferHeightmapTexture);

            if (bufferHeightmapTexture.CheckSize(heightmapSize) == false) {
                if (!hasFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }
                context.DestroyRenderTexture(ContextConstants.SecondBufferHeightmapTexture);
                bufferHeightmapTexture = context.CreateRenderTexture(ContextConstants.SecondBufferHeightmapTexture, heightmapSize, heightmapFormat, true);
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


            if (context.IsMeshsExists(ContextConstants.HologramMesh) == false) {
                var cellSize = terrainSize.x / hologramMeshGridCellCount.x;

                commandBuffer.SetComputeFloatParams(computeShader, "GridMeshWorldPosition", 0, 0);
                commandBuffer.SetComputeFloatParams(computeShader, "HeightmapTexelPosition", 0, 0);
                commandBuffer.SetComputeIntParams(computeShader, "GridCellCount", hologramMeshGridCellCount.x, hologramMeshGridCellCount.y);
                commandBuffer.SetComputeFloatParams(computeShader, "GridCellSize", cellSize, cellSize);
                commandBuffer.SetComputeFloatParams(computeShader, "TerrainSize", terrainSize.x, terrainSize.y, terrainSize.z);

                commandBuffer.SetComputeIntParam(computeShader, "UseTessellationMask", 0);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.TessellateGridMesh, "TessellationMaskTexture", maskTexture);

                commandBuffer.SetComputeBufferParam(computeShader, (int)KernelIndicies.TessellateGridMesh, "OutputMeshVertices", hologramVerticesBuffer);
                commandBuffer.SetComputeBufferParam(computeShader, (int)KernelIndicies.TessellateGridMesh, "OutputMeshIndices", hologramIndicesBuffer);
                commandBuffer.SetComputeBufferParam(computeShader, (int)KernelIndicies.TessellateGridMesh, "OutputMeshUVs", hologramUvsBuffer);

                var dispatchSize = context.GetDispatchSize(hologramMeshGridCellCount);
                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.TessellateGridMesh, dispatchSize.x, dispatchSize.y, dispatchSize.z);
            }
            //--

            if (context.IsMeshsExists(ContextConstants.WaterExclusionMesh) == false) {
                var cellSize = terrainSize.x / waterExclusionMeshGridCellCount.x;

                commandBuffer.SetComputeFloatParams(computeShader, "GridMeshWorldPosition", 0, 0);
                commandBuffer.SetComputeFloatParams(computeShader, "HeightmapTexelPosition", 0, 0);
                commandBuffer.SetComputeIntParams(computeShader, "GridCellCount", waterExclusionMeshGridCellCount.x, waterExclusionMeshGridCellCount.y);
                commandBuffer.SetComputeFloatParams(computeShader, "GridCellSize", cellSize, cellSize);
                commandBuffer.SetComputeFloatParams(computeShader, "TerrainSize", terrainSize.x, terrainSize.y, terrainSize.z);

                commandBuffer.SetComputeIntParam(computeShader, "UseTessellationMask", 1);
                commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.TessellateGridMesh, "TessellationMaskTexture", maskTexture);

                commandBuffer.SetComputeBufferParam(computeShader, (int)KernelIndicies.TessellateGridMesh, "OutputMeshVertices", waterVerticesBuffer);
                commandBuffer.SetComputeBufferParam(computeShader, (int)KernelIndicies.TessellateGridMesh, "OutputMeshIndices", waterIndiciesBuffer);
                commandBuffer.SetComputeBufferParam(computeShader, (int)KernelIndicies.TessellateGridMesh, "OutputMeshUVs", waterUVsBuffer);

                var dispatchSize = context.GetDispatchSize(waterExclusionMeshGridCellCount);
                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.TessellateGridMesh, dispatchSize.x, dispatchSize.y, dispatchSize.z);
            }

            //--
            if (context.IsRenderTextureExists(ContextConstants.PatternBrushHeightmapResultTexture) == false) {
                context.CreateRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture, brushData.actualBrushSize, heightmapFormat, true);
            }

            var patternBrushHeightmapResultTexture = context.GetRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);

            if (patternBrushHeightmapResultTexture.CheckSize(brushData.actualBrushSize) == false) {
                if (!brushData.hasResourceFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture);
                patternBrushHeightmapResultTexture = context.CreateRenderTexture(ContextConstants.PatternBrushHeightmapResultTexture, brushData.actualBrushSize, heightmapFormat, true);
            }
            //--

            if (context.IsRenderTextureExists(ContextConstants.PatternTexture) == false) {
                context.CreateRenderTexture(ContextConstants.PatternTexture, heightmapSize, heightmapFormat, false);
            }

            var patternTexture = context.GetRenderTexture(ContextConstants.PatternTexture);

            if (patternTexture.CheckSize(heightmapSize) == false) {
                if (!brushData.hasResourceFencePassed) {
                    TerrainToolsUtils.LogWarning("Waiting for the fence to pass before creating resource.");
                    return;
                }

                context.DestroyRenderTexture(ContextConstants.PatternTexture);
                patternTexture = context.CreateRenderTexture(ContextConstants.PatternTexture, heightmapSize, heightmapFormat, false);
            }
            //--

            var brushTexture = context.GetCurrentBrushShape();
            commandBuffer.Blit(brushTexture, brushMaskTexture, blitMaterial);
            //--

            if(!Mathf.Approximately(waterInstances.WaterSurface.transform.localScale.x, terrainSize.x) || 
               !Mathf.Approximately(waterInstances.WaterSurface.transform.localScale.z, terrainSize.z)) {
                waterInstances.WaterSurface.transform.localScale = new Vector3(terrainSize.x, 1, terrainSize.z);
            }
            if(!Mathf.Approximately(waterInstances.WaterSurface.transform.position.x, terrainSize.x * 0.5f) ||
               !Mathf.Approximately(waterInstances.WaterSurface.transform.position.x, terrainSize.z * 0.5f)) {

                waterInstances.WaterSurface.transform.position = new Vector3(terrainSize.x * 0.5f, terrain.transform.position.y, terrainSize.z * 0.5f);
            }
            if (!Mathf.Approximately(waterInstances.WaterExcluder.transform.localScale.x, 1) ||
                !Mathf.Approximately(waterInstances.WaterExcluder.transform.localScale.z, 1)) {
                waterInstances.WaterExcluder.transform.localScale = Vector3.one;
            }
            if (!Mathf.Approximately(waterInstances.WaterExcluder.transform.position.x, 0) ||
                !Mathf.Approximately(waterInstances.WaterExcluder.transform.position.x, 0)) {

                waterInstances.WaterExcluder.transform.position = Vector3.zero;
            }
            if (waterInstances.WaterDeformDecal.transform.localScale != terrainSize) {
                waterInstances.WaterDeformDecal.transform.localScale = terrainSize;
            }
            if (!Mathf.Approximately(waterInstances.WaterDeformDecal.transform.position.x, terrainSize.x * 0.5f) ||
                !Mathf.Approximately(waterInstances.WaterDeformDecal.transform.position.x, terrainSize.z * 0.5f)) {

                waterInstances.WaterDeformDecal.transform.position = new Vector3(terrainSize.x * 0.5f, terrain.transform.position.y, terrainSize.z * 0.5f);
            }
            if(waterInstances.WaterDeformDecal.amplitude != 1) {
                waterInstances.WaterDeformDecal.amplitude = 1;
            }
            if (waterInstances.WaterDeformDecal.regionSize != Vector2.one) {
                waterInstances.WaterDeformDecal.regionSize = Vector2.one;
            }
            //--

            if (context.IsRenderTextureExists(ContextConstants.WaterBrushResultMaskTexture) == false) {
                context.CreateRenderTexture(ContextConstants.WaterBrushResultMaskTexture, brushData.actualBrushSize, GraphicsFormat.R32_SFloat, true);
            }

            var waterBrushMaskResultTexture = context.GetRenderTexture(ContextConstants.WaterBrushResultMaskTexture);

            if (waterBrushMaskResultTexture.CheckSize(brushData.actualBrushSize) == false) {
                context.DestroyComputeBuffer(ContextConstants.WaterBrushResultMaskTexture);
                waterBrushMaskResultTexture = context.CreateRenderTexture(ContextConstants.WaterBrushResultMaskTexture, brushData.actualBrushSize, GraphicsFormat.R32_SFloat, true);
            }
            //--

            if (context.IsRenderTextureExists(ContextConstants.FinalWaterMaskTexture) == false) {
                context.CreateRenderTexture(ContextConstants.FinalWaterMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, true);
            }

            var finalWaterMaskTexture = context.GetRenderTexture(ContextConstants.FinalWaterMaskTexture);

            if (finalWaterMaskTexture.CheckSize(heightmapSize) == false) {
                context.DestroyComputeBuffer(ContextConstants.FinalWaterMaskTexture);
                finalWaterMaskTexture = context.CreateRenderTexture(ContextConstants.FinalWaterMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, true);
            }
            //--

            if (context.IsRenderTextureExists(ContextConstants.VirtualWaterMaskTexture) == false) {
                context.CreateRenderTexture(ContextConstants.VirtualWaterMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, true);
            }

            var virtualWaterMaskTexture = context.GetRenderTexture(ContextConstants.VirtualWaterMaskTexture);

            if (virtualWaterMaskTexture.CheckSize(heightmapSize) == false) {
                context.DestroyComputeBuffer(ContextConstants.VirtualWaterMaskTexture);
                virtualWaterMaskTexture = context.CreateRenderTexture(ContextConstants.VirtualWaterMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, true);
            }

            //--

            if (context.IsRenderTextureExists(ContextConstants.BufferWaterMaskTexture) == false) {
                context.CreateRenderTexture(ContextConstants.BufferWaterMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, true);
            }

            var bufferWaterMaskTexture = context.GetRenderTexture(ContextConstants.BufferWaterMaskTexture);

            if (virtualWaterMaskTexture.CheckSize(heightmapSize) == false) {
                context.DestroyComputeBuffer(ContextConstants.BufferWaterMaskTexture);
                bufferWaterMaskTexture = context.CreateRenderTexture(ContextConstants.BufferWaterMaskTexture, heightmapSize, GraphicsFormat.R32_SFloat, true);
            }
            //--

            if (context.IsTexture2DExists(ContextConstants.APIGetHeightTexture) == false) {
                context.CreateTexture2D(ContextConstants.APIGetHeightTexture, heightmapSize, heightmapFormat);
            }

            var apiGetHeightTexture = context.GetTexture2D(ContextConstants.APIGetHeightTexture);

            if (apiGetHeightTexture.CheckSize(heightmapSize) == false) {
                context.DestroyTexture2D(ContextConstants.APIGetHeightTexture);

                apiGetHeightTexture = context.CreateTexture2D(ContextConstants.APIGetHeightTexture, heightmapSize, heightmapFormat);
            }
            //--

            if(waterInstances.WaterDeformDecal.material != waterDeformMaterial) {
                waterInstances.WaterDeformDecal.material = waterDeformMaterial;
            }
            if(waterInstances.WaterDeformDecal.updateMode != CustomRenderTextureUpdateMode.Realtime) {
                waterInstances.WaterDeformDecal.updateMode = CustomRenderTextureUpdateMode.Realtime;
            }
            waterDeformMaterial.SetTexture("_Heightmap", terrain.terrainData.heightmapTexture);
            waterDeformMaterial.SetTexture("_Mask", finalWaterMaskTexture);
            float waterHeightOffset = 1f / terrainSize.y;
            waterDeformMaterial.SetFloat("_Offset", waterHeightOffset);


            //--

            if (context.IsHeightmapCompositiveExists(ContextConstants.PatternTexture) == false) {
                context.RegisterHeightmapCompositive(ContextConstants.PatternTexture);
            }
            //--

            if (context.IsDebugMode()) {
                var debug = context.GetDebugView();

                if (context.IsMeshsExists(ContextConstants.HologramMesh)) {
                    debug.SetMesh("Hologram Mesh", context.GetMesh(ContextConstants.HologramMesh));
                }
                if (context.IsMeshsExists(ContextConstants.WaterExclusionMesh)) {
                    debug.SetMesh("Water Excluder Mesh", context.GetMesh(ContextConstants.WaterExclusionMesh));
                }

                debug.SetTexture("Buffer Watermask Texture", bufferWaterMaskTexture);
                debug.SetTexture("Virtual Water Mask Result Texture", virtualWaterMaskTexture);
                debug.SetTexture("Final Water Mask Result Texture", finalWaterMaskTexture);
                debug.SetTexture("Water Mask Brush Result Texture", waterBrushMaskResultTexture);

                debug.SetTexture("Pattern Texture", patternTexture);
                debug.SetTexture("Pattern BrushHeightmap Result Texture", patternBrushHeightmapResultTexture);

                debug.SetTexture("Unity Terrain Holes Texture: ", terrain.terrainData.holesTexture);

                debug.SetTexture("API Get Height", apiGetHeightTexture);
                debug.SetTexture("Buffer Normalmap", bufferNormalmapTexture);
                debug.SetTexture("Unity Normalmap", terrain.normalmapTexture);
                debug.SetTexture("Brush Mask", brushMaskTexture);
                debug.SetTexture("Heightmap", heightmapTexture);
                debug.SetTexture("Brush Heightmap", brushHeightmap);
                debug.SetTexture("Heightmap Result", heightmapResultTexture);
                debug.SetTexture("Terrain Mask", maskTexture);
                debug.SetTexture("Buffer Heightmap", bufferHeightmapTexture);
                debug.SetTexture("Second Buffer Heightmap", secondBufferHeightmapTexture);
                debug.SetTexture("Terrain Heightmap", terrain.terrainData.heightmapTexture);
                debug.SetTexture("Virtual Heightmap", virtualTerrainHeightmap);
                debug.SetTexture("Final Heightmap", finalTerrainHeightmap);
            }
        }
    }
}