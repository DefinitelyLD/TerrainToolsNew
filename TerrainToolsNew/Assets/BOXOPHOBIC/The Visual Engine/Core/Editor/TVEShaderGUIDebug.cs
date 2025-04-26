//Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

namespace TheVisualEngine
{
    public class DebugGUI : ShaderGUI
    {
        GUIStyle styleButton;

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
        {
            var material0 = materialEditor.target as Material;

            DrawDynamicInspector(material0, materialEditor, props);
        }

        void DrawDynamicInspector(Material material, MaterialEditor materialEditor, MaterialProperty[] props)
        {
            styleButton = new GUIStyle(GUI.skin.GetStyle("Button"))
            {
                alignment = TextAnchor.MiddleLeft,
            };

            var customPropsList = new List<MaterialProperty>();

            for (int i = 0; i < props.Length; i++)
            {
                var prop = props[i];

                if (prop.flags == MaterialProperty.PropFlags.HideInInspector)
                {
                    continue;
                }

                if (prop.name == "unity_Lightmaps")
                    continue;

                if (prop.name == "unity_LightmapsInd")
                    continue;

                if (prop.name == "unity_ShadowMasks")
                    continue;

                if (prop.name.Contains("_Banner"))
                    continue;

                customPropsList.Add(prop);
            }

            //Draw Custom GUI
            for (int i = 0; i < customPropsList.Count; i++)
            {
                var prop = customPropsList[i];

                GUILayout.BeginHorizontal();

                materialEditor.ShaderProperty(prop, prop.displayName); //+ " (" + prop.name + ")");

                GUILayout.Space(2);

                //GUILayout.TextField(prop.name, GUILayout.Width(50));

                if (GUILayout.Button("C", styleButton, GUILayout.Width(20)))
                {
                    GUIUtility.systemCopyBuffer = prop.name;
                }

                if (GUILayout.Button("T", styleButton, GUILayout.Width(20)))
                {
                    if (prop.type == MaterialProperty.PropType.Texture)
                    {
                        GUIUtility.systemCopyBuffer = "Material COPY_TEX " + prop.name + " XXX";
                    }

                    if (prop.type == MaterialProperty.PropType.Float || prop.type == MaterialProperty.PropType.Int || prop.type == MaterialProperty.PropType.Range)
                    {
                        GUIUtility.systemCopyBuffer = "Material COPY_FLOAT " + prop.name + " XXX";
                    }

                    if (prop.type == MaterialProperty.PropType.Vector || prop.type == MaterialProperty.PropType.Color)
                    {
                        GUIUtility.systemCopyBuffer = "Material COPY_VECTOR " + prop.name + " XXX";
                    }
                }

                GUILayout.EndHorizontal();
            }

            GUILayout.Space(20);
        }
    }
}

