// Made with Amplify Shader Editor v1.9.8.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Visual Engine/Elements/Fade Slope (Model)"
{
	Properties
	{
		[StyledMessage(Info, Use the Fade Slope elements to cut out the alpha based on the object element normal orientation., 0, 15)]_ElementMessage("Element Message", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 2060
		[HideInInspector]_IsElementShader("_IsElementShader", Float) = 1
		[StyledCategory(Render Settings, true, 0, 10)]_RenderCategory("[ Render Category ]", Float) = 1
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMask(Fade Layers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[Enum(Multiply,0,Additive,1)]_ElementBlendA("Render Blend", Float) = 0
		[StyledSpace(10)]_EndRender("[ End Render ]", Float) = 1
		[StyledCategory(Element Settings, true, 0, 10)]_CategoryElement("[ Category Element ]", Float) = 1
		[StyledVector(18)]_ElementSlopeAxis("Element Slope Axis", Vector) = (0,1,0,0)
		[StyledRemapSlider]_ElementSlopeRemap("Element Slope Mask", Vector) = (0,1,0,0)
		[StyledSpace(10)]_EndElement("[ End Element ]", Float) = 1
		[StyledCategory(Fading Settings, true, 0, 10)]_CategoryFade("[ Category Fade ]", Float) = 1
		[Enum(Off,0,On,1)]_ElementVolumeFadeMode("Bounds Fade", Float) = 0
		_ElementVolumeFadeValue("Bounds Fade Blend", Range( 0 , 1)) = 0.75
		[StyledSpace(10)]_EndFade("[ End Fade ]", Float) = 1
		[HideInInspector]_render_src("_render_src", Float) = 0
		[HideInInspector]_render_dst("_render_dst", Float) = 2

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "DisableBatching"="True" }
	LOD 100

		
		Pass
		{
			
			Name "VolumePass"
			Tags { "LightMode"="VolumePass" }
			
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend One Zero, [_render_src] [_render_dst]
			AlphaToMask Off
			Cull Back
			ColorMask A
			ZWrite Off
			ZTest LEqual
			
			CGPROGRAM

			#define ASE_VERSION 19801


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _RenderCategory;
			uniform half _ElementLayerMask;
			uniform half _CategoryElement;
			uniform half _EndElement;
			uniform half _EndRender;
			uniform half _CategoryFade;
			uniform half _EndFade;
			uniform float _render_src;
			uniform float _render_dst;
			uniform half _ElementMessage;
			uniform half3 _ElementSlopeAxis;
			uniform half4 _ElementSlopeRemap;
			uniform float _ElementIntensity;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;
			uniform half _ElementBlendA;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_normalWS = UnityObjectToWorldNormal( v.ase_normal );
				o.ase_texcoord1.xyz = ase_normalWS;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float3 ase_normalWS = i.ase_texcoord1.xyz;
				half3 Object_NormalWS256 = ase_normalWS;
				float3 normalizeResult251 = normalize( _ElementSlopeAxis );
				float dotResult232 = dot( Object_NormalWS256 , normalizeResult251 );
				float clampResult17_g23057 = clamp( dotResult232 , 0.0001 , 0.9999 );
				float temp_output_7_0_g23071 = _ElementSlopeRemap.x;
				float temp_output_9_0_g23071 = ( clampResult17_g23057 - temp_output_7_0_g23071 );
				float Terrain_Slope243 = saturate( ( ( temp_output_9_0_g23071 / ( _ElementSlopeRemap.y - temp_output_7_0_g23071 ) ) + 0.0001 ) );
				float temp_output_7_0_g23070 = 1.0;
				float temp_output_9_0_g23070 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g23070 );
				float lerpResult18_g23068 = lerp( 1.0 , saturate( ( temp_output_9_0_g23070 / ( _ElementVolumeFadeValue - temp_output_7_0_g23070 ) ) ) , _ElementVolumeFadeMode);
				float Element_Alpha196 = ( _ElementIntensity * lerpResult18_g23068 );
				float lerpResult238 = lerp( 1.0 , Terrain_Slope243 , Element_Alpha196);
				float lerpResult236 = lerp( lerpResult238 , ( Terrain_Slope243 * Element_Alpha196 ) , _ElementBlendA);
				float4 appendResult188 = (float4(0.0 , 0.0 , 0.0 , lerpResult236));
				
				
				finalColor = appendResult188;
				return finalColor;
			}
			ENDCG
		}
		
		
		Pass
		{
			
			Name "VisualPass"
			
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend SrcAlpha OneMinusSrcAlpha
			AlphaToMask Off
			Cull Back
			ColorMask RGBA
			ZWrite Off
			ZTest LEqual
			
			CGPROGRAM

			#define ASE_VERSION 19801


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _RenderCategory;
			uniform half _ElementLayerMask;
			uniform half _CategoryElement;
			uniform half _EndElement;
			uniform half _EndRender;
			uniform half _CategoryFade;
			uniform half _EndFade;
			uniform float _render_src;
			uniform float _render_dst;
			uniform half _ElementMessage;
			uniform half3 _ElementSlopeAxis;
			uniform half4 _ElementSlopeRemap;
			uniform float _ElementIntensity;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_normalWS = UnityObjectToWorldNormal( v.ase_normal );
				o.ase_texcoord1.xyz = ase_normalWS;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float3 ase_normalWS = i.ase_texcoord1.xyz;
				half3 Object_NormalWS256 = ase_normalWS;
				float3 normalizeResult251 = normalize( _ElementSlopeAxis );
				float dotResult232 = dot( Object_NormalWS256 , normalizeResult251 );
				float clampResult17_g23057 = clamp( dotResult232 , 0.0001 , 0.9999 );
				float temp_output_7_0_g23071 = _ElementSlopeRemap.x;
				float temp_output_9_0_g23071 = ( clampResult17_g23057 - temp_output_7_0_g23071 );
				float Terrain_Slope243 = saturate( ( ( temp_output_9_0_g23071 / ( _ElementSlopeRemap.y - temp_output_7_0_g23071 ) ) + 0.0001 ) );
				float3 temp_cast_0 = (Terrain_Slope243).xxx;
				half3 Input_Color94_g23073 = temp_cast_0;
				float3 break68_g23073 = Input_Color94_g23073;
				float clampResult80_g23073 = clamp( max( max( break68_g23073.x , break68_g23073.y ) , break68_g23073.z ) , 0.1 , 10000.0 );
				float4 color263 = IsGammaSpace() ? float4(0.5,0.5,0.5,0) : float4(0.2140411,0.2140411,0.2140411,0);
				half3 Input_Tint76_g23073 = (color263).rgb;
				half3 Element_Valid47_g23073 = ( clampResult80_g23073 * Input_Tint76_g23073 );
				float temp_output_7_0_g23070 = 1.0;
				float temp_output_9_0_g23070 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g23070 );
				float lerpResult18_g23068 = lerp( 1.0 , saturate( ( temp_output_9_0_g23070 / ( _ElementVolumeFadeValue - temp_output_7_0_g23070 ) ) ) , _ElementVolumeFadeMode);
				float Element_Alpha196 = ( _ElementIntensity * lerpResult18_g23068 );
				half Input_Alpha48_g23073 = Element_Alpha196;
				float4 appendResult58_g23073 = (float4(Element_Valid47_g23073 , Input_Alpha48_g23073));
				
				
				finalColor = appendResult58_g23073;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TheVisualEngine.ElementGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19801
Node;AmplifyShaderEditor.WorldNormalVector;252;-1536,256;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;256;-576,256;Half;False;Object_NormalWS;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;233;-1536,880;Half;False;Property;_ElementSlopeAxis;Element Slope Axis;14;0;Create;False;0;0;0;False;1;StyledVector(18);False;0,1,0;0,1,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;251;-1280,880;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;261;-1536,640;Inherit;False;256;Object_NormalWS;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;232;-896,640;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;248;-768,640;Inherit;False;Math Clamp;-1;;23057;be0e6188e535d474483310546a0d9e78;0;1;6;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;247;-768,768;Half;False;Property;_ElementSlopeRemap;Element Slope Mask;15;0;Create;False;0;0;0;False;1;StyledRemapSlider;False;0,1,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;262;-1536,1152;Inherit;False;Element Fade;1;;23066;9434fbc0de86bc1468f2200e11b7c443;0;0;1;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;194;-1536,1216;Inherit;False;Element Fade Volume;18;;23068;4935729172cdadd45b9b14c3fa9c1db4;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;249;-384,640;Inherit;False;Math Remap;-1;;23071;5eda8a2bb94ebef4ab0e43d19291cd8b;2,18,0,14,0;4;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;19;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;192;-1280,1152;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;243;-64,640;Inherit;False;Terrain_Slope;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;196;-128,1152;Inherit;False;Element_Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;202;1280,-320;Inherit;False;196;Element_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;1280,-384;Inherit;False;243;Terrain_Slope;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;263;1280,-256;Inherit;False;Constant;_Color5;Color 1;63;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexelSizeNode;206;-1536,-512;Inherit;False;146;Create;1;0;SAMPLER2D;;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;204;-1536,-640;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;207;-1280,-512;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;210;-1280,-416;Half;False;Constant;_Float3;Float 3;14;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;205;-1280,-640;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;209;-1088,-512;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;208;-960,-640;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;229;-64,-640;Inherit;False;Terrain_NormalWS;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;230;-1536,704;Inherit;False;229;Terrain_NormalWS;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;188;1568,-640;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;240;768,-576;Inherit;False;196;Element_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;241;768,-320;Inherit;False;196;Element_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;242;768,-640;Inherit;False;243;Terrain_Slope;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;236;1296,-640;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;239;768,-384;Inherit;False;243;Terrain_Slope;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;235;1024,-384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;238;1024,-640;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;220;1024,-256;Half;False;Property;_ElementBlendA;Render Blend;10;1;[Enum];Create;False;0;2;Multiply;0;Additive;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;176;-832,-1408;Inherit;False;Element Compile;-1;;23072;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-1280,-1408;Half;False;Property;_CategoryElement;[ Category Element ];12;0;Create;True;0;0;0;True;1;StyledCategory(Element Settings, true, 0, 10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;215;-1280,-1344;Half;False;Property;_EndElement;[ End Element ];16;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;216;-1280,-1280;Half;False;Property;_EndRender;[ End Render ];11;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;213;-1072,-1408;Half;False;Property;_CategoryFade;[ Category Fade ];17;0;Create;True;0;0;0;True;1;StyledCategory(Fading Settings, true, 0, 10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;214;-1072,-1344;Half;False;Property;_EndFade;[ End Fade ];21;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;219;-160,-1408;Inherit;False;Property;_render_src;_render_src;22;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;218;0,-1408;Inherit;False;Property;_render_dst;_render_dst;23;1;[HideInInspector];Create;True;0;0;0;True;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;146;-768,-640;Inherit;True;Property;_TerrainNormalTex;Element Normal;13;0;Create;False;0;0;0;False;1;StyledTextureSingleLine;False;-1;None;None;True;0;False;linearGrey;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;112;-1536,-1408;Half;False;Property;_ElementMessage;Element Message;0;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Fade Slope elements to cut out the alpha based on the object element normal orientation., 0, 15);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;203;1536,-384;Inherit;False;Element Visuals;-1;;23073;78cf0f00cfd72824e84597f2db54a76e;1,64,1;3;59;FLOAT3;0,0,0;False;117;FLOAT;0;False;77;COLOR;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;199;1984,-640;Float;False;True;-1;2;TheVisualEngine.ElementGUI;100;13;BOXOPHOBIC/The Visual Engine/Elements/Fade Slope (Model);f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;0;5;False;_render_src;10;False;;1;0;True;_render_src;0;True;_render_dst;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;True;True;False;False;False;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;True;1;LightMode=VolumePass;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;200;1984,-384;Float;False;False;-1;2;AmplifyShaderEditor.MaterialInspector;100;13;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
WireConnection;256;0;252;0
WireConnection;251;0;233;0
WireConnection;232;0;261;0
WireConnection;232;1;251;0
WireConnection;248;6;232;0
WireConnection;249;6;248;0
WireConnection;249;7;247;1
WireConnection;249;8;247;2
WireConnection;192;0;262;4
WireConnection;192;1;194;0
WireConnection;243;0;249;0
WireConnection;196;0;192;0
WireConnection;207;0;206;1
WireConnection;207;1;206;2
WireConnection;205;0;204;0
WireConnection;209;0;207;0
WireConnection;209;1;210;0
WireConnection;208;0;205;0
WireConnection;208;1;209;0
WireConnection;229;0;146;5
WireConnection;188;3;236;0
WireConnection;236;0;238;0
WireConnection;236;1;235;0
WireConnection;236;2;220;0
WireConnection;235;0;239;0
WireConnection;235;1;241;0
WireConnection;238;1;242;0
WireConnection;238;2;240;0
WireConnection;146;1;208;0
WireConnection;203;59;244;0
WireConnection;203;117;202;0
WireConnection;203;77;263;0
WireConnection;199;0;188;0
WireConnection;200;0;203;0
ASEEND*/
//CHKSM=DFB94454E888DD381E376CB7B5B85865D05824E5