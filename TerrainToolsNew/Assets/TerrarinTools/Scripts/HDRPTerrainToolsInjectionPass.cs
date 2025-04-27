using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;

namespace TerrainTools {
    public class HDRPTerrainToolsInjectionPass : CustomPass {

        public static CommandBuffer CommandBuffer;
        public static bool SubmitPass = false;

        protected override void Execute(CustomPassContext ctx) {
            if (SubmitPass == false)
                return;
            else
                SubmitPass = false;

            Debug.Assert(CommandBuffer != null);

            ctx.renderContext.ExecuteCommandBuffer(CommandBuffer);
            CommandBuffer = null;

            TerrainToolsUtils.Log("Command Buffer Submitted from Custom Pass Injection.");
        }
    }
}