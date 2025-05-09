using UnityEngine;

namespace TerrainTools {
    public struct TerrainToolsWaterPasses {
        public readonly void SimulatePass(IBrushContext context, RenderTexture unityTerrainHeightmap) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();
            var brushData = context.GetBrushData();

            var waterDensitymap = context.GetRenderTexture(ContextConstants.WaterDensitymapTexture);
            var finalWaterDensitymap = context.GetRenderTexture(ContextConstants.FinalDensitymapTexture);
            var waterPrepass = context.GetRenderTexture(ContextConstants.WaterPrepassDensitymapTexture); 
            var currentMap = context.GetRenderTexture(ContextConstants.OutputWaterCurrentmapTexture);
            var outputFoamMask = context.GetRenderTexture(ContextConstants.OutputWaterFoamMaskTexture);
            var foamMask = context.GetTexture2D(ContextConstants.WaterFoamMaskTexture);
            var heightmapMask = context.GetRenderTexture(ContextConstants.TerrainMaskTexture);

            var dispatchSize = context.GetDispatchSize(waterDensitymap.GetSize());

            commandBuffer.SetComputeFloatParam(computeShader, "DeltaTime", brushData.deltaTime);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterA, "DensitymapTexture", waterDensitymap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterA, "OutputDensitymapTexture", finalWaterDensitymap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterA, "OutputPrepassDensityTexture", waterPrepass);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterA, "HeightmapTexture", unityTerrainHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterA, "OutputCurrentmap", currentMap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterA, "HeightmapMaskTexture", heightmapMask);

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterB, "OutputFoamMask", outputFoamMask);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterB, "OutputDensitymapTexture", finalWaterDensitymap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.SimulateWaterB, "OutputPrepassDensityTexture", waterPrepass);

            commandBuffer.SetRenderTarget(outputFoamMask);
            commandBuffer.ClearRenderTarget(false, true, Color.black);

            for (var i = 0; i < 64; i++) {
                commandBuffer.CopyTexture(waterDensitymap, finalWaterDensitymap);

                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.SimulateWaterA, dispatchSize.x, dispatchSize.y, dispatchSize.z);
                commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.SimulateWaterB, dispatchSize.x, dispatchSize.y, dispatchSize.z);

                commandBuffer.CopyTexture(finalWaterDensitymap, waterDensitymap);
            }

            commandBuffer.CopyTexture(outputFoamMask, foamMask);
        }

        public readonly void GenerateWaterMapsPass(IBrushContext context, RenderTexture unityHeightmap) {
            var commandBuffer = context.GetCommandBuffer();
            var computeShader = context.GetCompute();

            var currentMap = context.GetRenderTexture(ContextConstants.OutputWaterCurrentmapTexture);
            var outputFoamMask = context.GetRenderTexture(ContextConstants.OutputWaterFoamMaskTexture);
            var foamMask = context.GetTexture2D(ContextConstants.WaterFoamMaskTexture);

            var dispatchSize = context.GetDispatchSize(currentMap.GetSize());

            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.GenerateCurrentmap, "OutputCurrentmap", currentMap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.GenerateCurrentmap, "HeightmapTexture", unityHeightmap);
            commandBuffer.SetComputeTextureParam(computeShader, (int)KernelIndicies.GenerateCurrentmap, "OutputFoamMask", outputFoamMask);

            commandBuffer.DispatchCompute(computeShader, (int)KernelIndicies.GenerateCurrentmap, dispatchSize.x, dispatchSize.y, dispatchSize.z);

            commandBuffer.CopyTexture(outputFoamMask, foamMask);
        }
    }
}