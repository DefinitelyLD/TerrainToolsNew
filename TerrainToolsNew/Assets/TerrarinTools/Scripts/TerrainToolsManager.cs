using PlasticPipe.PlasticProtocol.Messages;
using System;
using System.Data;
using System.Linq;
using System.Reflection;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using Debug = UnityEngine.Debug;

namespace TerrainTools {
    public class TerrainToolsManager {

        private readonly TerrainToolsResources m_resources;
        private readonly TerrainBrush[] m_brushes;
        
        private readonly InputModule m_inputModule;

        private int m_currentBrushIndex = 0;
        private int m_currentBrushShapeIndex = 0;

        public event UnityAction OnTerrainSave;
        public event UnityAction OnTerrainLoad;

        public TerrainToolsManager(TerrainToolsResources resources) {

            m_resources = resources;

            // getting all brushes defined in this assembly
            var assembly = Assembly.GetAssembly(typeof(TerrainToolsManager));
            var brushesTypes = assembly
                .GetTypes()
                .Where(type => type.CustomAttributes.Where(info => info.AttributeType == typeof(TerrainBrushAttribute)).Count() > 0)
                .ToArray();
            var brushCount = brushesTypes.Count();
            Debug.Assert(brushCount > 0, $"No brushes found in the assembly: {assembly.FullName}");

            // creating instances of the brushes
            m_brushes = new TerrainBrush[brushCount];
            try {
                for (var i = 0; i < brushCount; i++) {
                    m_brushes[i] = (TerrainBrush)Activator.CreateInstance(brushesTypes[i]);

                    TerrainToolsUtils.Log($"Brush created: {m_brushes[i].GetType().Name}");
                }
            } catch (Exception e) {
                Debug.LogError($"Error creating brushes: {e.Message}");
                throw;
            }

            // getting the input module
            var inputModuleTypes = assembly
                .GetTypes()
                .Where(type => type.CustomAttributes.Where(info => info.AttributeType == typeof(InputModuleAttribute)).Count() > 0)
                .OrderByDescending(type => (int)type.GetCustomAttribute<InputModuleAttribute>().Type)
                .ToArray();

            Debug.Assert(inputModuleTypes.Length > 0, $"No input module found in the assembly: {assembly.FullName}");
            try {
                // create instance where the at the 0 index is prioritized to be custom one.
                m_inputModule = (InputModule)Activator.CreateInstance(inputModuleTypes[0]);

                TerrainToolsUtils.Log($"Input module created: {m_inputModule.GetType().Name}");

            } catch (Exception e) {
                Debug.LogError($"Error creating input module: {e.Message}");
                throw;
            }
        }
    }
}
