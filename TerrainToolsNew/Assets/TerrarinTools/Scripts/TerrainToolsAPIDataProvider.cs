using UnityEngine;

namespace TerrainTools {
    public class TerrainToolsAPIDataProvider : MonoBehaviour {
        private static TerrainToolsController m_controller;
        public static APIData GetAPIData() {
            if (m_controller == null) {
                m_controller = GameObject.FindFirstObjectByType<TerrainToolsController>();
            }
            return m_controller.GetAPIData();
        }
    }
}