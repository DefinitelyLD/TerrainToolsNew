using System;

namespace TerrainTools {
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = false)]
    public sealed class TerrainBrushAttribute : Attribute {
        public TerrainBrushAttribute() { }
    }
}
