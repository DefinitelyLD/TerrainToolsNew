// Upgrade NOTE: upgraded instancing buffer 'BOXOPHOBICTheVisualEngineElementsFormSizeFade' to new syntax.

// Made with Amplify Shader Editor v1.9.8.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Visual Engine/Elements/Form Size Fade"
{
	Properties
	{
		[StyledMessage(Info, Use the Size elements to add scale variation or combine it with seasons to add dynamic vegetation growing. Element Texture R and Particle Color R are used as value multipliers. Element Texture A and Particle Color A are used as alpha masks., 0, 15)]_ElementMessage("Element Message", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 2060
		[HideInInspector]_IsElementShader("_IsElementShader", Float) = 1
		[StyledCategory(Render Settings, true, 0, 10)]_RenderCategory("[ Render Category ]", Float) = 1
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMask(Form Layers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[HideInInspector]_ElementParams("Render Params", Vector) = (1,1,1,1)
		[Enum(Constant,0,Seasons,1)]_ElementMode("Render Mode", Float) = 0
		[Enum(Multiply,0,Additive,1)]_ElementBlendA("Render Blend", Float) = 0
		[StyledSpace(10)]_RenderEnd("[ Render End ]", Float) = 0
		[StyledCategory(Element Settings, true, 0, 10)]_ElementCategory("[ Element Category ]", Float) = 1
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[StyledSpace(10)]_SpaceTexture("#SpaceTexture", Float) = 0
		[Enum(Main UV,0,Planar,1)]_ElementUVsMode("Element Sampling", Float) = 0
		[StyledVector(9)]_MainUVs("Element UV Value", Vector) = (1,1,0,0)
		[StyledRemapSlider]_MainTexColorRemap("Element Value", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MainTexAlphaRemap("Element Alpha", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MainTexFalloffRemap("Element Falloff", Vector) = (0,0,0,0)
		[Space(10)]_MainValue("Element Value", Range( 0 , 1)) = 1
		[Space(10)]_AdditionalValue1("Winter Value", Range( 0 , 1)) = 1
		_AdditionalValue2("Spring Value", Range( 0 , 1)) = 1
		_AdditionalValue3("Summer Value", Range( 0 , 1)) = 1
		_AdditionalValue4("Autumn Value", Range( 0 , 1)) = 1
		[Space(10)][StyledRemapSlider]_SeasonRemap("Seasons Curve", Vector) = (0,1,0,0)
		[Space(10)]_SpeedTresholdValue("Particle Speed Treshold", Float) = 10
		[StyledSpace(10)]_ElementEnd("[ Element End ]", Float) = 0
		[StyledCategory(Fading Settings, true, 0, 10)]_FadeCategory("[ Fade Category ]", Float) = 1
		[Enum(Off,0,On,1)]_ElementVolumeFadeMode("Bounds Fade", Float) = 0
		_ElementVolumeFadeValue("Bounds Fade Blend", Range( 0 , 1)) = 0.75
		[HDR][Enum(Off,0,On,1)][Space(10)]_ElementRaycastMode("Raycast Fade", Float) = 0
		[StyledLayers()]_RaycastLayerMask("Raycast Layer", Float) = 1
		_RaycastDistanceMaxValue("Raycast Limit", Float) = 2
		[StyledSpace(10)]_FadeEnd("[ Fade End ]", Float) = 0
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
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _RenderCategory;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _ElementLayerMask;
			uniform half _render_dst;
			uniform half _render_src;
			uniform half4 _MainTexColorRemap;
			uniform half _RaycastLayerMask;
			uniform half _RaycastDistanceMaxValue;
			uniform half _ElementRaycastMode;
			uniform half _FadeEnd;
			uniform half _SpaceTexture;
			uniform half _FadeCategory;
			uniform half _ElementCategory;
			uniform half _ElementEnd;
			uniform half _RenderEnd;
			uniform float _SpeedTresholdValue;
			uniform half _ElementMessage;
			uniform half _MainValue;
			uniform half4 TVE_SeasonOption;
			uniform half _AdditionalValue1;
			uniform half _AdditionalValue2;
			uniform half TVE_SeasonLerp;
			uniform half4 _SeasonRemap;
			uniform half _AdditionalValue3;
			uniform half _AdditionalValue4;
			uniform half _ElementMode;
			uniform sampler2D _MainTex;
			uniform half _ElementUVsMode;
			uniform half4 _MainUVs;
			uniform half _ElementIntensity;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexFalloffRemap;
			uniform half4 TVE_RenderBasePositionR;
			uniform half _ElementVolumeFadeValue;
			uniform half _ElementVolumeFadeMode;
			uniform half _ElementBlendA;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVisualEngineElementsFormSizeFade)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVisualEngineElementsFormSizeFade
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVisualEngineElementsFormSizeFade)

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				half TVE_SeasonOptions_X50_g76864 = TVE_SeasonOption.x;
				half Value_Winter158_g76864 = _AdditionalValue1;
				half Value_Spring159_g76864 = _AdditionalValue2;
				half temp_output_7_0_g76872 = _SeasonRemap.x;
				half temp_output_9_0_g76872 = ( TVE_SeasonLerp - temp_output_7_0_g76872 );
				half TVE_SeasonLerp54_g76864 = saturate( saturate( ( temp_output_9_0_g76872 / ( _SeasonRemap.y - temp_output_7_0_g76872 ) ) ) );
				half lerpResult168_g76864 = lerp( Value_Winter158_g76864 , Value_Spring159_g76864 , TVE_SeasonLerp54_g76864);
				half TVE_SeasonOptions_Y51_g76864 = TVE_SeasonOption.y;
				half Value_Summer160_g76864 = _AdditionalValue3;
				half lerpResult167_g76864 = lerp( Value_Spring159_g76864 , Value_Summer160_g76864 , TVE_SeasonLerp54_g76864);
				half TVE_SeasonOptions_Z52_g76864 = TVE_SeasonOption.z;
				half Value_Autumn161_g76864 = _AdditionalValue4;
				half lerpResult166_g76864 = lerp( Value_Summer160_g76864 , Value_Autumn161_g76864 , TVE_SeasonLerp54_g76864);
				half TVE_SeasonOptions_W53_g76864 = TVE_SeasonOption.w;
				half lerpResult165_g76864 = lerp( Value_Autumn161_g76864 , Value_Winter158_g76864 , TVE_SeasonLerp54_g76864);
				half vertexToFrag11_g76866 = ( ( ( TVE_SeasonOptions_X50_g76864 * lerpResult168_g76864 ) + ( TVE_SeasonOptions_Y51_g76864 * lerpResult167_g76864 ) ) + ( ( TVE_SeasonOptions_Z52_g76864 * lerpResult166_g76864 ) + ( TVE_SeasonOptions_W53_g76864 * lerpResult165_g76864 ) ) );
				o.ase_texcoord1.x = vertexToFrag11_g76866;
				float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( v.vertex ).xyz, 1 ) ).xyz;
				half2 appendResult1900_g76864 = (half2(ase_positionWS.x , ase_positionWS.z));
				half2 lerpResult1899_g76864 = lerp( ( 1.0 - v.ase_texcoord.xy ) , appendResult1900_g76864 , _ElementUVsMode);
				half2 vertexToFrag11_g76879 = ( ( lerpResult1899_g76864 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord1.yz = vertexToFrag11_g76879;
				
				o.ase_color = v.color;
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.zw = 0;
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
				half Value_Main157_g76864 = _MainValue;
				half vertexToFrag11_g76866 = i.ase_texcoord1.x;
				half Value_Seasons1721_g76864 = vertexToFrag11_g76866;
				half Element_Mode55_g76864 = _ElementMode;
				half lerpResult181_g76864 = lerp( Value_Main157_g76864 , Value_Seasons1721_g76864 , Element_Mode55_g76864);
				half2 vertexToFrag11_g76879 = i.ase_texcoord1.yz;
				half4 MainTex_RGBA587_g76864 = tex2D( _MainTex, vertexToFrag11_g76879 );
				half3 temp_cast_0 = (0.0001).xxx;
				half3 temp_cast_1 = (0.9999).xxx;
				half3 clampResult17_g76873 = clamp( (MainTex_RGBA587_g76864).rgb , temp_cast_0 , temp_cast_1 );
				half temp_output_7_0_g76871 = _MainTexColorRemap.x;
				half3 temp_cast_2 = (temp_output_7_0_g76871).xxx;
				half3 temp_output_9_0_g76871 = ( clampResult17_g76873 - temp_cast_2 );
				half3 temp_output_1765_0_g76864 = saturate( ( temp_output_9_0_g76871 / ( _MainTexColorRemap.y - temp_output_7_0_g76871 ) ) );
				half Element_Remap_R73_g76864 = (temp_output_1765_0_g76864).x;
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_R1738_g76864 = _ElementParams_Instance.x;
				half Element_Value1744_g76864 = ( Element_Remap_R73_g76864 * Element_Params_R1738_g76864 * i.ase_color.r );
				half Final_Extras_RGB213_g76864 = ( lerpResult181_g76864 * Element_Value1744_g76864 );
				half clampResult17_g76874 = clamp( (MainTex_RGBA587_g76864).a , 0.0001 , 0.9999 );
				half temp_output_7_0_g76870 = _MainTexAlphaRemap.x;
				half temp_output_9_0_g76870 = ( clampResult17_g76874 - temp_output_7_0_g76870 );
				half Element_Remap_A74_g76864 = saturate( ( ( temp_output_9_0_g76870 / ( _MainTexAlphaRemap.y - temp_output_7_0_g76870 ) ) + 0.0001 ) );
				half Element_Params_A1737_g76864 = _ElementParams_Instance.w;
				half clampResult17_g76868 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord2.xy*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				half temp_output_7_0_g76869 = _MainTexFalloffRemap.x;
				half temp_output_9_0_g76869 = ( clampResult17_g76868 - temp_output_7_0_g76869 );
				half Element_Falloff1883_g76864 = saturate( ( ( temp_output_9_0_g76869 / ( _MainTexFalloffRemap.y - temp_output_7_0_g76869 ) ) + 0.0001 ) );
				half temp_output_7_0_g76878 = 1.0;
				half temp_output_9_0_g76878 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g76878 );
				half lerpResult18_g76876 = lerp( 1.0 , saturate( ( temp_output_9_0_g76878 / ( _ElementVolumeFadeValue - temp_output_7_0_g76878 ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g76864 = ( _ElementIntensity * Element_Remap_A74_g76864 * Element_Params_A1737_g76864 * i.ase_color.a * Element_Falloff1883_g76864 * lerpResult18_g76876 );
				half lerpResult1634_g76864 = lerp( 1.0 , Final_Extras_RGB213_g76864 , Element_Alpha56_g76864);
				half Element_BlendA918_g76864 = _ElementBlendA;
				half lerpResult933_g76864 = lerp( lerpResult1634_g76864 , ( Final_Extras_RGB213_g76864 * Element_Alpha56_g76864 ) , Element_BlendA918_g76864);
				half Final_Extras_Blend211_g76864 = lerpResult933_g76864;
				half4 appendResult473_g76864 = (half4(Final_Extras_RGB213_g76864 , 0.0 , 0.0 , Final_Extras_Blend211_g76864));
				
				
				finalColor = appendResult473_g76864;
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
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _RenderCategory;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _ElementLayerMask;
			uniform half _render_dst;
			uniform half _render_src;
			uniform half4 _MainTexColorRemap;
			uniform half _RaycastLayerMask;
			uniform half _RaycastDistanceMaxValue;
			uniform half _ElementRaycastMode;
			uniform half _FadeEnd;
			uniform half _SpaceTexture;
			uniform half _FadeCategory;
			uniform half _ElementCategory;
			uniform half _ElementEnd;
			uniform half _RenderEnd;
			uniform half _SpeedTresholdValue;
			uniform half _ElementMessage;
			uniform half _MainValue;
			uniform half4 TVE_SeasonOption;
			uniform half _AdditionalValue1;
			uniform half _AdditionalValue2;
			uniform half TVE_SeasonLerp;
			uniform half4 _SeasonRemap;
			uniform half _AdditionalValue3;
			uniform half _AdditionalValue4;
			uniform half _ElementMode;
			uniform sampler2D _MainTex;
			uniform half _ElementUVsMode;
			uniform half4 _MainUVs;
			uniform half _ElementIntensity;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexFalloffRemap;
			uniform half4 TVE_RenderBasePositionR;
			uniform half _ElementVolumeFadeValue;
			uniform half _ElementVolumeFadeMode;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVisualEngineElementsFormSizeFade)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVisualEngineElementsFormSizeFade
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVisualEngineElementsFormSizeFade)

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				half TVE_SeasonOptions_X50_g76864 = TVE_SeasonOption.x;
				half Value_Winter158_g76864 = _AdditionalValue1;
				half Value_Spring159_g76864 = _AdditionalValue2;
				half temp_output_7_0_g76872 = _SeasonRemap.x;
				half temp_output_9_0_g76872 = ( TVE_SeasonLerp - temp_output_7_0_g76872 );
				half TVE_SeasonLerp54_g76864 = saturate( saturate( ( temp_output_9_0_g76872 / ( _SeasonRemap.y - temp_output_7_0_g76872 ) ) ) );
				half lerpResult168_g76864 = lerp( Value_Winter158_g76864 , Value_Spring159_g76864 , TVE_SeasonLerp54_g76864);
				half TVE_SeasonOptions_Y51_g76864 = TVE_SeasonOption.y;
				half Value_Summer160_g76864 = _AdditionalValue3;
				half lerpResult167_g76864 = lerp( Value_Spring159_g76864 , Value_Summer160_g76864 , TVE_SeasonLerp54_g76864);
				half TVE_SeasonOptions_Z52_g76864 = TVE_SeasonOption.z;
				half Value_Autumn161_g76864 = _AdditionalValue4;
				half lerpResult166_g76864 = lerp( Value_Summer160_g76864 , Value_Autumn161_g76864 , TVE_SeasonLerp54_g76864);
				half TVE_SeasonOptions_W53_g76864 = TVE_SeasonOption.w;
				half lerpResult165_g76864 = lerp( Value_Autumn161_g76864 , Value_Winter158_g76864 , TVE_SeasonLerp54_g76864);
				half vertexToFrag11_g76866 = ( ( ( TVE_SeasonOptions_X50_g76864 * lerpResult168_g76864 ) + ( TVE_SeasonOptions_Y51_g76864 * lerpResult167_g76864 ) ) + ( ( TVE_SeasonOptions_Z52_g76864 * lerpResult166_g76864 ) + ( TVE_SeasonOptions_W53_g76864 * lerpResult165_g76864 ) ) );
				o.ase_texcoord1.x = vertexToFrag11_g76866;
				float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( v.vertex ).xyz, 1 ) ).xyz;
				half2 appendResult1900_g76864 = (half2(ase_positionWS.x , ase_positionWS.z));
				half2 lerpResult1899_g76864 = lerp( ( 1.0 - v.ase_texcoord.xy ) , appendResult1900_g76864 , _ElementUVsMode);
				half2 vertexToFrag11_g76879 = ( ( lerpResult1899_g76864 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord1.yz = vertexToFrag11_g76879;
				
				o.ase_color = v.color;
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.zw = 0;
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
				half Value_Main157_g76864 = _MainValue;
				half vertexToFrag11_g76866 = i.ase_texcoord1.x;
				half Value_Seasons1721_g76864 = vertexToFrag11_g76866;
				half Element_Mode55_g76864 = _ElementMode;
				half lerpResult181_g76864 = lerp( Value_Main157_g76864 , Value_Seasons1721_g76864 , Element_Mode55_g76864);
				half2 vertexToFrag11_g76879 = i.ase_texcoord1.yz;
				half4 MainTex_RGBA587_g76864 = tex2D( _MainTex, vertexToFrag11_g76879 );
				half3 temp_cast_0 = (0.0001).xxx;
				half3 temp_cast_1 = (0.9999).xxx;
				half3 clampResult17_g76873 = clamp( (MainTex_RGBA587_g76864).rgb , temp_cast_0 , temp_cast_1 );
				half temp_output_7_0_g76871 = _MainTexColorRemap.x;
				half3 temp_cast_2 = (temp_output_7_0_g76871).xxx;
				half3 temp_output_9_0_g76871 = ( clampResult17_g76873 - temp_cast_2 );
				half3 temp_output_1765_0_g76864 = saturate( ( temp_output_9_0_g76871 / ( _MainTexColorRemap.y - temp_output_7_0_g76871 ) ) );
				half Element_Remap_R73_g76864 = (temp_output_1765_0_g76864).x;
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_R1738_g76864 = _ElementParams_Instance.x;
				half Element_Value1744_g76864 = ( Element_Remap_R73_g76864 * Element_Params_R1738_g76864 * i.ase_color.r );
				half Final_Extras_RGB213_g76864 = ( lerpResult181_g76864 * Element_Value1744_g76864 );
				half3 temp_cast_3 = (Final_Extras_RGB213_g76864).xxx;
				half3 Input_Color94_g76898 = temp_cast_3;
				half3 break68_g76898 = Input_Color94_g76898;
				half clampResult80_g76898 = clamp( max( max( break68_g76898.x , break68_g76898.y ) , break68_g76898.z ) , 0.1 , 10000.0 );
				half4 color1877_g76864 = IsGammaSpace() ? half4(0,1,0,0) : half4(0,1,0,0);
				half3 Input_Tint76_g76898 = (color1877_g76864).rgb;
				half3 Element_Valid47_g76898 = ( clampResult80_g76898 * Input_Tint76_g76898 );
				half clampResult17_g76874 = clamp( (MainTex_RGBA587_g76864).a , 0.0001 , 0.9999 );
				half temp_output_7_0_g76870 = _MainTexAlphaRemap.x;
				half temp_output_9_0_g76870 = ( clampResult17_g76874 - temp_output_7_0_g76870 );
				half Element_Remap_A74_g76864 = saturate( ( ( temp_output_9_0_g76870 / ( _MainTexAlphaRemap.y - temp_output_7_0_g76870 ) ) + 0.0001 ) );
				half Element_Params_A1737_g76864 = _ElementParams_Instance.w;
				half clampResult17_g76868 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord2.xy*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				half temp_output_7_0_g76869 = _MainTexFalloffRemap.x;
				half temp_output_9_0_g76869 = ( clampResult17_g76868 - temp_output_7_0_g76869 );
				half Element_Falloff1883_g76864 = saturate( ( ( temp_output_9_0_g76869 / ( _MainTexFalloffRemap.y - temp_output_7_0_g76869 ) ) + 0.0001 ) );
				half temp_output_7_0_g76878 = 1.0;
				half temp_output_9_0_g76878 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g76878 );
				half lerpResult18_g76876 = lerp( 1.0 , saturate( ( temp_output_9_0_g76878 / ( _ElementVolumeFadeValue - temp_output_7_0_g76878 ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g76864 = ( _ElementIntensity * Element_Remap_A74_g76864 * Element_Params_A1737_g76864 * i.ase_color.a * Element_Falloff1883_g76864 * lerpResult18_g76876 );
				half Final_Extras_A241_g76864 = Element_Alpha56_g76864;
				half Input_Alpha48_g76898 = Final_Extras_A241_g76864;
				half4 appendResult58_g76898 = (half4(Element_Valid47_g76898 , Input_Alpha48_g76898));
				
				
				finalColor = appendResult58_g76898;
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
Node;AmplifyShaderEditor.FunctionNode;188;-768,-896;Inherit;False;Element Form;1;;23774;bc58488265c2ed6408843a733b1a9124;0;0;1;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;137;-192,-1280;Inherit;False;Element Compile;-1;;76863;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;133;-608,-1152;Inherit;False;Property;_render_dst;_render_dst;73;1;[HideInInspector];Create;True;0;0;0;True;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-768,-1152;Inherit;False;Property;_render_src;_render_src;72;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;189;-512,-896;Inherit;False;Element Shader;10;;76864;0e972c73cae2ee54ea51acc9738801d0;12,477,3,1778,3,478,0,1824,0,1814,1,145,1,1784,2,481,2,1933,1,1935,1,1904,1,1907,1;1;1974;FLOAT;0;False;2;FLOAT4;0;FLOAT4;1779
Node;AmplifyShaderEditor.RangedFloatNode;112;-768,-1280;Half;False;Property;_ElementMessage;Element Message;0;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Size elements to add scale variation or combine it with seasons to add dynamic vegetation growing. Element Texture R and Particle Color R are used as value multipliers. Element Texture A and Particle Color A are used as alpha masks., 0, 15);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;179;-192,-768;Float;False;False;-1;2;AmplifyShaderEditor.MaterialInspector;100;13;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;163;-192,-896;Half;False;True;-1;2;TheVisualEngine.ElementGUI;100;13;BOXOPHOBIC/The Visual Engine/Elements/Form Size Fade;f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;0;5;False;;10;False;;1;0;True;_render_src;0;True;_render_dst;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;False;;True;True;False;False;False;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;True;1;LightMode=VolumePass;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
WireConnection;189;1974;188;4
WireConnection;179;0;189;1779
WireConnection;163;0;189;0
ASEEND*/
//CHKSM=015523D0221F559220DE39296709D99179D23CB1