using System;
using UnityEngine;

namespace TerrainTools {
    public struct SlicingOperations {

        public Vector2Int SliceBrushSize(Vector2Int currentPosition, Vector2Int bounds, Vector2Int currentSize) {
            var slicedPositionNegatives = SliceBrushPosition(currentPosition, bounds);
            var slicedPositionPositives = SliceBrushPosition(currentPosition + currentSize, bounds);

            var slicePositionNegativesChange = currentPosition - slicedPositionNegatives;
            var slicePositionPositivesChange = (currentPosition + currentSize) - slicedPositionPositives;

            var newSize = currentSize += slicePositionNegativesChange;
            newSize -= slicePositionPositivesChange;

            return newSize;
        }

        public Vector2Int GetSlicedPositionShift(Vector2Int currentPosition) {
            return new Vector2Int(Math.Abs(currentPosition.x), Math.Abs(currentPosition.y));
        }

        public Vector2Int SliceBrushPosition(Vector2Int currentPosition, Vector2Int bounds) {
            var x = Mathf.Clamp(currentPosition.x, 0, bounds.x);
            var y = Mathf.Clamp(currentPosition.y, 0, bounds.y);
            return new Vector2Int(x, y);
        }
    }
}