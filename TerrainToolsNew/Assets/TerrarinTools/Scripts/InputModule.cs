namespace TerrainTools {
    public abstract class InputModule {
        public abstract bool IsMouseRightClickDown();
        public abstract bool IsMouseLeftClickDown();

        public abstract bool IsMouseRightClickUp();
        public abstract bool IsMouseLeftClickUp();

        public abstract bool IsMouseRightClickHold();
        public abstract bool IsMouseLeftClickHold();
    }
}
