using System;

namespace TerrainTools {
    public static class BrushModeExtensions {
        public static Type GetName(this BrushMode mode) => mode switch {
            BrushMode.None => null,
            BrushMode.Raise => typeof(RaiseTerrainBrush),
            BrushMode.Lower => typeof(LowerTerrainBrush),
            BrushMode.Smooth => typeof(SmoothTerrainBrush),
            BrushMode.Flatten => typeof(FlatTerrainBrush),
            BrushMode.Erase => typeof(EraseTerrainBrush),
            BrushMode.Paint => typeof(PaintTerrainBrush),
            BrushMode.Stripes => typeof(StripsTerrainBrush),
            BrushMode.CurveyStripes => typeof(CurveyStripsTerrainBrush),
            BrushMode.Spiral => typeof(SpiralTerrainBrush),
            BrushMode.DoubleSpiral => typeof(DoubleSpiralTerrainBrush),
            BrushMode.Rings => typeof(RingsTerrainBrush),
            BrushMode.PatternEraser => typeof(PatternEraseTerrainBrush),
            BrushMode.RaiseWater => typeof(RaiseWaterTerrainBrush),
            BrushMode.LowerWater => typeof(LowerWaterTerrainBrush),
            _ => throw new ArgumentOutOfRangeException(nameof(mode), mode, null)
        };
    }
}
