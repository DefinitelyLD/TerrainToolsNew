using System;
using System.Collections.Generic;
using UnityEngine;

namespace TerrainTools {
    public class TerrainToolsDebugView : MonoBehaviour {
        [Serializable]
        public class View {
            public string name;
            public Texture texture;
        }

        [Serializable]
        public class MeshView {
            public string name;
            public Mesh mesh;
        }

        public List<View> views;
        public List<MeshView> meshViews;

        private void Awake() {
            Clear();
        }

        public void Clear() {
            views = new();
            meshViews = new();
        }
        public void SetTexture(string name, Texture texture) {
            views.Add(new View() { name = name, texture = texture });
        }
        public void SetMesh(string name, Mesh mesh) {
            meshViews.Add(new MeshView() { name = name, mesh = mesh });
        }
    }
}