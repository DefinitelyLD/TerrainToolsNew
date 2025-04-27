using System;

namespace TerrainTools {
    [TerrainBrush]
    public sealed class RaiseTerrainBrush : TerrainBrush {
        public override BrushType GetBrushType() {
            return BrushType.Heightmap;
        }

        public override void OnBrushDown(IBrushContext context) {
            throw new NotImplementedException();
        }

        public override void OnBrushUp(IBrushContext context) {
            throw new NotImplementedException();
        }

        public override void OnBrushUpdate(IBrushContext context) {
            throw new NotImplementedException();
        }
    }
}
