using UnityEngine;
using UnityEngine.Rendering;

namespace TerrainTools {
    public class FenceManager {
        private readonly (GraphicsFence fence, bool valid)[] m_fences;
        private int m_lastFence = -1;

        public void RegisterFence(GraphicsFence fence) {
            m_lastFence++;

            if (m_fences[m_lastFence].valid) {
                if(m_fences[m_lastFence].fence.passed == false) {
                    Debug.Assert(false, "All the fence spots are being used.");
                }
            }

            m_fences[m_lastFence] = (fence, true);

            if(m_lastFence >= m_fences.Length) {
                m_lastFence = -1;
            }
        }

        public bool IsFencePassed() {
            bool result = true;

            for (int i = 0; i <= m_fences.Length; i++) {
                if (m_fences[i].valid == false)
                    continue;

                if (m_fences[i].fence.passed) {
                    m_fences[i].valid = false;
                } else if(result) {
                    result = false;
                }
            }
            return true;
        }

        public FenceManager(int maxFences = 4) {
            m_fences = new (GraphicsFence fence, bool valid)[maxFences];
        }
    }
}