using System.Diagnostics;
using UnityEngine;
using UnityEngine.Rendering;
using Debug = UnityEngine.Debug;

namespace TerrainTools {
    public class FenceManager {
        private readonly (GraphicsFence fence, bool valid)[] m_fences;
        private int m_lastFence = -1;

        private readonly Stopwatch m_stopwach;

        public void RegisterFence(GraphicsFence fence) {
            return;

            m_lastFence++;

            if (m_lastFence >= m_fences.Length) {
                m_lastFence = 0;
            }

            if (m_fences[m_lastFence].valid) {
                if(m_fences[m_lastFence].fence.passed == false) {
                    Debug.Assert(false, "All the fence spots are being used.");
                }
            }

            m_fences[m_lastFence] = (fence, true);
        }

        public bool IsFencePassed() {
            return true;

            var passed = IsFencePassedNonBlock();

/*            if (passed == false) {
                m_stopwach.Reset();
                m_stopwach.Start();
                while (!passed) {
                    passed = IsFencePassedNonBlock();
                }
                m_stopwach.Stop();
                Debug.LogWarning($"FenceManager: {m_stopwach.ElapsedMilliseconds} ms " +
                    $"| {(m_stopwach.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000} microseconds " +
                    $"| {(m_stopwach.ElapsedTicks / (double)Stopwatch.Frequency) * 1000000000} ns to pass the fence. CPU was blocked.");
            }*/
            return passed;
        }

        private bool IsFencePassedNonBlock() {
            bool result = true;

            for (int i = 0; i < m_fences.Length; i++) {
                if (m_fences[i].valid == false)
                    continue;

                if (m_fences[i].fence.passed) {
                    m_fences[i].valid = false;
                } else if (result) {
                    result = false;
                }
            }
            return result;
        }

        public FenceManager(int maxFences = 4) {
            m_fences = new (GraphicsFence fence, bool valid)[maxFences];
            m_stopwach = new();
        }
    }
}