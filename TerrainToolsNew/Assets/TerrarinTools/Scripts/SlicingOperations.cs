using System;
using UnityEngine;

namespace TerrainTools {
    public struct SlicingOperations {

        public Vector2Int SliceBrushSize(Vector2Int currentPosition, Vector2Int bounds, Vector2Int currentSize) {

            var slicePositionNegativesChange = GetSlicedPositionShift(currentPosition, bounds);
            var slicePositionPositivesChange = GetSlicedPositionShift(currentPosition + currentSize, bounds);

            var newSize = currentSize += slicePositionNegativesChange;
            newSize -= slicePositionPositivesChange;

            return newSize;
        }

        public Vector2Int GetSlicedPositionShift(Vector2Int currentPosition, Vector2Int bounds) {
            var slicedPosition = SliceBrushPosition(currentPosition, bounds);

            var slicePositionChange = currentPosition - slicedPosition;

            return slicePositionChange;
        }

        public Vector2Int SliceBrushPosition(Vector2Int currentPosition, Vector2Int bounds) {
            var x = Mathf.Clamp(currentPosition.x, 0, bounds.x);
            var y = Mathf.Clamp(currentPosition.y, 0, bounds.y);
            return new Vector2Int(x, y);
        }
    }
}