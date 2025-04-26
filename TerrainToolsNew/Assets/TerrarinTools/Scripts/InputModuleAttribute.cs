using System;

namespace TerrainTools {
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = false)]
    public sealed class InputModuleAttribute : Attribute {
        public readonly InputModuleType Type;

        public InputModuleAttribute(InputModuleType type) {
            Type = type;
        }

    }
}
