namespace TerrainTools {
    public abstract class TerrainBrush {

        public virtual void Prepare(IBrushContext context) {
            // default implementation does nothing
        }

        public abstract void OnBrushDown(IBrushContext context);
        public abstract void OnBrushUpdate(IBrushContext context);
        public abstract void OnBrushUp(IBrushContext context);

        public virtual void RenderHologram(IBrushContext context) {
            // default implementation does nothing
        }
    }
}
