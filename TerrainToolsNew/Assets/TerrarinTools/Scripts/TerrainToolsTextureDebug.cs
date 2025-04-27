using System;
using System.Collections.Generic;
using UnityEngine;

namespace TerrainTools {
    public class TerrainToolsTextureDebug : MonoBehaviour {
        [Serializable]
        public class View {
            public string name;
            public RenderTexture texture;
        }

        public List<View> views;

        private void Awake() {
            Clear();
        }

        public void Clear() {
            views = new();
        }
        public void SetTexture(string name, RenderTexture texture) {
            views.Add(new View() { name = name, texture = texture });
        }
    }
}