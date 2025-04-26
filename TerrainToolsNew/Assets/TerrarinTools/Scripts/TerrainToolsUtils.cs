using Debug = UnityEngine.Debug;

namespace TerrainTools {
    internal static class TerrainToolsUtils {
        public static bool LoggingEnabled = true;

        public static void Log(string message) {
            if (!LoggingEnabled)
                return;

            Debug.Log(message);
        }
    }
}
