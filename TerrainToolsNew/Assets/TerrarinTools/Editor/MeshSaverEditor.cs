using UnityEngine;

using UnityEditor;
using System.IO;

namespace TerrainTools {

    public class MeshSaverEditor {
        [MenuItem("Tools/Save Selected Mesh")]
        public static void SaveSelectedMesh() {
            MeshFilter meshFilter = Selection.activeGameObject?.GetComponent<MeshFilter>();
            if (meshFilter == null) {
                Debug.LogError("No MeshFilter selected!");
                return;
            }

            Mesh mesh = meshFilter.sharedMesh;

            string path = "Assets/SavedMeshes";
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            string meshPath = $"{path}/{mesh.name}_Saved.asset";
            AssetDatabase.CreateAsset(Object.Instantiate(mesh), meshPath);
            AssetDatabase.SaveAssets();

            Debug.Log($"Mesh saved to: {meshPath}");
        }
    }
}
