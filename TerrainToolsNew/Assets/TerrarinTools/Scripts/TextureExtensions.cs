using UnityEngine;
using UnityEngine.Rendering;

namespace TerrainTools {
    public static class TextureExtensions {
        public static bool CheckSize(this Texture2D texture, Vector2Int size) {
            return (texture.width == size.x && texture.height == size.y);
        }

        public static bool CheckSize(this RenderTexture texture, Vector2Int size) {
            return (texture.width == size.x && texture.height == size.y);
        }

        public static bool CheckSize(this GraphicsTexture texture, Vector2Int size) {
            return (texture.descriptor.width == size.x && texture.descriptor.height == size.y);
        }


        public static Vector2Int GetSize(this Texture texture) {
            return new Vector2Int(texture.width, texture.height);
        }

        public static Vector2Int GetSize(this RenderTexture texture) {
            return new Vector2Int(texture.width, texture.height);
        }

        public static Vector2Int GetSize(this GraphicsTexture texture) {
            return new Vector2Int(texture.descriptor.width, texture.descriptor.height);
        }
    }
}
