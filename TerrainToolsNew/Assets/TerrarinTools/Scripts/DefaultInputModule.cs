using UnityEngine;

namespace TerrainTools {
    [InputModuleAttribute(InputModuleType.Default)]
    public sealed class DefaultInputModule : InputModule {
        public override Vector2 GetMousePosition() {
            return Input.mousePosition;
        }

        public override bool IsMouseLeftClickDown() {
            return Input.GetKeyDown(KeyCode.Space);
        }

        public override bool IsMouseLeftClickHold() {
            return Input.GetKey(KeyCode.Space);
        }

        public override bool IsMouseLeftClickUp() {
            return Input.GetKeyUp(KeyCode.Space);
        }
        public override bool IsMouseRightClickDown() {
            return Input.GetKeyDown(KeyCode.Mouse1);
        }

        public override bool IsMouseRightClickHold() {
            return Input.GetKey(KeyCode.Mouse1);
        }

        public override bool IsMouseRightClickUp() {
            return Input.GetKeyUp(KeyCode.Mouse1);
        }
    }
}
