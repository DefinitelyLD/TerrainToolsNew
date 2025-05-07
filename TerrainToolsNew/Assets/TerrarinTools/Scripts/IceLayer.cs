using UnityEngine;

namespace TerrainTools {
    public class IceLayer : MonoBehaviour {
        private Material m_material;

        private void Awake() {
            if (m_material == null) {
                m_material = GetComponent<MeshRenderer>().material;
            }
        }

        public Material GetMaterial() { return m_material; }
    }
}