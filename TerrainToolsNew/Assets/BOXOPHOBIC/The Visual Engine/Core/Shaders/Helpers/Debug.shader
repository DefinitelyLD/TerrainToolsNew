// Made with Amplify Shader Editor v1.9.8.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/BOXOPHOBIC/The Visual Engine/Helpers/Debug"
{
	Properties
	{
		[StyledBanner(Debug)] _Banner( "Banner", Float ) = 0
		[StyledEnum(NULL, Vertex_R 0 Vertex_G 1 Vertex_B 2 Vertex_A 3 Branch 4 Leaves 5 Height 6 Sphere 7 UV0_Y 8, 0, 0)] _MotionTinyMaskMode( "Motion 01 Anim Mask", Float ) = 4
		[StyledEnum(NULL, Vertex_R 0 Vertex_G 1 Vertex_B 2 Vertex_A 3 Branch 4 Leaves 5 Height 6 Sphere 7 UV0_Y 8, 0, 0)] _MotionBaseMaskMode( "Motion 01 Anim Mask", Float ) = 3
		[StyledEnum(NULL, Vertex_R 0 Vertex_G 1 Vertex_B 2 Vertex_A 3 Branch 4 Leaves 5 Height 6 Sphere 7 UV0_Y 8, 0, 0)] _MotionSmallMaskMode( "Motion 01 Anim Mask", Float ) = 4
		[StyledRemapSlider] _MotionTinyMaskRemap( "Motion 01 Anim Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledRemapSlider] _MotionBaseMaskRemap( "Motion 01 Anim Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledRemapSlider] _MotionSmallMaskRemap( "Motion 01 Anim Mask", Vector ) = ( 0, 1, 0, 0 )
		[HideInInspector] _motion_base_proc_mode( "_motion_base_proc_mode", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _motion_tiny_proc_mode( "_motion_tiny_proc_mode", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _motion_small_proc_mode( "_motion_small_proc_mode", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _motion_tiny_vert_mode( "_motion_tiny_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _motion_small_vert_mode( "_motion_small_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _motion_base_vert_mode( "_motion_base_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		_ObjectRadiusValue( "Object Radius Value", Range( 0, 50 ) ) = 1
		[HideInInspector] _motion_tiny_mask_mode( "_motion_tiny_mask_mode", Float ) = 0
		[HideInInspector] _motion_small_mask_mode( "_motion_small_mask_mode", Float ) = 0
		[HideInInspector] _motion_base_mask_mode( "_motion_base_mask_mode", Float ) = 0
		_ObjectHeightValue( "Object Height Value", Range( 0, 50 ) ) = 1
		[HideInInspector] _object_phase_mode( "_object_phase_mode", Vector ) = ( 0, 0, 0, 0 )
		_IsVertexShader( "_IsVertexShader", Float ) = 0
		_IsSimpleShader( "_IsSimpleShader", Float ) = 0
		[HideInInspector] _IsTVEShader( "_IsTVEShader", Float ) = 0
		_IsStandardShader( "_IsStandardShader", Float ) = 0
		_IsSubsurfaceShader( "_IsSubsurfaceShader", Float ) = 0
		_IsImpostorShader( "_IsImpostorShader", Float ) = 0
		_IsCoreShader( "_IsCoreShader", Float ) = 0
		[NoScaleOffset] _MainNormalTex( "_MainNormalTex", 2D ) = "black" {}
		[NoScaleOffset] _EmissiveTex( "_EmissiveTex", 2D ) = "black" {}
		[NoScaleOffset] _SecondMaskTex( "_SecondMaskTex", 2D ) = "black" {}
		[NoScaleOffset] _SecondNormalTex( "_SecondNormalTex", 2D ) = "black" {}
		[NoScaleOffset] _SecondAlbedoTex( "_SecondAlbedoTex", 2D ) = "black" {}
		[NoScaleOffset] _MainAlbedoTex( "_MainAlbedoTex", 2D ) = "black" {}
		[NoScaleOffset] _MainMaskTex( "_MainMaskTex", 2D ) = "black" {}
		_RenderClip( "_RenderClip", Float ) = 0
		_IsElementShader( "_IsElementShader", Float ) = 0
		_IsHelperShader( "_IsHelperShader", Float ) = 0
		_MainAlphaClipValue( "_MainAlphaClipValue", Float ) = 0
		_DetailMode( "_DetailMode", Float ) = 0
		_EmissiveCat( "_EmissiveCat", Float ) = 0
		[HDR] _EmissiveColor( "_EmissiveColor", Color ) = ( 0, 0, 0, 0 )
		_IsBlanketShader( "_IsBlanketShader", Float ) = 0
		_IsPolygonalShader( "_IsPolygonalShader", Float ) = 0
		[Space(10)][StyledVector(9)] _main_coord_value( "_main_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[Enum(UV 0,0,Baked,1)] _DetailCoordMode( "Detail Coord", Float ) = 0
		[Space(10)][StyledVector(9)] _SecondUVs( "Detail UVs", Vector ) = ( 1, 1, 0, 0 )
		[Space(10)][StyledVector(9)] _EmissiveUVs( "Emissive UVs", Vector ) = ( 1, 1, 0, 0 )
		_IsIdentifier( "_IsIdentifier", Float ) = 0
		_IsLiteShader( "_IsLiteShader", Float ) = 0
		_IsCustomShader( "_IsCustomShader", Float ) = 0
		[StyledMessage(Info, Use this shader to debug the original mesh or the converted mesh attributes., 0,0)] _Message( "Message", Float ) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
		//[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		//[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		

		Tags { "RenderType"="Opaque" "Queue"="Geometry" "DisableBatching"="False" }
	LOD 0

		Cull Off
		AlphaToMask Off
		ZWrite On
		ZTest LEqual
		ColorMask RGBA

		

		Blend Off
		

		CGINCLUDE
			#pragma target 4.5

			float4 FixedTess( float tessValue )
			{
				return tessValue;
			}

			float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
			{
				float3 wpos = mul(o2w,vertex).xyz;
				float dist = distance (wpos, cameraPos);
				float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
				return f;
			}

			float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
			{
				float4 tess;
				tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
				tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
				tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
				tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
				return tess;
			}

			float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
			{
				float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
				float len = distance(wpos0, wpos1);
				float f = max(len * scParams.y / (edgeLen * dist), 1.0);
				return f;
			}

			float DistanceFromPlane (float3 pos, float4 plane)
			{
				float d = dot (float4(pos,1.0f), plane);
				return d;
			}

			bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
			{
				float4 planeTest;
				planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
				planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
				planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
				planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
				return !all (planeTest);
			}

			float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
			{
				float3 f;
				f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
				f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
				f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

				return CalcTriEdgeTessFactors (f);
			}

			float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
			{
				float3 pos0 = mul(o2w,v0).xyz;
				float3 pos1 = mul(o2w,v1).xyz;
				float3 pos2 = mul(o2w,v2).xyz;
				float4 tess;
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
				return tess;
			}

			float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
			{
				float3 pos0 = mul(o2w,v0).xyz;
				float3 pos1 = mul(o2w,v1).xyz;
				float3 pos2 = mul(o2w,v2).xyz;
				float4 tess;

				if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
				{
					tess = 0.0f;
				}
				else
				{
					tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
					tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
					tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
					tess.w = (tess.x + tess.y + tess.z) / 3.0f;
				}
				return tess;
			}
		ENDCG

		
		Pass
		{
			
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			Blend One Zero

			CGPROGRAM
				#define ASE_GEOMETRY 1
				#define ASE_FRAGMENT_NORMAL 0
				#define ASE_NEEDS_FRAG_SHADOWCOORDS
				#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
				#pragma multi_compile_instancing
				#pragma multi_compile __ LOD_FADE_CROSSFADE
				#pragma multi_compile_fog
				#define ASE_VERSION 19802
				#define ASE_USING_SAMPLING_MACROS 1

				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fwdbase
				#ifndef UNITY_PASS_FORWARDBASE
					#define UNITY_PASS_FORWARDBASE
				#endif
				#include "HLSLSupport.cginc"
				#ifdef ASE_GEOMETRY
					#ifndef UNITY_INSTANCED_LOD_FADE
						#define UNITY_INSTANCED_LOD_FADE
					#endif
					#ifndef UNITY_INSTANCED_SH
						#define UNITY_INSTANCED_SH
					#endif
					#ifndef UNITY_INSTANCED_LIGHTMAPSTS
						#define UNITY_INSTANCED_LIGHTMAPSTS
					#endif
				#endif
				#include "UnityShaderVariables.cginc"
				#include "UnityCG.cginc"
				#include "Lighting.cginc"
				#include "UnityPBSLighting.cginc"
				#include "AutoLight.cginc"

				#define ASE_NEEDS_TEXTURE_COORDINATES0
				#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
				#define ASE_NEEDS_TEXTURE_COORDINATES1
				#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
				#define ASE_NEEDS_WORLD_POSITION
				#define ASE_NEEDS_FRAG_WORLD_POSITION
				#define ASE_NEEDS_VERT_POSITION
				#define ASE_NEEDS_VERT_NORMAL
				#define ASE_NEEDS_VERT_TANGENT
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
				#define ASE_NEEDS_TEXTURE_COORDINATES3
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
				#define ASE_NEEDS_WORLD_NORMAL
				#define ASE_NEEDS_FRAG_WORLD_NORMAL
				#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
				#pragma shader_feature_local TVE_LEGACY
				#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
				#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
				#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
				#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
				#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
				#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
				#else//ASE Sampling Macros
				#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
				#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
				#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
				#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
				#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
				#endif//ASE Sampling Macros
				


				struct appdata
				{
					float4 vertex : POSITION;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					float4 ase_texcoord : TEXCOORD0;
					float4 ase_color : COLOR;
					float4 ase_texcoord3 : TEXCOORD3;
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					UNITY_POSITION( pos );
					UNITY_LIGHTING_COORDS( 0, 1 )
					UNITY_FOG_COORDS( 2 )
					float4 worldNormal : TEXCOORD3;
					float4 worldTangent : TEXCOORD4;
					float4 worldBitangent : TEXCOORD5;
					half4 ambientOrLightmapUV : TEXCOORD6;
					#if defined( ASE_NEEDS_FRAG_SCREEN_POSITION )
						float4 screenPos : TEXCOORD7;
					#endif
					float4 ase_texcoord8 : TEXCOORD8;
					float4 ase_texcoord9 : TEXCOORD9;
					float4 ase_texcoord10 : TEXCOORD10;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				#ifdef ASE_TRANSMISSION
					float _TransmissionShadow;
				#endif
				#ifdef ASE_TRANSLUCENCY
					float _TransStrength;
					float _TransNormal;
					float _TransScattering;
					float _TransDirect;
					float _TransAmbient;
					float _TransShadow;
				#endif
				#ifdef ASE_TESSELLATION
					float _TessPhongStrength;
					float _TessValue;
					float _TessMin;
					float _TessMax;
					float _TessEdgeLength;
					float _TessMaxDisp;
				#endif

				uniform half TVE_DEBUG_Layer;
				uniform half TVE_DEBUG_Index;
				uniform half TVE_DEBUG_Type;
				uniform half TVE_DEBUG_Min;
				uniform half TVE_DEBUG_Clip;
				uniform half TVE_DEBUG_Max;
				uniform half TVE_DEBUG_Filter;
				uniform half TVE_DEBUG_Shading;
				uniform half _Banner;
				uniform half _Message;
				uniform float _IsSimpleShader;
				uniform float _IsVertexShader;
				uniform half _IsTVEShader;
				uniform float _IsCoreShader;
				uniform float _IsBlanketShader;
				uniform float _IsImpostorShader;
				uniform float _IsPolygonalShader;
				uniform float _IsLiteShader;
				uniform float _IsStandardShader;
				uniform float _IsSubsurfaceShader;
				uniform float _IsCustomShader;
				uniform float _IsIdentifier;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
				uniform half4 _main_coord_value;
				SamplerState sampler_MainAlbedoTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
				SamplerState sampler_MainNormalTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
				SamplerState sampler_MainMaskTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
				uniform half _DetailCoordMode;
				uniform half4 _SecondUVs;
				SamplerState sampler_SecondAlbedoTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
				SamplerState sampler_SecondNormalTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
				SamplerState sampler_SecondMaskTex;
				uniform float _DetailMode;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
				uniform half4 _EmissiveUVs;
				SamplerState sampler_EmissiveTex;
				uniform float4 _EmissiveColor;
				uniform float _EmissiveCat;
				float4 _MainAlbedoTex_TexelSize;
				float4 _MainNormalTex_TexelSize;
				float4 _MainMaskTex_TexelSize;
				float4 _SecondAlbedoTex_TexelSize;
				float4 _SecondMaskTex_TexelSize;
				float4 _EmissiveTex_TexelSize;
				uniform float4 _MainAlbedoTex_ST;
				UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_DEBUG_MipTex);
				SamplerState samplerTVE_DEBUG_MipTex;
				uniform float4 _MainNormalTex_ST;
				uniform float4 _MainMaskTex_ST;
				uniform float4 _SecondAlbedoTex_ST;
				uniform float4 _SecondMaskTex_ST;
				uniform float4 _EmissiveTex_ST;
				uniform float TVE_CoatLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatBaseTex);
				uniform half4 TVE_RenderBaseCoords;
				SamplerState sampler_Linear_Clamp;
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatNearTex);
				uniform half4 TVE_RenderNearCoords;
				SamplerState sampler_Linear_Repeat;
				uniform float4 TVE_RenderNearPositionR;
				uniform half TVE_RenderNearFadeValue;
				uniform half4 TVE_CoatParams;
				uniform float TVE_PaintLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintNearTex);
				uniform half4 TVE_PaintParams;
				uniform float TVE_GlowLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowNearTex);
				uniform half4 TVE_GlowParams;
				uniform float TVE_AtmoLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoNearTex);
				uniform half4 TVE_AtmoParams;
				uniform float TVE_FormLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormNearTex);
				uniform half4 TVE_FormParams;
				uniform float TVE_FlowLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowNearTex);
				uniform half4 TVE_FlowParams;
				uniform float TVE_PushLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushNearTex);
				uniform half4 TVE_PushParams;
				uniform half4 _object_phase_mode;
				uniform half4 _motion_base_vert_mode;
				uniform half _ObjectHeightValue;
				uniform half4 _motion_base_proc_mode;
				uniform half _ObjectRadiusValue;
				uniform half _motion_base_mask_mode;
				uniform half4 _MotionBaseMaskRemap;
				uniform half _MotionBaseMaskMode;
				uniform half4 _motion_small_vert_mode;
				uniform half4 _motion_small_proc_mode;
				uniform half _motion_small_mask_mode;
				uniform half4 _MotionSmallMaskRemap;
				uniform half _MotionSmallMaskMode;
				uniform half4 _motion_tiny_vert_mode;
				uniform half4 _motion_tiny_proc_mode;
				uniform half _motion_tiny_mask_mode;
				uniform half4 _MotionTinyMaskRemap;
				uniform half _MotionTinyMaskMode;
				uniform float _RenderClip;
				uniform float _MainAlphaClipValue;
				uniform float _IsElementShader;
				uniform float _IsHelperShader;


				float3 HSVToRGB( float3 c )
				{
					float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
					float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
					return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
				}
				
				float2 DecodeFloatToVector2( float enc )
				{
					float2 result ;
					result.y = enc % 2048;
					result.x = floor(enc / 2048);
					return result / (2048 - 1);
				}
				

				v2f VertexFunction (appdata v  ) {
					UNITY_SETUP_INSTANCE_ID(v);
					v2f o;
					UNITY_INITIALIZE_OUTPUT(v2f,o);
					UNITY_TRANSFER_INSTANCE_ID(v,o);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

					float Debug_Index464_g127014 = TVE_DEBUG_Index;
					float3 ifLocalVar40_g127015 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127015 = saturate( v.vertex.xyz );
					float3 ifLocalVar40_g127022 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127022 = v.normal;
					float3 ifLocalVar40_g127028 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127028 = v.tangent.xyz;
					float ifLocalVar40_g127020 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127020 = saturate( v.tangent.w );
					float ifLocalVar40_g127064 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127064 = v.ase_color.r;
					float ifLocalVar40_g127065 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127065 = v.ase_color.g;
					float ifLocalVar40_g127066 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127066 = v.ase_color.b;
					float ifLocalVar40_g127067 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127067 = v.ase_color.a;
					float3 appendResult1147_g127014 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
					float3 ifLocalVar40_g127068 = 0;
					if( Debug_Index464_g127014 == 9.0 )
					ifLocalVar40_g127068 = appendResult1147_g127014;
					float3 appendResult1148_g127014 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
					float3 ifLocalVar40_g127069 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127069 = appendResult1148_g127014;
					float3 appendResult1149_g127014 = (float3(v.texcoord2.xyzw.x , v.texcoord2.xyzw.y , 0.0));
					float3 ifLocalVar40_g127089 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127089 = appendResult1149_g127014;
					float4 break33_g127087 = _object_phase_mode;
					float temp_output_30_0_g127087 = ( v.ase_color.r * break33_g127087.x );
					float temp_output_29_0_g127087 = ( v.ase_color.g * break33_g127087.y );
					float temp_output_31_0_g127087 = ( v.ase_color.b * break33_g127087.z );
					float temp_output_28_0_g127087 = ( temp_output_30_0_g127087 + temp_output_29_0_g127087 + temp_output_31_0_g127087 + ( v.ase_color.a * break33_g127087.w ) );
					half Motion_PhaseMask1725_g127014 = temp_output_28_0_g127087;
					float3 hsvTorgb260_g127014 = HSVToRGB( float3(Motion_PhaseMask1725_g127014,1.0,1.0) );
					float3 gammaToLinear266_g127014 = GammaToLinearSpace( hsvTorgb260_g127014 );
					float3 ifLocalVar40_g127090 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127090 = gammaToLinear266_g127014;
					float4 break1821_g127014 = v.ase_color;
					float4 break33_g127586 = _motion_base_vert_mode;
					float temp_output_30_0_g127586 = ( break1821_g127014.r * break33_g127586.x );
					float temp_output_29_0_g127586 = ( break1821_g127014.g * break33_g127586.y );
					float temp_output_31_0_g127586 = ( break1821_g127014.b * break33_g127586.z );
					float temp_output_28_0_g127586 = ( temp_output_30_0_g127586 + temp_output_29_0_g127586 + temp_output_31_0_g127586 + ( break1821_g127014.a * break33_g127586.w ) );
					float temp_output_1824_0_g127014 = temp_output_28_0_g127586;
					half Bounds_Height1700_g127014 = _ObjectHeightValue;
					half Final_HeightMask1815_g127014 = saturate( ( v.vertex.xyz.y / Bounds_Height1700_g127014 ) );
					float4 break33_g127590 = _motion_base_proc_mode;
					float temp_output_30_0_g127590 = ( Final_HeightMask1815_g127014 * break33_g127590.x );
					half Bounds_Radius1702_g127014 = _ObjectRadiusValue;
					half Final_SphereMask1816_g127014 = saturate( ( length( v.vertex.xyz ) / ( Bounds_Height1700_g127014 * Bounds_Radius1702_g127014 ) ) );
					float temp_output_29_0_g127590 = ( Final_SphereMask1816_g127014 * break33_g127590.y );
					float temp_output_1834_0_g127014 = ( temp_output_30_0_g127590 + temp_output_29_0_g127590 );
					float lerpResult1887_g127014 = lerp( temp_output_1824_0_g127014 , temp_output_1834_0_g127014 , _motion_base_mask_mode);
					float clampResult17_g127583 = clamp( lerpResult1887_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127584 = _MotionBaseMaskRemap.x;
					float temp_output_9_0_g127584 = ( clampResult17_g127583 - temp_output_7_0_g127584 );
					float temp_output_6_0_g127585 = saturate( ( ( temp_output_9_0_g127584 / ( _MotionBaseMaskRemap.y - temp_output_7_0_g127584 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127585 = ( temp_output_6_0_g127585 + _MotionBaseMaskMode );
					#else
					float staticSwitch14_g127585 = temp_output_6_0_g127585;
					#endif
					half Motion_BaseMask1675_g127014 = staticSwitch14_g127585;
					float ifLocalVar40_g127091 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127091 = Motion_BaseMask1675_g127014;
					float4 break1855_g127014 = v.ase_color;
					float4 break33_g127587 = _motion_small_vert_mode;
					float temp_output_30_0_g127587 = ( break1855_g127014.r * break33_g127587.x );
					float temp_output_29_0_g127587 = ( break1855_g127014.g * break33_g127587.y );
					float temp_output_31_0_g127587 = ( break1855_g127014.b * break33_g127587.z );
					float temp_output_28_0_g127587 = ( temp_output_30_0_g127587 + temp_output_29_0_g127587 + temp_output_31_0_g127587 + ( break1855_g127014.a * break33_g127587.w ) );
					float temp_output_1845_0_g127014 = temp_output_28_0_g127587;
					float4 break33_g127591 = _motion_small_proc_mode;
					float temp_output_30_0_g127591 = ( Final_HeightMask1815_g127014 * break33_g127591.x );
					float temp_output_29_0_g127591 = ( Final_SphereMask1816_g127014 * break33_g127591.y );
					float temp_output_1849_0_g127014 = ( temp_output_30_0_g127591 + temp_output_29_0_g127591 );
					float lerpResult1889_g127014 = lerp( temp_output_1845_0_g127014 , temp_output_1849_0_g127014 , _motion_small_mask_mode);
					float enc1882_g127014 = v.ase_texcoord.z;
					float2 localDecodeFloatToVector21882_g127014 = DecodeFloatToVector2( enc1882_g127014 );
					float2 break1878_g127014 = localDecodeFloatToVector21882_g127014;
					half Small_Mask_Legacy1879_g127014 = break1878_g127014.x;
					#ifdef TVE_LEGACY
					float staticSwitch1883_g127014 = Small_Mask_Legacy1879_g127014;
					#else
					float staticSwitch1883_g127014 = lerpResult1889_g127014;
					#endif
					float clampResult17_g127593 = clamp( staticSwitch1883_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127594 = _MotionSmallMaskRemap.x;
					float temp_output_9_0_g127594 = ( clampResult17_g127593 - temp_output_7_0_g127594 );
					float temp_output_6_0_g127595 = saturate( ( ( temp_output_9_0_g127594 / ( _MotionSmallMaskRemap.y - temp_output_7_0_g127594 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127595 = ( temp_output_6_0_g127595 + _MotionSmallMaskMode );
					#else
					float staticSwitch14_g127595 = temp_output_6_0_g127595;
					#endif
					half Motion_SmallMask1693_g127014 = staticSwitch14_g127595;
					float ifLocalVar40_g127092 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127092 = Motion_SmallMask1693_g127014;
					float4 break1867_g127014 = v.ase_color;
					float4 break33_g127588 = _motion_tiny_vert_mode;
					float temp_output_30_0_g127588 = ( break1867_g127014.r * break33_g127588.x );
					float temp_output_29_0_g127588 = ( break1867_g127014.g * break33_g127588.y );
					float temp_output_31_0_g127588 = ( break1867_g127014.b * break33_g127588.z );
					float temp_output_28_0_g127588 = ( temp_output_30_0_g127588 + temp_output_29_0_g127588 + temp_output_31_0_g127588 + ( break1867_g127014.a * break33_g127588.w ) );
					float temp_output_1860_0_g127014 = temp_output_28_0_g127588;
					float4 break33_g127592 = _motion_tiny_proc_mode;
					float temp_output_30_0_g127592 = ( Final_HeightMask1815_g127014 * break33_g127592.x );
					float temp_output_29_0_g127592 = ( Final_SphereMask1816_g127014 * break33_g127592.y );
					float temp_output_1864_0_g127014 = ( temp_output_30_0_g127592 + temp_output_29_0_g127592 );
					float lerpResult1891_g127014 = lerp( temp_output_1860_0_g127014 , temp_output_1864_0_g127014 , _motion_tiny_mask_mode);
					half Tiny_Mask_Legacy1880_g127014 = break1878_g127014.y;
					#ifdef TVE_LEGACY
					float staticSwitch1886_g127014 = Tiny_Mask_Legacy1880_g127014;
					#else
					float staticSwitch1886_g127014 = lerpResult1891_g127014;
					#endif
					float clampResult17_g127596 = clamp( staticSwitch1886_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127597 = _MotionTinyMaskRemap.x;
					float temp_output_9_0_g127597 = ( clampResult17_g127596 - temp_output_7_0_g127597 );
					float temp_output_6_0_g127598 = saturate( ( ( temp_output_9_0_g127597 / ( _MotionTinyMaskRemap.y - temp_output_7_0_g127597 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127598 = ( temp_output_6_0_g127598 + _MotionTinyMaskMode );
					#else
					float staticSwitch14_g127598 = temp_output_6_0_g127598;
					#endif
					half Motion_TinyMask1717_g127014 = staticSwitch14_g127598;
					float ifLocalVar40_g127093 = 0;
					if( Debug_Index464_g127014 == 15.0 )
					ifLocalVar40_g127093 = Motion_TinyMask1717_g127014;
					float3 appendResult60_g127088 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
					float3 ifLocalVar40_g127094 = 0;
					if( Debug_Index464_g127014 == 16.0 )
					ifLocalVar40_g127094 = appendResult60_g127088;
					float3 vertexToFrag328_g127014 = ( ( ifLocalVar40_g127015 + ifLocalVar40_g127022 + ifLocalVar40_g127028 + ifLocalVar40_g127020 ) + ( ifLocalVar40_g127064 + ifLocalVar40_g127065 + ifLocalVar40_g127066 + ifLocalVar40_g127067 ) + ( ifLocalVar40_g127068 + ifLocalVar40_g127069 + ifLocalVar40_g127089 ) + ( ifLocalVar40_g127090 + ifLocalVar40_g127091 + ifLocalVar40_g127092 + ifLocalVar40_g127093 + ifLocalVar40_g127094 ) );
					o.ase_texcoord10.xyz = vertexToFrag328_g127014;
					
					o.ase_texcoord8 = v.ase_texcoord;
					o.ase_texcoord9 = v.texcoord1.xyzw;
					
					//setting value to unused interpolator channels and avoid initialization warnings
					o.ase_texcoord10.w = 0;

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = defaultVertexValue;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = v.normal;
					v.tangent = v.tangent;

					float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
					half3 worldNormal = UnityObjectToWorldNormal( v.normal );
					half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
					half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
					half3 worldBitangent = cross( worldNormal, worldTangent ) * tangentSign;

					o.pos = UnityObjectToClipPos( v.vertex );
					o.worldNormal = float4( worldNormal, worldPos.x );
					o.worldTangent = float4( worldTangent, worldPos.y );
					o.worldBitangent = float4( worldBitangent, worldPos.z );

					o.ambientOrLightmapUV = 0;
					#ifdef LIGHTMAP_ON
						o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					#elif UNITY_SHOULD_SAMPLE_SH
						#ifdef VERTEXLIGHT_ON
							o.ambientOrLightmapUV.rgb += Shade4PointLights(
								unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
								unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
								unity_4LightAtten0, worldPos, worldNormal );
						#endif
						o.ambientOrLightmapUV.rgb = ShadeSHPerVertex( worldNormal, o.ambientOrLightmapUV.rgb );
					#endif
					#ifdef DYNAMICLIGHTMAP_ON
						o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					#endif

					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);

					#ifdef ASE_FOG
						UNITY_TRANSFER_FOG(o,o.pos);
					#endif
					return o;
				}

				#if defined(ASE_TESSELLATION)
				struct VertexControl
				{
					float4 vertex : INTERNALTESSPOS;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					float4 ase_texcoord : TEXCOORD0;
					float4 ase_color : COLOR;
					float4 ase_texcoord3 : TEXCOORD3;

					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct TessellationFactors
				{
					float edge[3] : SV_TessFactor;
					float inside : SV_InsideTessFactor;
				};

				VertexControl vert ( appdata v )
				{
					VertexControl o;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_TRANSFER_INSTANCE_ID(v, o);
					o.vertex = v.vertex;
					o.tangent = v.tangent;
					o.normal = v.normal;
					o.texcoord1 = v.texcoord1;
					o.texcoord2 = v.texcoord2;
					o.ase_texcoord = v.ase_texcoord;
					o.ase_color = v.ase_color;
					o.ase_texcoord3 = v.ase_texcoord3;
					return o;
				}

				TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
				{
					TessellationFactors o;
					float4 tf = 1;
					float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
					float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
					#if defined(ASE_FIXED_TESSELLATION)
					tf = FixedTess( tessValue );
					#elif defined(ASE_DISTANCE_TESSELLATION)
					tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
					#elif defined(ASE_LENGTH_TESSELLATION)
					tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
					#elif defined(ASE_LENGTH_CULL_TESSELLATION)
					tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
					#endif
					o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
					return o;
				}

				[domain("tri")]
				[partitioning("fractional_odd")]
				[outputtopology("triangle_cw")]
				[patchconstantfunc("TessellationFunction")]
				[outputcontrolpoints(3)]
				VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
				{
				   return patch[id];
				}

				[domain("tri")]
				v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
				{
					appdata o = (appdata) 0;
					o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
					o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
					o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
					o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
					o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
					o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
					o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
					o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
					#if defined(ASE_PHONG_TESSELLATION)
					float3 pp[3];
					for (int i = 0; i < 3; ++i)
						pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
					float phongStrength = _TessPhongStrength;
					o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
					#endif
					UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
					return VertexFunction(o);
				}
				#else
				v2f vert ( appdata v )
				{
					return VertexFunction( v );
				}
				#endif

				half4 frag (v2f IN , bool ase_vface : SV_IsFrontFace
					#if defined( ASE_DEPTH_WRITE_ON )
					, out float outputDepth : SV_Depth
					#endif
					) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID(IN);

					#ifdef LOD_FADE_CROSSFADE
						UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
					#endif

					#if defined(ASE_LIGHTING_SIMPLE)
						SurfaceOutput o = (SurfaceOutput)0;
					#else
						#if defined(_SPECULAR_SETUP)
							SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
						#else
							SurfaceOutputStandard o = (SurfaceOutputStandard)0;
						#endif
					#endif

					float3 WorldNormal = IN.worldNormal;
					float3 WorldTangent = IN.worldTangent;
					float3 WorldBiTangent = IN.worldBitangent;
					float3 worldPos = float3(IN.worldNormal.w,IN.worldTangent.w,IN.worldBitangent.w);
					float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));

					#if defined( ASE_NEEDS_FRAG_SHADOWCOORDS )
						UNITY_LIGHT_ATTENUATION( atten, IN, worldPos )
					#else
						half atten = 1;
					#endif

					#if defined( ASE_NEEDS_FRAG_SCREEN_POSITION )
						float4 ScreenPos = IN.screenPos;
					#endif

					float3 temp_cast_0 = (0.0).xxx;
					
					float4 color690_g127014 = IsGammaSpace() ? float4( 0.1, 0.1, 0.1, 0 ) : float4( 0.01002283, 0.01002283, 0.01002283, 0 );
					float4 Shading_Inactive1492_g127014 = color690_g127014;
					float Debug_Type367_g127014 = TVE_DEBUG_Type;
					float4 color646_g127014 = IsGammaSpace() ? float4( 0.9245283, 0.7969696, 0.4142933, 1 ) : float4( 0.8368256, 0.5987038, 0.1431069, 1 );
					float4 Output_Converted717_g127014 = color646_g127014;
					float4 ifLocalVar40_g127075 = 0;
					if( Debug_Type367_g127014 == 0.0 )
					ifLocalVar40_g127075 = Output_Converted717_g127014;
					float4 color1529_g127014 = IsGammaSpace() ? float4( 0.9254902, 0.7960784, 0.4156863, 1 ) : float4( 0.8387991, 0.5972018, 0.1441285, 1 );
					float _IsCoreShader1551_g127014 = _IsCoreShader;
					float4 color1539_g127014 = IsGammaSpace() ? float4( 0.6196079, 0.7686275, 0.1490196, 0 ) : float4( 0.3419145, 0.5520116, 0.01938236, 0 );
					float _IsBlanketShader1554_g127014 = _IsBlanketShader;
					float4 color1542_g127014 = IsGammaSpace() ? float4( 0.9716981, 0.3162602, 0.4816265, 0 ) : float4( 0.9368213, 0.08154967, 0.1974273, 0 );
					float _IsImpostorShader1110_g127014 = _IsImpostorShader;
					float4 color1544_g127014 = IsGammaSpace() ? float4( 0.3254902, 0.6117647, 0.8117647, 0 ) : float4( 0.08650047, 0.3324516, 0.6239604, 0 );
					float _IsPolygonalShader1112_g127014 = _IsPolygonalShader;
					float4 color1649_g127014 = IsGammaSpace() ? float4( 0.6, 0.6, 0.6, 0 ) : float4( 0.3185468, 0.3185468, 0.3185468, 0 );
					float _IsLiteShader1648_g127014 = _IsLiteShader;
					float4 Output_Scope1531_g127014 = ( ( color1529_g127014 * _IsCoreShader1551_g127014 ) + ( color1539_g127014 * _IsBlanketShader1554_g127014 ) + ( color1542_g127014 * _IsImpostorShader1110_g127014 ) + ( color1544_g127014 * _IsPolygonalShader1112_g127014 ) + ( color1649_g127014 * _IsLiteShader1648_g127014 ) );
					float4 ifLocalVar40_g127077 = 0;
					if( Debug_Type367_g127014 == 2.0 )
					ifLocalVar40_g127077 = Output_Scope1531_g127014;
					float4 color529_g127014 = IsGammaSpace() ? float4( 0.62, 0.77, 0.15, 0 ) : float4( 0.3423916, 0.5542217, 0.01960665, 0 );
					float _IsVertexShader1158_g127014 = _IsVertexShader;
					float4 color544_g127014 = IsGammaSpace() ? float4( 0.3252937, 0.6122813, 0.8113208, 0 ) : float4( 0.08639329, 0.3330702, 0.6231937, 0 );
					float _IsSimpleShader359_g127014 = _IsSimpleShader;
					float4 color521_g127014 = IsGammaSpace() ? float4( 0.6566009, 0.3404236, 0.8490566, 0 ) : float4( 0.3886527, 0.09487338, 0.6903409, 0 );
					float _IsStandardShader344_g127014 = _IsStandardShader;
					float4 color1121_g127014 = IsGammaSpace() ? float4( 0.9716981, 0.88463, 0.1787558, 0 ) : float4( 0.9368213, 0.7573396, 0.02686729, 0 );
					float _IsSubsurfaceShader548_g127014 = _IsSubsurfaceShader;
					float4 Output_Lighting525_g127014 = ( ( color529_g127014 * _IsVertexShader1158_g127014 ) + ( color544_g127014 * _IsSimpleShader359_g127014 ) + ( color521_g127014 * _IsStandardShader344_g127014 ) + ( color1121_g127014 * _IsSubsurfaceShader548_g127014 ) );
					float4 ifLocalVar40_g127078 = 0;
					if( Debug_Type367_g127014 == 3.0 )
					ifLocalVar40_g127078 = Output_Lighting525_g127014;
					float4 color1559_g127014 = IsGammaSpace() ? float4( 0.9245283, 0.7969696, 0.4142933, 1 ) : float4( 0.8368256, 0.5987038, 0.1431069, 1 );
					float4 color1563_g127014 = IsGammaSpace() ? float4( 0.3053578, 0.8867924, 0.5362216, 0 ) : float4( 0.0759199, 0.7615293, 0.2491121, 0 );
					float _IsCustomShader1570_g127014 = _IsCustomShader;
					float4 lerpResult1561_g127014 = lerp( color1559_g127014 , color1563_g127014 , _IsCustomShader1570_g127014);
					float4 Output_Custom1560_g127014 = lerpResult1561_g127014;
					float4 ifLocalVar40_g127079 = 0;
					if( Debug_Type367_g127014 == 4.0 )
					ifLocalVar40_g127079 = Output_Custom1560_g127014;
					float3 hsvTorgb1452_g127014 = HSVToRGB( float3(( _IsIdentifier / 1000.0 ),1.0,1.0) );
					float3 gammaToLinear1453_g127014 = GammaToLinearSpace( hsvTorgb1452_g127014 );
					float4 appendResult1657_g127014 = (float4(gammaToLinear1453_g127014 , 1.0));
					float4 Output_Sharing1355_g127014 = appendResult1657_g127014;
					float4 ifLocalVar40_g127080 = 0;
					if( Debug_Type367_g127014 == 5.0 )
					ifLocalVar40_g127080 = Output_Sharing1355_g127014;
					float Debug_Index464_g127014 = TVE_DEBUG_Index;
					half2 Main_UVs1219_g127014 = ( ( IN.ase_texcoord8.xy * (_main_coord_value).xy ) + (_main_coord_value).zw );
					float4 tex2DNode586_g127014 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 );
					float3 appendResult637_g127014 = (float3(tex2DNode586_g127014.r , tex2DNode586_g127014.g , tex2DNode586_g127014.b));
					float3 ifLocalVar40_g127021 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127021 = appendResult637_g127014;
					float ifLocalVar40_g127025 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127025 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 ).a;
					float4 tex2DNode604_g127014 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, Main_UVs1219_g127014 );
					float3 appendResult876_g127014 = (float3(tex2DNode604_g127014.a , tex2DNode604_g127014.g , 1.0));
					float3 gammaToLinear878_g127014 = GammaToLinearSpace( appendResult876_g127014 );
					float3 ifLocalVar40_g127029 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127029 = gammaToLinear878_g127014;
					float ifLocalVar40_g127017 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127017 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).r;
					float ifLocalVar40_g127035 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127035 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).g;
					float ifLocalVar40_g127026 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127026 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).b;
					float ifLocalVar40_g127016 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127016 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).a;
					float2 appendResult1251_g127014 = (float2(IN.ase_texcoord9.z , IN.ase_texcoord9.w));
					float2 Mesh_DetailCoord1254_g127014 = appendResult1251_g127014;
					float2 lerpResult1231_g127014 = lerp( IN.ase_texcoord8.xy , Mesh_DetailCoord1254_g127014 , _DetailCoordMode);
					half2 Layer_02_UVs1234_g127014 = ( ( lerpResult1231_g127014 * (_SecondUVs).xy ) + (_SecondUVs).zw );
					float4 tex2DNode854_g127014 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 );
					float3 appendResult839_g127014 = (float3(tex2DNode854_g127014.r , tex2DNode854_g127014.g , tex2DNode854_g127014.b));
					float3 ifLocalVar40_g127019 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127019 = appendResult839_g127014;
					float ifLocalVar40_g127027 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127027 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 ).a;
					float4 tex2DNode841_g127014 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondNormalTex, Layer_02_UVs1234_g127014 );
					float3 appendResult880_g127014 = (float3(tex2DNode841_g127014.a , tex2DNode841_g127014.g , 1.0));
					float3 gammaToLinear879_g127014 = GammaToLinearSpace( appendResult880_g127014 );
					float3 ifLocalVar40_g127034 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127034 = gammaToLinear879_g127014;
					float ifLocalVar40_g127030 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127030 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).r;
					float ifLocalVar40_g127024 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127024 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).g;
					float ifLocalVar40_g127032 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127032 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).b;
					float ifLocalVar40_g127033 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127033 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).a;
					half2 Emissive_UVs1245_g127014 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
					float4 tex2DNode858_g127014 = SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs1245_g127014 );
					float ifLocalVar40_g127023 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127023 = tex2DNode858_g127014.r;
					float Debug_Min721_g127014 = TVE_DEBUG_Min;
					float temp_output_7_0_g127031 = Debug_Min721_g127014;
					float4 temp_cast_4 = (temp_output_7_0_g127031).xxxx;
					float4 temp_output_9_0_g127031 = ( ( float4( ( ( ifLocalVar40_g127021 + ifLocalVar40_g127025 + ifLocalVar40_g127029 ) + ( ifLocalVar40_g127017 + ifLocalVar40_g127035 + ifLocalVar40_g127026 + ifLocalVar40_g127016 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g127019 + ifLocalVar40_g127027 + ifLocalVar40_g127034 ) + ( ifLocalVar40_g127030 + ifLocalVar40_g127024 + ifLocalVar40_g127032 + ifLocalVar40_g127033 ) ) * _DetailMode ) , 0.0 ) + ( ( ifLocalVar40_g127023 * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_4 );
					float Debug_Max723_g127014 = TVE_DEBUG_Max;
					float4 Output_Maps561_g127014 = saturate( ( ( temp_output_9_0_g127031 / ( Debug_Max723_g127014 - temp_output_7_0_g127031 ) ) + 0.0001 ) );
					float4 ifLocalVar40_g127081 = 0;
					if( Debug_Type367_g127014 == 6.0 )
					ifLocalVar40_g127081 = Output_Maps561_g127014;
					float Resolution44_g127052 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
					float4 color62_g127052 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127052 = 0;
					if( Resolution44_g127052 <= 256.0 )
					ifLocalVar61_g127052 = color62_g127052;
					float4 color55_g127052 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127052 = 0;
					if( Resolution44_g127052 == 512.0 )
					ifLocalVar56_g127052 = color55_g127052;
					float4 color42_g127052 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127052 = 0;
					if( Resolution44_g127052 == 1024.0 )
					ifLocalVar40_g127052 = color42_g127052;
					float4 color48_g127052 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127052 = 0;
					if( Resolution44_g127052 == 2048.0 )
					ifLocalVar47_g127052 = color48_g127052;
					float4 color51_g127052 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127052 = 0;
					if( Resolution44_g127052 >= 4096.0 )
					ifLocalVar52_g127052 = color51_g127052;
					float4 ifLocalVar40_g127038 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127038 = ( ifLocalVar61_g127052 + ifLocalVar56_g127052 + ifLocalVar40_g127052 + ifLocalVar47_g127052 + ifLocalVar52_g127052 );
					float Resolution44_g127051 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
					float4 color62_g127051 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127051 = 0;
					if( Resolution44_g127051 <= 256.0 )
					ifLocalVar61_g127051 = color62_g127051;
					float4 color55_g127051 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127051 = 0;
					if( Resolution44_g127051 == 512.0 )
					ifLocalVar56_g127051 = color55_g127051;
					float4 color42_g127051 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127051 = 0;
					if( Resolution44_g127051 == 1024.0 )
					ifLocalVar40_g127051 = color42_g127051;
					float4 color48_g127051 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127051 = 0;
					if( Resolution44_g127051 == 2048.0 )
					ifLocalVar47_g127051 = color48_g127051;
					float4 color51_g127051 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127051 = 0;
					if( Resolution44_g127051 >= 4096.0 )
					ifLocalVar52_g127051 = color51_g127051;
					float4 ifLocalVar40_g127036 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127036 = ( ifLocalVar61_g127051 + ifLocalVar56_g127051 + ifLocalVar40_g127051 + ifLocalVar47_g127051 + ifLocalVar52_g127051 );
					float Resolution44_g127050 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
					float4 color62_g127050 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127050 = 0;
					if( Resolution44_g127050 <= 256.0 )
					ifLocalVar61_g127050 = color62_g127050;
					float4 color55_g127050 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127050 = 0;
					if( Resolution44_g127050 == 512.0 )
					ifLocalVar56_g127050 = color55_g127050;
					float4 color42_g127050 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127050 = 0;
					if( Resolution44_g127050 == 1024.0 )
					ifLocalVar40_g127050 = color42_g127050;
					float4 color48_g127050 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127050 = 0;
					if( Resolution44_g127050 == 2048.0 )
					ifLocalVar47_g127050 = color48_g127050;
					float4 color51_g127050 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127050 = 0;
					if( Resolution44_g127050 >= 4096.0 )
					ifLocalVar52_g127050 = color51_g127050;
					float4 ifLocalVar40_g127037 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127037 = ( ifLocalVar61_g127050 + ifLocalVar56_g127050 + ifLocalVar40_g127050 + ifLocalVar47_g127050 + ifLocalVar52_g127050 );
					float Resolution44_g127057 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 color62_g127057 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127057 = 0;
					if( Resolution44_g127057 <= 256.0 )
					ifLocalVar61_g127057 = color62_g127057;
					float4 color55_g127057 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127057 = 0;
					if( Resolution44_g127057 == 512.0 )
					ifLocalVar56_g127057 = color55_g127057;
					float4 color42_g127057 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127057 = 0;
					if( Resolution44_g127057 == 1024.0 )
					ifLocalVar40_g127057 = color42_g127057;
					float4 color48_g127057 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127057 = 0;
					if( Resolution44_g127057 == 2048.0 )
					ifLocalVar47_g127057 = color48_g127057;
					float4 color51_g127057 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127057 = 0;
					if( Resolution44_g127057 >= 4096.0 )
					ifLocalVar52_g127057 = color51_g127057;
					float4 ifLocalVar40_g127044 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127044 = ( ifLocalVar61_g127057 + ifLocalVar56_g127057 + ifLocalVar40_g127057 + ifLocalVar47_g127057 + ifLocalVar52_g127057 );
					float Resolution44_g127056 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
					float4 color62_g127056 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127056 = 0;
					if( Resolution44_g127056 <= 256.0 )
					ifLocalVar61_g127056 = color62_g127056;
					float4 color55_g127056 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127056 = 0;
					if( Resolution44_g127056 == 512.0 )
					ifLocalVar56_g127056 = color55_g127056;
					float4 color42_g127056 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127056 = 0;
					if( Resolution44_g127056 == 1024.0 )
					ifLocalVar40_g127056 = color42_g127056;
					float4 color48_g127056 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127056 = 0;
					if( Resolution44_g127056 == 2048.0 )
					ifLocalVar47_g127056 = color48_g127056;
					float4 color51_g127056 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127056 = 0;
					if( Resolution44_g127056 >= 4096.0 )
					ifLocalVar52_g127056 = color51_g127056;
					float4 ifLocalVar40_g127042 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127042 = ( ifLocalVar61_g127056 + ifLocalVar56_g127056 + ifLocalVar40_g127056 + ifLocalVar47_g127056 + ifLocalVar52_g127056 );
					float Resolution44_g127058 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 color62_g127058 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127058 = 0;
					if( Resolution44_g127058 <= 256.0 )
					ifLocalVar61_g127058 = color62_g127058;
					float4 color55_g127058 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127058 = 0;
					if( Resolution44_g127058 == 512.0 )
					ifLocalVar56_g127058 = color55_g127058;
					float4 color42_g127058 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127058 = 0;
					if( Resolution44_g127058 == 1024.0 )
					ifLocalVar40_g127058 = color42_g127058;
					float4 color48_g127058 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127058 = 0;
					if( Resolution44_g127058 == 2048.0 )
					ifLocalVar47_g127058 = color48_g127058;
					float4 color51_g127058 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127058 = 0;
					if( Resolution44_g127058 >= 4096.0 )
					ifLocalVar52_g127058 = color51_g127058;
					float4 ifLocalVar40_g127043 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127043 = ( ifLocalVar61_g127058 + ifLocalVar56_g127058 + ifLocalVar40_g127058 + ifLocalVar47_g127058 + ifLocalVar52_g127058 );
					float Resolution44_g127055 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
					float4 color62_g127055 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127055 = 0;
					if( Resolution44_g127055 <= 256.0 )
					ifLocalVar61_g127055 = color62_g127055;
					float4 color55_g127055 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127055 = 0;
					if( Resolution44_g127055 == 512.0 )
					ifLocalVar56_g127055 = color55_g127055;
					float4 color42_g127055 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127055 = 0;
					if( Resolution44_g127055 == 1024.0 )
					ifLocalVar40_g127055 = color42_g127055;
					float4 color48_g127055 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127055 = 0;
					if( Resolution44_g127055 == 2048.0 )
					ifLocalVar47_g127055 = color48_g127055;
					float4 color51_g127055 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127055 = 0;
					if( Resolution44_g127055 >= 4096.0 )
					ifLocalVar52_g127055 = color51_g127055;
					float4 ifLocalVar40_g127045 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127045 = ( ifLocalVar61_g127055 + ifLocalVar56_g127055 + ifLocalVar40_g127055 + ifLocalVar47_g127055 + ifLocalVar52_g127055 );
					float4 Output_Resolution737_g127014 = ( ( ifLocalVar40_g127038 + ifLocalVar40_g127036 + ifLocalVar40_g127037 ) + ( ifLocalVar40_g127044 + ifLocalVar40_g127042 + ifLocalVar40_g127043 ) + ifLocalVar40_g127045 );
					float4 ifLocalVar40_g127082 = 0;
					if( Debug_Type367_g127014 == 7.0 )
					ifLocalVar40_g127082 = Output_Resolution737_g127014;
					float2 uv_MainAlbedoTex = IN.ase_texcoord8.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
					float2 UVs72_g127063 = Main_UVs1219_g127014;
					float Resolution44_g127063 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127063 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127063 * ( Resolution44_g127063 / 8.0 ) ) );
					float4 lerpResult78_g127063 = lerp( SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ) , tex2DNode77_g127063 , tex2DNode77_g127063.a);
					float4 ifLocalVar40_g127041 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127041 = lerpResult78_g127063;
					float2 uv_MainNormalTex = IN.ase_texcoord8.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
					float2 UVs72_g127054 = Main_UVs1219_g127014;
					float Resolution44_g127054 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
					float4 tex2DNode77_g127054 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127054 * ( Resolution44_g127054 / 8.0 ) ) );
					float4 lerpResult78_g127054 = lerp( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, uv_MainNormalTex ) , tex2DNode77_g127054 , tex2DNode77_g127054.a);
					float4 ifLocalVar40_g127039 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127039 = lerpResult78_g127054;
					float2 uv_MainMaskTex = IN.ase_texcoord8.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
					float2 UVs72_g127053 = Main_UVs1219_g127014;
					float Resolution44_g127053 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
					float4 tex2DNode77_g127053 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127053 * ( Resolution44_g127053 / 8.0 ) ) );
					float4 lerpResult78_g127053 = lerp( SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, uv_MainMaskTex ) , tex2DNode77_g127053 , tex2DNode77_g127053.a);
					float4 ifLocalVar40_g127040 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127040 = lerpResult78_g127053;
					float2 uv_SecondAlbedoTex = IN.ase_texcoord8.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
					float2 UVs72_g127061 = Layer_02_UVs1234_g127014;
					float Resolution44_g127061 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127061 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127061 * ( Resolution44_g127061 / 8.0 ) ) );
					float4 lerpResult78_g127061 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127061 , tex2DNode77_g127061.a);
					float4 ifLocalVar40_g127048 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127048 = lerpResult78_g127061;
					float2 uv_SecondMaskTex = IN.ase_texcoord8.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
					float2 UVs72_g127060 = Layer_02_UVs1234_g127014;
					float Resolution44_g127060 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
					float4 tex2DNode77_g127060 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127060 * ( Resolution44_g127060 / 8.0 ) ) );
					float4 lerpResult78_g127060 = lerp( SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, uv_SecondMaskTex ) , tex2DNode77_g127060 , tex2DNode77_g127060.a);
					float4 ifLocalVar40_g127046 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127046 = lerpResult78_g127060;
					float2 UVs72_g127062 = Layer_02_UVs1234_g127014;
					float Resolution44_g127062 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127062 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127062 * ( Resolution44_g127062 / 8.0 ) ) );
					float4 lerpResult78_g127062 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127062 , tex2DNode77_g127062.a);
					float4 ifLocalVar40_g127047 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127047 = lerpResult78_g127062;
					float2 uv_EmissiveTex = IN.ase_texcoord8.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
					float2 UVs72_g127059 = Emissive_UVs1245_g127014;
					float Resolution44_g127059 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
					float4 tex2DNode77_g127059 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127059 * ( Resolution44_g127059 / 8.0 ) ) );
					float4 lerpResult78_g127059 = lerp( SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, uv_EmissiveTex ) , tex2DNode77_g127059 , tex2DNode77_g127059.a);
					float4 ifLocalVar40_g127049 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127049 = lerpResult78_g127059;
					float4 Output_MipLevel1284_g127014 = ( ( ifLocalVar40_g127041 + ifLocalVar40_g127039 + ifLocalVar40_g127040 ) + ( ifLocalVar40_g127048 + ifLocalVar40_g127046 + ifLocalVar40_g127047 ) + ifLocalVar40_g127049 );
					float4 ifLocalVar40_g127083 = 0;
					if( Debug_Type367_g127014 == 8.0 )
					ifLocalVar40_g127083 = Output_MipLevel1284_g127014;
					float ifLocalVar40_g127582 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127582 = (float3( 0,0,0 )).z;
					float Debug_Layer885_g127014 = TVE_DEBUG_Layer;
					float temp_output_82_0_g127401 = Debug_Layer885_g127014;
					float temp_output_19_0_g127403 = TVE_CoatLayers[(int)temp_output_82_0_g127401];
					float3 WorldPosition893_g127014 = worldPos;
					half3 Input_Position180_g127404 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127404 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127404).xz ) );
					float temp_output_82_0_g127404 = temp_output_82_0_g127401;
					float2 temp_output_119_0_g127404 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127404).xz ) );
					float temp_output_7_0_g127409 = 1.0;
					float temp_output_9_0_g127409 = ( saturate( ( distance( Input_Position180_g127404 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127409 );
					float4 lerpResult131_g127404 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127404,temp_output_82_0_g127404), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127404,temp_output_82_0_g127404), 0.0 ) , saturate( ( temp_output_9_0_g127409 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127409 ) ) ));
					float4 temp_output_17_0_g127403 = lerpResult131_g127404;
					float4 temp_output_3_0_g127403 = TVE_CoatParams;
					float4 ifLocalVar18_g127403 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127403 >= 0.5 )
					ifLocalVar18_g127403 = temp_output_17_0_g127403;
					else
					ifLocalVar18_g127403 = temp_output_3_0_g127403;
					float4 lerpResult22_g127403 = lerp( temp_output_3_0_g127403 , temp_output_17_0_g127403 , temp_output_19_0_g127403);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127403 = lerpResult22_g127403;
					#else
					float4 staticSwitch24_g127403 = ifLocalVar18_g127403;
					#endif
					float ifLocalVar40_g127419 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127419 = (staticSwitch24_g127403).g;
					float temp_output_82_0_g127410 = Debug_Layer885_g127014;
					float temp_output_19_0_g127412 = TVE_CoatLayers[(int)temp_output_82_0_g127410];
					half3 Input_Position180_g127413 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127413 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127413).xz ) );
					float temp_output_82_0_g127413 = temp_output_82_0_g127410;
					float2 temp_output_119_0_g127413 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127413).xz ) );
					float temp_output_7_0_g127418 = 1.0;
					float temp_output_9_0_g127418 = ( saturate( ( distance( Input_Position180_g127413 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127418 );
					float4 lerpResult131_g127413 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127413,temp_output_82_0_g127413), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127413,temp_output_82_0_g127413), 0.0 ) , saturate( ( temp_output_9_0_g127418 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127418 ) ) ));
					float4 temp_output_17_0_g127412 = lerpResult131_g127413;
					float4 temp_output_3_0_g127412 = TVE_CoatParams;
					float4 ifLocalVar18_g127412 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127412 >= 0.5 )
					ifLocalVar18_g127412 = temp_output_17_0_g127412;
					else
					ifLocalVar18_g127412 = temp_output_3_0_g127412;
					float4 lerpResult22_g127412 = lerp( temp_output_3_0_g127412 , temp_output_17_0_g127412 , temp_output_19_0_g127412);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127412 = lerpResult22_g127412;
					#else
					float4 staticSwitch24_g127412 = ifLocalVar18_g127412;
					#endif
					float ifLocalVar40_g127420 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127420 = (staticSwitch24_g127412).b;
					float temp_output_82_0_g127430 = Debug_Layer885_g127014;
					float temp_output_19_0_g127432 = TVE_PaintLayers[(int)temp_output_82_0_g127430];
					half3 Input_Position180_g127433 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127433 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127433).xz ) );
					float temp_output_82_0_g127433 = temp_output_82_0_g127430;
					float2 temp_output_119_0_g127433 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127433).xz ) );
					float temp_output_7_0_g127438 = 1.0;
					float temp_output_9_0_g127438 = ( saturate( ( distance( Input_Position180_g127433 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127438 );
					float4 lerpResult131_g127433 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127433,temp_output_82_0_g127433), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127433,temp_output_82_0_g127433), 0.0 ) , saturate( ( temp_output_9_0_g127438 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127438 ) ) ));
					float4 temp_output_17_0_g127432 = lerpResult131_g127433;
					float4 temp_output_3_0_g127432 = TVE_PaintParams;
					float4 ifLocalVar18_g127432 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127432 >= 0.5 )
					ifLocalVar18_g127432 = temp_output_17_0_g127432;
					else
					ifLocalVar18_g127432 = temp_output_3_0_g127432;
					float4 lerpResult22_g127432 = lerp( temp_output_3_0_g127432 , temp_output_17_0_g127432 , temp_output_19_0_g127432);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127432 = lerpResult22_g127432;
					#else
					float4 staticSwitch24_g127432 = ifLocalVar18_g127432;
					#endif
					float3 ifLocalVar40_g127439 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127439 = (staticSwitch24_g127432).rgb;
					float temp_output_82_0_g127421 = Debug_Layer885_g127014;
					float temp_output_19_0_g127423 = TVE_PaintLayers[(int)temp_output_82_0_g127421];
					half3 Input_Position180_g127424 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127424 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127424).xz ) );
					float temp_output_82_0_g127424 = temp_output_82_0_g127421;
					float2 temp_output_119_0_g127424 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127424).xz ) );
					float temp_output_7_0_g127429 = 1.0;
					float temp_output_9_0_g127429 = ( saturate( ( distance( Input_Position180_g127424 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127429 );
					float4 lerpResult131_g127424 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127424,temp_output_82_0_g127424), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127424,temp_output_82_0_g127424), 0.0 ) , saturate( ( temp_output_9_0_g127429 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127429 ) ) ));
					float4 temp_output_17_0_g127423 = lerpResult131_g127424;
					float4 temp_output_3_0_g127423 = TVE_PaintParams;
					float4 ifLocalVar18_g127423 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127423 >= 0.5 )
					ifLocalVar18_g127423 = temp_output_17_0_g127423;
					else
					ifLocalVar18_g127423 = temp_output_3_0_g127423;
					float4 lerpResult22_g127423 = lerp( temp_output_3_0_g127423 , temp_output_17_0_g127423 , temp_output_19_0_g127423);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127423 = lerpResult22_g127423;
					#else
					float4 staticSwitch24_g127423 = ifLocalVar18_g127423;
					#endif
					float ifLocalVar40_g127440 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127440 = saturate( (staticSwitch24_g127423).a );
					float temp_output_82_0_g127441 = Debug_Layer885_g127014;
					float temp_output_19_0_g127443 = TVE_GlowLayers[(int)temp_output_82_0_g127441];
					half3 Input_Position180_g127444 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127444 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127444).xz ) );
					float temp_output_82_0_g127444 = temp_output_82_0_g127441;
					float2 temp_output_119_0_g127444 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127444).xz ) );
					float temp_output_7_0_g127449 = 1.0;
					float temp_output_9_0_g127449 = ( saturate( ( distance( Input_Position180_g127444 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127449 );
					float4 lerpResult131_g127444 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127444,temp_output_82_0_g127444), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127444,temp_output_82_0_g127444), 0.0 ) , saturate( ( temp_output_9_0_g127449 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127449 ) ) ));
					float4 temp_output_17_0_g127443 = lerpResult131_g127444;
					float4 temp_output_3_0_g127443 = TVE_GlowParams;
					float4 ifLocalVar18_g127443 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127443 >= 0.5 )
					ifLocalVar18_g127443 = temp_output_17_0_g127443;
					else
					ifLocalVar18_g127443 = temp_output_3_0_g127443;
					float4 lerpResult22_g127443 = lerp( temp_output_3_0_g127443 , temp_output_17_0_g127443 , temp_output_19_0_g127443);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127443 = lerpResult22_g127443;
					#else
					float4 staticSwitch24_g127443 = ifLocalVar18_g127443;
					#endif
					float3 ifLocalVar40_g127513 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127513 = (staticSwitch24_g127443).rgb;
					float temp_output_82_0_g127504 = Debug_Layer885_g127014;
					float temp_output_19_0_g127506 = TVE_GlowLayers[(int)temp_output_82_0_g127504];
					half3 Input_Position180_g127507 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127507 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127507).xz ) );
					float temp_output_82_0_g127507 = temp_output_82_0_g127504;
					float2 temp_output_119_0_g127507 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127507).xz ) );
					float temp_output_7_0_g127512 = 1.0;
					float temp_output_9_0_g127512 = ( saturate( ( distance( Input_Position180_g127507 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127512 );
					float4 lerpResult131_g127507 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127507,temp_output_82_0_g127507), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127507,temp_output_82_0_g127507), 0.0 ) , saturate( ( temp_output_9_0_g127512 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127512 ) ) ));
					float4 temp_output_17_0_g127506 = lerpResult131_g127507;
					float4 temp_output_3_0_g127506 = TVE_GlowParams;
					float4 ifLocalVar18_g127506 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127506 >= 0.5 )
					ifLocalVar18_g127506 = temp_output_17_0_g127506;
					else
					ifLocalVar18_g127506 = temp_output_3_0_g127506;
					float4 lerpResult22_g127506 = lerp( temp_output_3_0_g127506 , temp_output_17_0_g127506 , temp_output_19_0_g127506);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127506 = lerpResult22_g127506;
					#else
					float4 staticSwitch24_g127506 = ifLocalVar18_g127506;
					#endif
					float ifLocalVar40_g127514 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127514 = saturate( (staticSwitch24_g127506).a );
					float temp_output_132_0_g127477 = Debug_Layer885_g127014;
					float temp_output_19_0_g127479 = TVE_AtmoLayers[(int)temp_output_132_0_g127477];
					half3 Input_Position180_g127480 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127480 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127480).xz ) );
					float temp_output_82_0_g127480 = temp_output_132_0_g127477;
					float2 temp_output_119_0_g127480 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127480).xz ) );
					float temp_output_7_0_g127485 = 1.0;
					float temp_output_9_0_g127485 = ( saturate( ( distance( Input_Position180_g127480 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127485 );
					float4 lerpResult131_g127480 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127480,temp_output_82_0_g127480), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127480,temp_output_82_0_g127480), 0.0 ) , saturate( ( temp_output_9_0_g127485 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127485 ) ) ));
					float4 temp_output_17_0_g127479 = lerpResult131_g127480;
					float4 temp_output_3_0_g127479 = TVE_AtmoParams;
					float4 ifLocalVar18_g127479 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127479 >= 0.5 )
					ifLocalVar18_g127479 = temp_output_17_0_g127479;
					else
					ifLocalVar18_g127479 = temp_output_3_0_g127479;
					float4 lerpResult22_g127479 = lerp( temp_output_3_0_g127479 , temp_output_17_0_g127479 , temp_output_19_0_g127479);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127479 = lerpResult22_g127479;
					#else
					float4 staticSwitch24_g127479 = ifLocalVar18_g127479;
					#endif
					float ifLocalVar40_g127515 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127515 = (staticSwitch24_g127479).r;
					float temp_output_132_0_g127450 = Debug_Layer885_g127014;
					float temp_output_19_0_g127452 = TVE_AtmoLayers[(int)temp_output_132_0_g127450];
					half3 Input_Position180_g127453 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127453 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127453).xz ) );
					float temp_output_82_0_g127453 = temp_output_132_0_g127450;
					float2 temp_output_119_0_g127453 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127453).xz ) );
					float temp_output_7_0_g127458 = 1.0;
					float temp_output_9_0_g127458 = ( saturate( ( distance( Input_Position180_g127453 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127458 );
					float4 lerpResult131_g127453 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127453,temp_output_82_0_g127453), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127453,temp_output_82_0_g127453), 0.0 ) , saturate( ( temp_output_9_0_g127458 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127458 ) ) ));
					float4 temp_output_17_0_g127452 = lerpResult131_g127453;
					float4 temp_output_3_0_g127452 = TVE_AtmoParams;
					float4 ifLocalVar18_g127452 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127452 >= 0.5 )
					ifLocalVar18_g127452 = temp_output_17_0_g127452;
					else
					ifLocalVar18_g127452 = temp_output_3_0_g127452;
					float4 lerpResult22_g127452 = lerp( temp_output_3_0_g127452 , temp_output_17_0_g127452 , temp_output_19_0_g127452);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127452 = lerpResult22_g127452;
					#else
					float4 staticSwitch24_g127452 = ifLocalVar18_g127452;
					#endif
					float ifLocalVar40_g127516 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127516 = (staticSwitch24_g127452).g;
					float temp_output_132_0_g127459 = Debug_Layer885_g127014;
					float temp_output_19_0_g127461 = TVE_AtmoLayers[(int)temp_output_132_0_g127459];
					half3 Input_Position180_g127462 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127462 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127462).xz ) );
					float temp_output_82_0_g127462 = temp_output_132_0_g127459;
					float2 temp_output_119_0_g127462 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127462).xz ) );
					float temp_output_7_0_g127467 = 1.0;
					float temp_output_9_0_g127467 = ( saturate( ( distance( Input_Position180_g127462 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127467 );
					float4 lerpResult131_g127462 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127462,temp_output_82_0_g127462), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127462,temp_output_82_0_g127462), 0.0 ) , saturate( ( temp_output_9_0_g127467 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127467 ) ) ));
					float4 temp_output_17_0_g127461 = lerpResult131_g127462;
					float4 temp_output_3_0_g127461 = TVE_AtmoParams;
					float4 ifLocalVar18_g127461 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127461 >= 0.5 )
					ifLocalVar18_g127461 = temp_output_17_0_g127461;
					else
					ifLocalVar18_g127461 = temp_output_3_0_g127461;
					float4 lerpResult22_g127461 = lerp( temp_output_3_0_g127461 , temp_output_17_0_g127461 , temp_output_19_0_g127461);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127461 = lerpResult22_g127461;
					#else
					float4 staticSwitch24_g127461 = ifLocalVar18_g127461;
					#endif
					float ifLocalVar40_g127517 = 0;
					if( Debug_Index464_g127014 == 9.0 )
					ifLocalVar40_g127517 = (staticSwitch24_g127461).b;
					float temp_output_132_0_g127468 = Debug_Layer885_g127014;
					float temp_output_19_0_g127470 = TVE_AtmoLayers[(int)temp_output_132_0_g127468];
					half3 Input_Position180_g127471 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127471 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127471).xz ) );
					float temp_output_82_0_g127471 = temp_output_132_0_g127468;
					float2 temp_output_119_0_g127471 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127471).xz ) );
					float temp_output_7_0_g127476 = 1.0;
					float temp_output_9_0_g127476 = ( saturate( ( distance( Input_Position180_g127471 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127476 );
					float4 lerpResult131_g127471 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127471,temp_output_82_0_g127471), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127471,temp_output_82_0_g127471), 0.0 ) , saturate( ( temp_output_9_0_g127476 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127476 ) ) ));
					float4 temp_output_17_0_g127470 = lerpResult131_g127471;
					float4 temp_output_3_0_g127470 = TVE_AtmoParams;
					float4 ifLocalVar18_g127470 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127470 >= 0.5 )
					ifLocalVar18_g127470 = temp_output_17_0_g127470;
					else
					ifLocalVar18_g127470 = temp_output_3_0_g127470;
					float4 lerpResult22_g127470 = lerp( temp_output_3_0_g127470 , temp_output_17_0_g127470 , temp_output_19_0_g127470);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127470 = lerpResult22_g127470;
					#else
					float4 staticSwitch24_g127470 = ifLocalVar18_g127470;
					#endif
					float ifLocalVar40_g127518 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127518 = saturate( (staticSwitch24_g127470).a );
					float temp_output_130_0_g127495 = Debug_Layer885_g127014;
					float temp_output_19_0_g127497 = TVE_FormLayers[(int)temp_output_130_0_g127495];
					half3 Input_Position180_g127498 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127498 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127498).xz ) );
					float temp_output_82_0_g127498 = temp_output_130_0_g127495;
					float2 temp_output_119_0_g127498 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127498).xz ) );
					float temp_output_7_0_g127503 = 1.0;
					float temp_output_9_0_g127503 = ( saturate( ( distance( Input_Position180_g127498 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127503 );
					float4 lerpResult131_g127498 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127498,temp_output_82_0_g127498), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127498,temp_output_82_0_g127498), 0.0 ) , saturate( ( temp_output_9_0_g127503 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127503 ) ) ));
					float4 temp_output_17_0_g127497 = lerpResult131_g127498;
					float4 temp_output_3_0_g127497 = TVE_FormParams;
					float4 ifLocalVar18_g127497 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127497 >= 0.5 )
					ifLocalVar18_g127497 = temp_output_17_0_g127497;
					else
					ifLocalVar18_g127497 = temp_output_3_0_g127497;
					float4 lerpResult22_g127497 = lerp( temp_output_3_0_g127497 , temp_output_17_0_g127497 , temp_output_19_0_g127497);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127497 = lerpResult22_g127497;
					#else
					float4 staticSwitch24_g127497 = ifLocalVar18_g127497;
					#endif
					float3 appendResult1013_g127014 = (float3((staticSwitch24_g127497).rg , 0.0));
					float3 ifLocalVar40_g127519 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127519 = appendResult1013_g127014;
					float temp_output_130_0_g127486 = Debug_Layer885_g127014;
					float temp_output_19_0_g127488 = TVE_FormLayers[(int)temp_output_130_0_g127486];
					half3 Input_Position180_g127489 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127489 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127489).xz ) );
					float temp_output_82_0_g127489 = temp_output_130_0_g127486;
					float2 temp_output_119_0_g127489 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127489).xz ) );
					float temp_output_7_0_g127494 = 1.0;
					float temp_output_9_0_g127494 = ( saturate( ( distance( Input_Position180_g127489 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127494 );
					float4 lerpResult131_g127489 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127489,temp_output_82_0_g127489), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127489,temp_output_82_0_g127489), 0.0 ) , saturate( ( temp_output_9_0_g127494 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127494 ) ) ));
					float4 temp_output_17_0_g127488 = lerpResult131_g127489;
					float4 temp_output_3_0_g127488 = TVE_FormParams;
					float4 ifLocalVar18_g127488 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127488 >= 0.5 )
					ifLocalVar18_g127488 = temp_output_17_0_g127488;
					else
					ifLocalVar18_g127488 = temp_output_3_0_g127488;
					float4 lerpResult22_g127488 = lerp( temp_output_3_0_g127488 , temp_output_17_0_g127488 , temp_output_19_0_g127488);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127488 = lerpResult22_g127488;
					#else
					float4 staticSwitch24_g127488 = ifLocalVar18_g127488;
					#endif
					float ifLocalVar40_g127520 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127520 = saturate( (staticSwitch24_g127488).b );
					float temp_output_130_0_g127543 = Debug_Layer885_g127014;
					float temp_output_19_0_g127545 = TVE_FormLayers[(int)temp_output_130_0_g127543];
					half3 Input_Position180_g127546 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127546 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127546).xz ) );
					float temp_output_82_0_g127546 = temp_output_130_0_g127543;
					float2 temp_output_119_0_g127546 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127546).xz ) );
					float temp_output_7_0_g127551 = 1.0;
					float temp_output_9_0_g127551 = ( saturate( ( distance( Input_Position180_g127546 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127551 );
					float4 lerpResult131_g127546 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127546,temp_output_82_0_g127546), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127546,temp_output_82_0_g127546), 0.0 ) , saturate( ( temp_output_9_0_g127551 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127551 ) ) ));
					float4 temp_output_17_0_g127545 = lerpResult131_g127546;
					float4 temp_output_3_0_g127545 = TVE_FormParams;
					float4 ifLocalVar18_g127545 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127545 >= 0.5 )
					ifLocalVar18_g127545 = temp_output_17_0_g127545;
					else
					ifLocalVar18_g127545 = temp_output_3_0_g127545;
					float4 lerpResult22_g127545 = lerp( temp_output_3_0_g127545 , temp_output_17_0_g127545 , temp_output_19_0_g127545);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127545 = lerpResult22_g127545;
					#else
					float4 staticSwitch24_g127545 = ifLocalVar18_g127545;
					#endif
					float ifLocalVar40_g127552 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127552 = saturate( (staticSwitch24_g127545).a );
					float temp_output_136_0_g127521 = Debug_Layer885_g127014;
					float temp_output_19_0_g127523 = TVE_FlowLayers[(int)temp_output_136_0_g127521];
					half3 Input_Position180_g127524 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127524 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127524).xz ) );
					float temp_output_82_0_g127524 = temp_output_136_0_g127521;
					float2 temp_output_119_0_g127524 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127524).xz ) );
					float temp_output_7_0_g127529 = 1.0;
					float temp_output_9_0_g127529 = ( saturate( ( distance( Input_Position180_g127524 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127529 );
					float4 lerpResult131_g127524 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127524,temp_output_82_0_g127524), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127524,temp_output_82_0_g127524), 0.0 ) , saturate( ( temp_output_9_0_g127529 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127529 ) ) ));
					float4 temp_output_17_0_g127523 = lerpResult131_g127524;
					float4 temp_output_3_0_g127523 = TVE_FlowParams;
					float4 ifLocalVar18_g127523 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127523 >= 0.5 )
					ifLocalVar18_g127523 = temp_output_17_0_g127523;
					else
					ifLocalVar18_g127523 = temp_output_3_0_g127523;
					float4 lerpResult22_g127523 = lerp( temp_output_3_0_g127523 , temp_output_17_0_g127523 , temp_output_19_0_g127523);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127523 = lerpResult22_g127523;
					#else
					float4 staticSwitch24_g127523 = ifLocalVar18_g127523;
					#endif
					float3 appendResult1012_g127014 = (float3((staticSwitch24_g127523).rg , 0.0));
					float3 ifLocalVar40_g127539 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127539 = appendResult1012_g127014;
					float temp_output_136_0_g127530 = Debug_Layer885_g127014;
					float temp_output_19_0_g127532 = TVE_FlowLayers[(int)temp_output_136_0_g127530];
					half3 Input_Position180_g127533 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127533 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127533).xz ) );
					float temp_output_82_0_g127533 = temp_output_136_0_g127530;
					float2 temp_output_119_0_g127533 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127533).xz ) );
					float temp_output_7_0_g127538 = 1.0;
					float temp_output_9_0_g127538 = ( saturate( ( distance( Input_Position180_g127533 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127538 );
					float4 lerpResult131_g127533 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127533,temp_output_82_0_g127533), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127533,temp_output_82_0_g127533), 0.0 ) , saturate( ( temp_output_9_0_g127538 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127538 ) ) ));
					float4 temp_output_17_0_g127532 = lerpResult131_g127533;
					float4 temp_output_3_0_g127532 = TVE_FlowParams;
					float4 ifLocalVar18_g127532 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127532 >= 0.5 )
					ifLocalVar18_g127532 = temp_output_17_0_g127532;
					else
					ifLocalVar18_g127532 = temp_output_3_0_g127532;
					float4 lerpResult22_g127532 = lerp( temp_output_3_0_g127532 , temp_output_17_0_g127532 , temp_output_19_0_g127532);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127532 = lerpResult22_g127532;
					#else
					float4 staticSwitch24_g127532 = ifLocalVar18_g127532;
					#endif
					float ifLocalVar40_g127540 = 0;
					if( Debug_Index464_g127014 == 15.0 )
					ifLocalVar40_g127540 = (staticSwitch24_g127532).b;
					float temp_output_136_0_g127555 = Debug_Layer885_g127014;
					float temp_output_19_0_g127556 = TVE_PushLayers[(int)temp_output_136_0_g127555];
					half3 Input_Position180_g127557 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127557 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127557).xz ) );
					float temp_output_82_0_g127557 = temp_output_136_0_g127555;
					float2 temp_output_119_0_g127557 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127557).xz ) );
					float temp_output_7_0_g127562 = 1.0;
					float temp_output_9_0_g127562 = ( saturate( ( distance( Input_Position180_g127557 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127562 );
					float4 lerpResult131_g127557 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127557,temp_output_82_0_g127557), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127557,temp_output_82_0_g127557), 0.0 ) , saturate( ( temp_output_9_0_g127562 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127562 ) ) ));
					float4 temp_output_17_0_g127556 = lerpResult131_g127557;
					float4 temp_output_3_0_g127556 = TVE_PushParams;
					float4 ifLocalVar18_g127556 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127556 >= 0.5 )
					ifLocalVar18_g127556 = temp_output_17_0_g127556;
					else
					ifLocalVar18_g127556 = temp_output_3_0_g127556;
					float4 lerpResult22_g127556 = lerp( temp_output_3_0_g127556 , temp_output_17_0_g127556 , temp_output_19_0_g127556);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127556 = lerpResult22_g127556;
					#else
					float4 staticSwitch24_g127556 = ifLocalVar18_g127556;
					#endif
					float3 appendResult1780_g127014 = (float3((staticSwitch24_g127556).rg , 0.0));
					float3 ifLocalVar40_g127541 = 0;
					if( Debug_Index464_g127014 == 16.0 )
					ifLocalVar40_g127541 = appendResult1780_g127014;
					float temp_output_136_0_g127564 = Debug_Layer885_g127014;
					float temp_output_19_0_g127565 = TVE_PushLayers[(int)temp_output_136_0_g127564];
					half3 Input_Position180_g127566 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127566 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127566).xz ) );
					float temp_output_82_0_g127566 = temp_output_136_0_g127564;
					float2 temp_output_119_0_g127566 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127566).xz ) );
					float temp_output_7_0_g127571 = 1.0;
					float temp_output_9_0_g127571 = ( saturate( ( distance( Input_Position180_g127566 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127571 );
					float4 lerpResult131_g127566 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127566,temp_output_82_0_g127566), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127566,temp_output_82_0_g127566), 0.0 ) , saturate( ( temp_output_9_0_g127571 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127571 ) ) ));
					float4 temp_output_17_0_g127565 = lerpResult131_g127566;
					float4 temp_output_3_0_g127565 = TVE_PushParams;
					float4 ifLocalVar18_g127565 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127565 >= 0.5 )
					ifLocalVar18_g127565 = temp_output_17_0_g127565;
					else
					ifLocalVar18_g127565 = temp_output_3_0_g127565;
					float4 lerpResult22_g127565 = lerp( temp_output_3_0_g127565 , temp_output_17_0_g127565 , temp_output_19_0_g127565);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127565 = lerpResult22_g127565;
					#else
					float4 staticSwitch24_g127565 = ifLocalVar18_g127565;
					#endif
					float ifLocalVar40_g127542 = 0;
					if( Debug_Index464_g127014 == 17.0 )
					ifLocalVar40_g127542 = (staticSwitch24_g127565).b;
					float temp_output_136_0_g127573 = Debug_Layer885_g127014;
					float temp_output_19_0_g127574 = TVE_PushLayers[(int)temp_output_136_0_g127573];
					half3 Input_Position180_g127575 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127575 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127575).xz ) );
					float temp_output_82_0_g127575 = temp_output_136_0_g127573;
					float2 temp_output_119_0_g127575 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127575).xz ) );
					float temp_output_7_0_g127580 = 1.0;
					float temp_output_9_0_g127580 = ( saturate( ( distance( Input_Position180_g127575 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127580 );
					float4 lerpResult131_g127575 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127575,temp_output_82_0_g127575), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127575,temp_output_82_0_g127575), 0.0 ) , saturate( ( temp_output_9_0_g127580 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127580 ) ) ));
					float4 temp_output_17_0_g127574 = lerpResult131_g127575;
					float4 temp_output_3_0_g127574 = TVE_PushParams;
					float4 ifLocalVar18_g127574 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127574 >= 0.5 )
					ifLocalVar18_g127574 = temp_output_17_0_g127574;
					else
					ifLocalVar18_g127574 = temp_output_3_0_g127574;
					float4 lerpResult22_g127574 = lerp( temp_output_3_0_g127574 , temp_output_17_0_g127574 , temp_output_19_0_g127574);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127574 = lerpResult22_g127574;
					#else
					float4 staticSwitch24_g127574 = ifLocalVar18_g127574;
					#endif
					float ifLocalVar40_g127553 = 0;
					if( Debug_Index464_g127014 == 18.0 )
					ifLocalVar40_g127553 = saturate( (staticSwitch24_g127574).a );
					float temp_output_7_0_g127554 = Debug_Min721_g127014;
					float3 temp_cast_59 = (temp_output_7_0_g127554).xxx;
					float3 temp_output_9_0_g127554 = ( ( ifLocalVar40_g127582 + ( ifLocalVar40_g127419 + ifLocalVar40_g127420 ) + ( ifLocalVar40_g127439 + ifLocalVar40_g127440 ) + ( ifLocalVar40_g127513 + ifLocalVar40_g127514 ) + ( ifLocalVar40_g127515 + ifLocalVar40_g127516 + ifLocalVar40_g127517 + ifLocalVar40_g127518 ) + ( ifLocalVar40_g127519 + ifLocalVar40_g127520 + ifLocalVar40_g127552 ) + ( ifLocalVar40_g127539 + ifLocalVar40_g127540 + ifLocalVar40_g127541 + ifLocalVar40_g127542 + ifLocalVar40_g127553 ) ) - temp_cast_59 );
					float4 appendResult1659_g127014 = (float4(saturate( ( ( temp_output_9_0_g127554 / ( Debug_Max723_g127014 - temp_output_7_0_g127554 ) ) + 0.0001 ) ) , 1.0));
					float4 Output_Globals888_g127014 = appendResult1659_g127014;
					float4 ifLocalVar40_g127084 = 0;
					if( Debug_Type367_g127014 == 9.0 )
					ifLocalVar40_g127084 = Output_Globals888_g127014;
					float3 vertexToFrag328_g127014 = IN.ase_texcoord10.xyz;
					float4 color1016_g127014 = IsGammaSpace() ? float4( 0.5831653, 0.6037736, 0.2135992, 0 ) : float4( 0.2992498, 0.3229691, 0.03750122, 0 );
					float4 color1017_g127014 = IsGammaSpace() ? float4( 0.8117647, 0.3488252, 0.2627451, 0 ) : float4( 0.6239604, 0.0997834, 0.05612849, 0 );
					float4 switchResult1015_g127014 = (((ase_vface>0)?(color1016_g127014):(color1017_g127014)));
					float3 ifLocalVar40_g127018 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127018 = (switchResult1015_g127014).rgb;
					float temp_output_7_0_g127074 = Debug_Min721_g127014;
					float3 temp_cast_60 = (temp_output_7_0_g127074).xxx;
					float3 temp_output_9_0_g127074 = ( ( vertexToFrag328_g127014 + ifLocalVar40_g127018 ) - temp_cast_60 );
					float4 appendResult1658_g127014 = (float4(saturate( ( ( temp_output_9_0_g127074 / ( Debug_Max723_g127014 - temp_output_7_0_g127074 ) ) + 0.0001 ) ) , 1.0));
					float4 Output_Mesh316_g127014 = appendResult1658_g127014;
					float4 ifLocalVar40_g127086 = 0;
					if( Debug_Type367_g127014 == 11.0 )
					ifLocalVar40_g127086 = Output_Mesh316_g127014;
					float _IsTVEShader647_g127014 = _IsTVEShader;
					float Debug_Filter322_g127014 = TVE_DEBUG_Filter;
					float lerpResult1524_g127014 = lerp( 1.0 , _IsTVEShader647_g127014 , Debug_Filter322_g127014);
					float4 lerpResult1517_g127014 = lerp( Shading_Inactive1492_g127014 , ( ( ifLocalVar40_g127075 + ifLocalVar40_g127077 + ifLocalVar40_g127078 + ifLocalVar40_g127079 + ifLocalVar40_g127080 ) + ( ifLocalVar40_g127081 + ifLocalVar40_g127082 + ifLocalVar40_g127083 ) + ( ifLocalVar40_g127084 + ifLocalVar40_g127086 ) ) , lerpResult1524_g127014);
					float dotResult1472_g127014 = dot( WorldNormal , worldViewDir );
					float temp_output_1526_0_g127014 = ( 1.0 - saturate( dotResult1472_g127014 ) );
					float Shading_Fresnel1469_g127014 = (( 1.0 - ( temp_output_1526_0_g127014 * temp_output_1526_0_g127014 ) )*0.3 + 0.7);
					float Debug_Shading1653_g127014 = TVE_DEBUG_Shading;
					float lerpResult1655_g127014 = lerp( 1.0 , Shading_Fresnel1469_g127014 , Debug_Shading1653_g127014);
					float Debug_Clip623_g127014 = TVE_DEBUG_Clip;
					float lerpResult622_g127014 = lerp( 1.0 , SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g127014 * _RenderClip ));
					clip( lerpResult622_g127014 - _MainAlphaClipValue);
					clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
					

					o.Albedo = temp_cast_0;
					o.Normal = half3( 0, 0, 1 );
					#if defined(ASE_LIGHTING_SIMPLE)
						o.Specular = 1;
						o.Gloss = 1;
					#else
						#if defined(_SPECULAR_SETUP)
							o.Specular = fixed3( 1, 1, 1 );
						#else
							o.Metallic = 0.0;
						#endif
						o.Occlusion = 1;
						o.Smoothness = 0.0;
					#endif
					o.Emission = ( lerpResult1517_g127014 * lerpResult1655_g127014 ).rgb;
					o.Alpha = 1;
					float3 BakedGI = 0;
					float3 Transmission = 1;
					float3 Translucency = 1;

					#if defined( ASE_DEPTH_WRITE_ON )
						float DeviceDepth = IN.pos.z;
					#endif

					#ifdef _ALPHATEST_ON
						clip( o.Alpha - AlphaClipThreshold );
					#endif

					#if ( ASE_FRAGMENT_NORMAL == 0 )
						o.Normal = normalize(o.Normal.x * IN.worldTangent.xyz + o.Normal.y * IN.worldBitangent.xyz + o.Normal.z * IN.worldNormal.xyz);
					#elif ( ASE_FRAGMENT_NORMAL == 1 )
						o.Normal = UnityObjectToWorldNormal( o.Normal );
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						// @diogo: already in world-space; do nothing
					#endif

					#if defined( ASE_DEPTH_WRITE_ON )
						outputDepth = DeviceDepth;
					#endif

					#ifndef USING_DIRECTIONAL_LIGHT
						half3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
					#else
						half3 lightDir = _WorldSpaceLightPos0.xyz;
					#endif

					UnityGI gi;
					UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
					gi.indirect.diffuse = 0;
					gi.indirect.specular = 0;
					gi.light.color = _LightColor0.rgb;
					gi.light.dir = lightDir;

					UnityGIInput giInput;
					UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
					giInput.light = gi.light;
					giInput.worldPos = worldPos;
					giInput.worldViewDir = worldViewDir;
					giInput.atten = atten;
					#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
						giInput.lightmapUV = IN.ambientOrLightmapUV;
					#else
						giInput.lightmapUV = 0.0;
					#endif
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						giInput.ambient = IN.ambientOrLightmapUV.rgb;
					#else
						giInput.ambient.rgb = 0.0;
					#endif
					giInput.probeHDR[0] = unity_SpecCube0_HDR;
					giInput.probeHDR[1] = unity_SpecCube1_HDR;
					#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
						giInput.boxMin[0] = unity_SpecCube0_BoxMin;
					#endif
					#ifdef UNITY_SPECCUBE_BOX_PROJECTION
						giInput.boxMax[0] = unity_SpecCube0_BoxMax;
						giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
						giInput.boxMax[1] = unity_SpecCube1_BoxMax;
						giInput.boxMin[1] = unity_SpecCube1_BoxMin;
						giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
					#endif

					#if defined(ASE_LIGHTING_SIMPLE)
						#if defined(_SPECULAR_SETUP)
							LightingBlinnPhong_GI(o, giInput, gi);
						#else
							LightingLambert_GI(o, giInput, gi);
						#endif
					#else
						#if defined(_SPECULAR_SETUP)
							LightingStandardSpecular_GI(o, giInput, gi);
						#else
							LightingStandard_GI(o, giInput, gi);
						#endif
					#endif

					#ifdef ASE_BAKEDGI
						gi.indirect.diffuse = BakedGI;
					#endif

					#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
						gi.indirect.diffuse = 0;
					#endif

					half4 c = 0;
					#if defined(ASE_LIGHTING_SIMPLE)
						#if defined(_SPECULAR_SETUP)
							c += LightingBlinnPhong (o, worldViewDir, gi);
						#else
							c += LightingLambert( o, gi );
						#endif
					#else
						#if defined(_SPECULAR_SETUP)
							c += LightingStandardSpecular (o, worldViewDir, gi);
						#else
							c += LightingStandard(o, worldViewDir, gi);
						#endif
					#endif

					#ifdef ASE_TRANSMISSION
					{
						float shadow = _TransmissionShadow;
						#ifdef DIRECTIONAL
							float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
						#else
							float3 lightAtten = gi.light.color;
						#endif
						half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
						c.rgb += o.Albedo * transmission;
					}
					#endif

					#ifdef ASE_TRANSLUCENCY
					{
						float shadow = _TransShadow;
						float normal = _TransNormal;
						float scattering = _TransScattering;
						float direct = _TransDirect;
						float ambient = _TransAmbient;
						float strength = _TransStrength;

						#ifdef DIRECTIONAL
							float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
						#else
							float3 lightAtten = gi.light.color;
						#endif
						half3 lightDir = gi.light.dir + o.Normal * normal;
						half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
						half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
						c.rgb += o.Albedo * translucency * strength;
					}
					#endif

					c.rgb += o.Emission;

					#ifdef ASE_FOG
						UNITY_APPLY_FOG(IN.fogCoord, c);
					#endif
					return c;
				}
			ENDCG
		}

		
		Pass
		{
			
			Name "ForwardAdd"
			Tags { "LightMode"="ForwardAdd" }
			ZWrite Off
			Blend One One

			CGPROGRAM
				#define ASE_GEOMETRY 1
				#define ASE_FRAGMENT_NORMAL 0
				#define ASE_NEEDS_FRAG_SHADOWCOORDS
				#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
				#pragma multi_compile_instancing
				#pragma multi_compile __ LOD_FADE_CROSSFADE
				#pragma multi_compile_fog
				#define ASE_VERSION 19802
				#define ASE_USING_SAMPLING_MACROS 1

				#pragma vertex vert
				#pragma fragment frag
				#pragma skip_variants INSTANCING_ON
				#pragma multi_compile_fwdadd_fullshadows
				#ifndef UNITY_PASS_FORWARDADD
					#define UNITY_PASS_FORWARDADD
				#endif
				#include "HLSLSupport.cginc"
				#ifdef ASE_GEOMETRY
					#ifndef UNITY_INSTANCED_LOD_FADE
						#define UNITY_INSTANCED_LOD_FADE
					#endif
					#ifndef UNITY_INSTANCED_SH
						#define UNITY_INSTANCED_SH
					#endif
					#ifndef UNITY_INSTANCED_LIGHTMAPSTS
						#define UNITY_INSTANCED_LIGHTMAPSTS
					#endif
				#endif
				#include "UnityShaderVariables.cginc"
				#include "UnityCG.cginc"
				#include "Lighting.cginc"
				#include "UnityPBSLighting.cginc"
				#include "AutoLight.cginc"

				#define ASE_NEEDS_TEXTURE_COORDINATES0
				#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
				#define ASE_NEEDS_TEXTURE_COORDINATES1
				#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
				#define ASE_NEEDS_WORLD_POSITION
				#define ASE_NEEDS_FRAG_WORLD_POSITION
				#define ASE_NEEDS_VERT_POSITION
				#define ASE_NEEDS_VERT_NORMAL
				#define ASE_NEEDS_VERT_TANGENT
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
				#define ASE_NEEDS_TEXTURE_COORDINATES3
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
				#define ASE_NEEDS_WORLD_NORMAL
				#define ASE_NEEDS_FRAG_WORLD_NORMAL
				#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
				#pragma shader_feature_local TVE_LEGACY
				#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
				#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
				#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
				#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
				#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
				#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
				#else//ASE Sampling Macros
				#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
				#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
				#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
				#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
				#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
				#endif//ASE Sampling Macros
				


				struct appdata
				{
					float4 vertex : POSITION;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					float4 ase_texcoord : TEXCOORD0;
					float4 ase_color : COLOR;
					float4 ase_texcoord3 : TEXCOORD3;
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					UNITY_POSITION( pos );
					UNITY_LIGHTING_COORDS( 0, 1 )
					UNITY_FOG_COORDS( 2 )
					float4 worldNormal : TEXCOORD3;
					float4 worldTangent : TEXCOORD4;
					float4 worldBitangent : TEXCOORD5;
					#if defined( ASE_NEEDS_FRAG_SCREEN_POSITION )
						float4 screenPos : TEXCOORD6;
					#endif
					float4 ase_texcoord7 : TEXCOORD7;
					float4 ase_texcoord8 : TEXCOORD8;
					float4 ase_texcoord9 : TEXCOORD9;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				#ifdef ASE_TRANSMISSION
					float _TransmissionShadow;
				#endif
				#ifdef ASE_TRANSLUCENCY
					float _TransStrength;
					float _TransNormal;
					float _TransScattering;
					float _TransDirect;
					float _TransAmbient;
					float _TransShadow;
				#endif
				#ifdef ASE_TESSELLATION
					float _TessPhongStrength;
					float _TessValue;
					float _TessMin;
					float _TessMax;
					float _TessEdgeLength;
					float _TessMaxDisp;
				#endif

				uniform half TVE_DEBUG_Layer;
				uniform half TVE_DEBUG_Index;
				uniform half TVE_DEBUG_Type;
				uniform half TVE_DEBUG_Min;
				uniform half TVE_DEBUG_Clip;
				uniform half TVE_DEBUG_Max;
				uniform half TVE_DEBUG_Filter;
				uniform half TVE_DEBUG_Shading;
				uniform half _Banner;
				uniform half _Message;
				uniform float _IsSimpleShader;
				uniform float _IsVertexShader;
				uniform half _IsTVEShader;
				uniform float _IsCoreShader;
				uniform float _IsBlanketShader;
				uniform float _IsImpostorShader;
				uniform float _IsPolygonalShader;
				uniform float _IsLiteShader;
				uniform float _IsStandardShader;
				uniform float _IsSubsurfaceShader;
				uniform float _IsCustomShader;
				uniform float _IsIdentifier;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
				uniform half4 _main_coord_value;
				SamplerState sampler_MainAlbedoTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
				SamplerState sampler_MainNormalTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
				SamplerState sampler_MainMaskTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
				uniform half _DetailCoordMode;
				uniform half4 _SecondUVs;
				SamplerState sampler_SecondAlbedoTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
				SamplerState sampler_SecondNormalTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
				SamplerState sampler_SecondMaskTex;
				uniform float _DetailMode;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
				uniform half4 _EmissiveUVs;
				SamplerState sampler_EmissiveTex;
				uniform float4 _EmissiveColor;
				uniform float _EmissiveCat;
				float4 _MainAlbedoTex_TexelSize;
				float4 _MainNormalTex_TexelSize;
				float4 _MainMaskTex_TexelSize;
				float4 _SecondAlbedoTex_TexelSize;
				float4 _SecondMaskTex_TexelSize;
				float4 _EmissiveTex_TexelSize;
				uniform float4 _MainAlbedoTex_ST;
				UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_DEBUG_MipTex);
				SamplerState samplerTVE_DEBUG_MipTex;
				uniform float4 _MainNormalTex_ST;
				uniform float4 _MainMaskTex_ST;
				uniform float4 _SecondAlbedoTex_ST;
				uniform float4 _SecondMaskTex_ST;
				uniform float4 _EmissiveTex_ST;
				uniform float TVE_CoatLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatBaseTex);
				uniform half4 TVE_RenderBaseCoords;
				SamplerState sampler_Linear_Clamp;
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatNearTex);
				uniform half4 TVE_RenderNearCoords;
				SamplerState sampler_Linear_Repeat;
				uniform float4 TVE_RenderNearPositionR;
				uniform half TVE_RenderNearFadeValue;
				uniform half4 TVE_CoatParams;
				uniform float TVE_PaintLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintNearTex);
				uniform half4 TVE_PaintParams;
				uniform float TVE_GlowLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowNearTex);
				uniform half4 TVE_GlowParams;
				uniform float TVE_AtmoLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoNearTex);
				uniform half4 TVE_AtmoParams;
				uniform float TVE_FormLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormNearTex);
				uniform half4 TVE_FormParams;
				uniform float TVE_FlowLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowNearTex);
				uniform half4 TVE_FlowParams;
				uniform float TVE_PushLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushNearTex);
				uniform half4 TVE_PushParams;
				uniform half4 _object_phase_mode;
				uniform half4 _motion_base_vert_mode;
				uniform half _ObjectHeightValue;
				uniform half4 _motion_base_proc_mode;
				uniform half _ObjectRadiusValue;
				uniform half _motion_base_mask_mode;
				uniform half4 _MotionBaseMaskRemap;
				uniform half _MotionBaseMaskMode;
				uniform half4 _motion_small_vert_mode;
				uniform half4 _motion_small_proc_mode;
				uniform half _motion_small_mask_mode;
				uniform half4 _MotionSmallMaskRemap;
				uniform half _MotionSmallMaskMode;
				uniform half4 _motion_tiny_vert_mode;
				uniform half4 _motion_tiny_proc_mode;
				uniform half _motion_tiny_mask_mode;
				uniform half4 _MotionTinyMaskRemap;
				uniform half _MotionTinyMaskMode;
				uniform float _RenderClip;
				uniform float _MainAlphaClipValue;
				uniform float _IsElementShader;
				uniform float _IsHelperShader;


				float3 HSVToRGB( float3 c )
				{
					float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
					float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
					return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
				}
				
				float2 DecodeFloatToVector2( float enc )
				{
					float2 result ;
					result.y = enc % 2048;
					result.x = floor(enc / 2048);
					return result / (2048 - 1);
				}
				

				v2f VertexFunction (appdata v  ) {
					UNITY_SETUP_INSTANCE_ID(v);
					v2f o;
					UNITY_INITIALIZE_OUTPUT(v2f,o);
					UNITY_TRANSFER_INSTANCE_ID(v,o);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

					float Debug_Index464_g127014 = TVE_DEBUG_Index;
					float3 ifLocalVar40_g127015 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127015 = saturate( v.vertex.xyz );
					float3 ifLocalVar40_g127022 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127022 = v.normal;
					float3 ifLocalVar40_g127028 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127028 = v.tangent.xyz;
					float ifLocalVar40_g127020 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127020 = saturate( v.tangent.w );
					float ifLocalVar40_g127064 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127064 = v.ase_color.r;
					float ifLocalVar40_g127065 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127065 = v.ase_color.g;
					float ifLocalVar40_g127066 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127066 = v.ase_color.b;
					float ifLocalVar40_g127067 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127067 = v.ase_color.a;
					float3 appendResult1147_g127014 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
					float3 ifLocalVar40_g127068 = 0;
					if( Debug_Index464_g127014 == 9.0 )
					ifLocalVar40_g127068 = appendResult1147_g127014;
					float3 appendResult1148_g127014 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
					float3 ifLocalVar40_g127069 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127069 = appendResult1148_g127014;
					float3 appendResult1149_g127014 = (float3(v.texcoord2.xyzw.x , v.texcoord2.xyzw.y , 0.0));
					float3 ifLocalVar40_g127089 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127089 = appendResult1149_g127014;
					float4 break33_g127087 = _object_phase_mode;
					float temp_output_30_0_g127087 = ( v.ase_color.r * break33_g127087.x );
					float temp_output_29_0_g127087 = ( v.ase_color.g * break33_g127087.y );
					float temp_output_31_0_g127087 = ( v.ase_color.b * break33_g127087.z );
					float temp_output_28_0_g127087 = ( temp_output_30_0_g127087 + temp_output_29_0_g127087 + temp_output_31_0_g127087 + ( v.ase_color.a * break33_g127087.w ) );
					half Motion_PhaseMask1725_g127014 = temp_output_28_0_g127087;
					float3 hsvTorgb260_g127014 = HSVToRGB( float3(Motion_PhaseMask1725_g127014,1.0,1.0) );
					float3 gammaToLinear266_g127014 = GammaToLinearSpace( hsvTorgb260_g127014 );
					float3 ifLocalVar40_g127090 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127090 = gammaToLinear266_g127014;
					float4 break1821_g127014 = v.ase_color;
					float4 break33_g127586 = _motion_base_vert_mode;
					float temp_output_30_0_g127586 = ( break1821_g127014.r * break33_g127586.x );
					float temp_output_29_0_g127586 = ( break1821_g127014.g * break33_g127586.y );
					float temp_output_31_0_g127586 = ( break1821_g127014.b * break33_g127586.z );
					float temp_output_28_0_g127586 = ( temp_output_30_0_g127586 + temp_output_29_0_g127586 + temp_output_31_0_g127586 + ( break1821_g127014.a * break33_g127586.w ) );
					float temp_output_1824_0_g127014 = temp_output_28_0_g127586;
					half Bounds_Height1700_g127014 = _ObjectHeightValue;
					half Final_HeightMask1815_g127014 = saturate( ( v.vertex.xyz.y / Bounds_Height1700_g127014 ) );
					float4 break33_g127590 = _motion_base_proc_mode;
					float temp_output_30_0_g127590 = ( Final_HeightMask1815_g127014 * break33_g127590.x );
					half Bounds_Radius1702_g127014 = _ObjectRadiusValue;
					half Final_SphereMask1816_g127014 = saturate( ( length( v.vertex.xyz ) / ( Bounds_Height1700_g127014 * Bounds_Radius1702_g127014 ) ) );
					float temp_output_29_0_g127590 = ( Final_SphereMask1816_g127014 * break33_g127590.y );
					float temp_output_1834_0_g127014 = ( temp_output_30_0_g127590 + temp_output_29_0_g127590 );
					float lerpResult1887_g127014 = lerp( temp_output_1824_0_g127014 , temp_output_1834_0_g127014 , _motion_base_mask_mode);
					float clampResult17_g127583 = clamp( lerpResult1887_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127584 = _MotionBaseMaskRemap.x;
					float temp_output_9_0_g127584 = ( clampResult17_g127583 - temp_output_7_0_g127584 );
					float temp_output_6_0_g127585 = saturate( ( ( temp_output_9_0_g127584 / ( _MotionBaseMaskRemap.y - temp_output_7_0_g127584 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127585 = ( temp_output_6_0_g127585 + _MotionBaseMaskMode );
					#else
					float staticSwitch14_g127585 = temp_output_6_0_g127585;
					#endif
					half Motion_BaseMask1675_g127014 = staticSwitch14_g127585;
					float ifLocalVar40_g127091 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127091 = Motion_BaseMask1675_g127014;
					float4 break1855_g127014 = v.ase_color;
					float4 break33_g127587 = _motion_small_vert_mode;
					float temp_output_30_0_g127587 = ( break1855_g127014.r * break33_g127587.x );
					float temp_output_29_0_g127587 = ( break1855_g127014.g * break33_g127587.y );
					float temp_output_31_0_g127587 = ( break1855_g127014.b * break33_g127587.z );
					float temp_output_28_0_g127587 = ( temp_output_30_0_g127587 + temp_output_29_0_g127587 + temp_output_31_0_g127587 + ( break1855_g127014.a * break33_g127587.w ) );
					float temp_output_1845_0_g127014 = temp_output_28_0_g127587;
					float4 break33_g127591 = _motion_small_proc_mode;
					float temp_output_30_0_g127591 = ( Final_HeightMask1815_g127014 * break33_g127591.x );
					float temp_output_29_0_g127591 = ( Final_SphereMask1816_g127014 * break33_g127591.y );
					float temp_output_1849_0_g127014 = ( temp_output_30_0_g127591 + temp_output_29_0_g127591 );
					float lerpResult1889_g127014 = lerp( temp_output_1845_0_g127014 , temp_output_1849_0_g127014 , _motion_small_mask_mode);
					float enc1882_g127014 = v.ase_texcoord.z;
					float2 localDecodeFloatToVector21882_g127014 = DecodeFloatToVector2( enc1882_g127014 );
					float2 break1878_g127014 = localDecodeFloatToVector21882_g127014;
					half Small_Mask_Legacy1879_g127014 = break1878_g127014.x;
					#ifdef TVE_LEGACY
					float staticSwitch1883_g127014 = Small_Mask_Legacy1879_g127014;
					#else
					float staticSwitch1883_g127014 = lerpResult1889_g127014;
					#endif
					float clampResult17_g127593 = clamp( staticSwitch1883_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127594 = _MotionSmallMaskRemap.x;
					float temp_output_9_0_g127594 = ( clampResult17_g127593 - temp_output_7_0_g127594 );
					float temp_output_6_0_g127595 = saturate( ( ( temp_output_9_0_g127594 / ( _MotionSmallMaskRemap.y - temp_output_7_0_g127594 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127595 = ( temp_output_6_0_g127595 + _MotionSmallMaskMode );
					#else
					float staticSwitch14_g127595 = temp_output_6_0_g127595;
					#endif
					half Motion_SmallMask1693_g127014 = staticSwitch14_g127595;
					float ifLocalVar40_g127092 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127092 = Motion_SmallMask1693_g127014;
					float4 break1867_g127014 = v.ase_color;
					float4 break33_g127588 = _motion_tiny_vert_mode;
					float temp_output_30_0_g127588 = ( break1867_g127014.r * break33_g127588.x );
					float temp_output_29_0_g127588 = ( break1867_g127014.g * break33_g127588.y );
					float temp_output_31_0_g127588 = ( break1867_g127014.b * break33_g127588.z );
					float temp_output_28_0_g127588 = ( temp_output_30_0_g127588 + temp_output_29_0_g127588 + temp_output_31_0_g127588 + ( break1867_g127014.a * break33_g127588.w ) );
					float temp_output_1860_0_g127014 = temp_output_28_0_g127588;
					float4 break33_g127592 = _motion_tiny_proc_mode;
					float temp_output_30_0_g127592 = ( Final_HeightMask1815_g127014 * break33_g127592.x );
					float temp_output_29_0_g127592 = ( Final_SphereMask1816_g127014 * break33_g127592.y );
					float temp_output_1864_0_g127014 = ( temp_output_30_0_g127592 + temp_output_29_0_g127592 );
					float lerpResult1891_g127014 = lerp( temp_output_1860_0_g127014 , temp_output_1864_0_g127014 , _motion_tiny_mask_mode);
					half Tiny_Mask_Legacy1880_g127014 = break1878_g127014.y;
					#ifdef TVE_LEGACY
					float staticSwitch1886_g127014 = Tiny_Mask_Legacy1880_g127014;
					#else
					float staticSwitch1886_g127014 = lerpResult1891_g127014;
					#endif
					float clampResult17_g127596 = clamp( staticSwitch1886_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127597 = _MotionTinyMaskRemap.x;
					float temp_output_9_0_g127597 = ( clampResult17_g127596 - temp_output_7_0_g127597 );
					float temp_output_6_0_g127598 = saturate( ( ( temp_output_9_0_g127597 / ( _MotionTinyMaskRemap.y - temp_output_7_0_g127597 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127598 = ( temp_output_6_0_g127598 + _MotionTinyMaskMode );
					#else
					float staticSwitch14_g127598 = temp_output_6_0_g127598;
					#endif
					half Motion_TinyMask1717_g127014 = staticSwitch14_g127598;
					float ifLocalVar40_g127093 = 0;
					if( Debug_Index464_g127014 == 15.0 )
					ifLocalVar40_g127093 = Motion_TinyMask1717_g127014;
					float3 appendResult60_g127088 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
					float3 ifLocalVar40_g127094 = 0;
					if( Debug_Index464_g127014 == 16.0 )
					ifLocalVar40_g127094 = appendResult60_g127088;
					float3 vertexToFrag328_g127014 = ( ( ifLocalVar40_g127015 + ifLocalVar40_g127022 + ifLocalVar40_g127028 + ifLocalVar40_g127020 ) + ( ifLocalVar40_g127064 + ifLocalVar40_g127065 + ifLocalVar40_g127066 + ifLocalVar40_g127067 ) + ( ifLocalVar40_g127068 + ifLocalVar40_g127069 + ifLocalVar40_g127089 ) + ( ifLocalVar40_g127090 + ifLocalVar40_g127091 + ifLocalVar40_g127092 + ifLocalVar40_g127093 + ifLocalVar40_g127094 ) );
					o.ase_texcoord9.xyz = vertexToFrag328_g127014;
					
					o.ase_texcoord7 = v.ase_texcoord;
					o.ase_texcoord8 = v.texcoord1.xyzw;
					
					//setting value to unused interpolator channels and avoid initialization warnings
					o.ase_texcoord9.w = 0;

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = defaultVertexValue;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = v.normal;
					v.tangent = v.tangent;

					float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
					half3 worldNormal = UnityObjectToWorldNormal( v.normal );
					half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
					half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
					half3 worldBitangent = cross( worldNormal, worldTangent ) * tangentSign;

					o.pos = UnityObjectToClipPos( v.vertex );
					o.worldNormal = float4( worldNormal, worldPos.x );
					o.worldTangent = float4( worldTangent, worldPos.y );
					o.worldBitangent = float4( worldBitangent, worldPos.z );

					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);

					#ifdef ASE_FOG
						UNITY_TRANSFER_FOG(o,o.pos);
					#endif
					#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
						o.screenPos = ComputeScreenPos(o.pos);
					#endif
					return o;
				}

				#if defined(ASE_TESSELLATION)
				struct VertexControl
				{
					float4 vertex : INTERNALTESSPOS;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					float4 ase_texcoord : TEXCOORD0;
					float4 ase_color : COLOR;
					float4 ase_texcoord3 : TEXCOORD3;

					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct TessellationFactors
				{
					float edge[3] : SV_TessFactor;
					float inside : SV_InsideTessFactor;
				};

				VertexControl vert ( appdata v )
				{
					VertexControl o;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_TRANSFER_INSTANCE_ID(v, o);
					o.vertex = v.vertex;
					o.tangent = v.tangent;
					o.normal = v.normal;
					o.texcoord1 = v.texcoord1;
					o.texcoord2 = v.texcoord2;
					o.ase_texcoord = v.ase_texcoord;
					o.ase_color = v.ase_color;
					o.ase_texcoord3 = v.ase_texcoord3;
					return o;
				}

				TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
				{
					TessellationFactors o;
					float4 tf = 1;
					float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
					float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
					#if defined(ASE_FIXED_TESSELLATION)
					tf = FixedTess( tessValue );
					#elif defined(ASE_DISTANCE_TESSELLATION)
					tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
					#elif defined(ASE_LENGTH_TESSELLATION)
					tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
					#elif defined(ASE_LENGTH_CULL_TESSELLATION)
					tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
					#endif
					o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
					return o;
				}

				[domain("tri")]
				[partitioning("fractional_odd")]
				[outputtopology("triangle_cw")]
				[patchconstantfunc("TessellationFunction")]
				[outputcontrolpoints(3)]
				VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
				{
				   return patch[id];
				}

				[domain("tri")]
				v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
				{
					appdata o = (appdata) 0;
					o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
					o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
					o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
					o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
					o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
					o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
					o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
					o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
					#if defined(ASE_PHONG_TESSELLATION)
					float3 pp[3];
					for (int i = 0; i < 3; ++i)
						pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
					float phongStrength = _TessPhongStrength;
					o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
					#endif
					UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
					return VertexFunction(o);
				}
				#else
				v2f vert ( appdata v )
				{
					return VertexFunction( v );
				}
				#endif

				half4 frag ( v2f IN , bool ase_vface : SV_IsFrontFace
					#if defined( ASE_DEPTH_WRITE_ON )
					, out float outputDepth : SV_Depth
					#endif
					) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID(IN);

					#ifdef LOD_FADE_CROSSFADE
						UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
					#endif

					#if defined(ASE_LIGHTING_SIMPLE)
						SurfaceOutput o = (SurfaceOutput)0;
					#else
						#if defined(_SPECULAR_SETUP)
							SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
						#else
							SurfaceOutputStandard o = (SurfaceOutputStandard)0;
						#endif
					#endif

					float3 WorldNormal = IN.worldNormal;
					float3 WorldTangent = IN.worldTangent;
					float3 WorldBiTangent = IN.worldBitangent;
					float3 worldPos = float3(IN.worldNormal.w,IN.worldTangent.w,IN.worldBitangent.w);
					float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));

					#if defined( ASE_NEEDS_FRAG_SCREEN_POSITION )
						float4 ScreenPos = IN.screenPos;
					#endif

					#if defined( ASE_NEEDS_FRAG_SHADOWCOORDS )
						UNITY_LIGHT_ATTENUATION( atten, IN, worldPos )
					#else
						half atten = 1;
					#endif

					float3 temp_cast_0 = (0.0).xxx;
					
					float4 color690_g127014 = IsGammaSpace() ? float4( 0.1, 0.1, 0.1, 0 ) : float4( 0.01002283, 0.01002283, 0.01002283, 0 );
					float4 Shading_Inactive1492_g127014 = color690_g127014;
					float Debug_Type367_g127014 = TVE_DEBUG_Type;
					float4 color646_g127014 = IsGammaSpace() ? float4( 0.9245283, 0.7969696, 0.4142933, 1 ) : float4( 0.8368256, 0.5987038, 0.1431069, 1 );
					float4 Output_Converted717_g127014 = color646_g127014;
					float4 ifLocalVar40_g127075 = 0;
					if( Debug_Type367_g127014 == 0.0 )
					ifLocalVar40_g127075 = Output_Converted717_g127014;
					float4 color1529_g127014 = IsGammaSpace() ? float4( 0.9254902, 0.7960784, 0.4156863, 1 ) : float4( 0.8387991, 0.5972018, 0.1441285, 1 );
					float _IsCoreShader1551_g127014 = _IsCoreShader;
					float4 color1539_g127014 = IsGammaSpace() ? float4( 0.6196079, 0.7686275, 0.1490196, 0 ) : float4( 0.3419145, 0.5520116, 0.01938236, 0 );
					float _IsBlanketShader1554_g127014 = _IsBlanketShader;
					float4 color1542_g127014 = IsGammaSpace() ? float4( 0.9716981, 0.3162602, 0.4816265, 0 ) : float4( 0.9368213, 0.08154967, 0.1974273, 0 );
					float _IsImpostorShader1110_g127014 = _IsImpostorShader;
					float4 color1544_g127014 = IsGammaSpace() ? float4( 0.3254902, 0.6117647, 0.8117647, 0 ) : float4( 0.08650047, 0.3324516, 0.6239604, 0 );
					float _IsPolygonalShader1112_g127014 = _IsPolygonalShader;
					float4 color1649_g127014 = IsGammaSpace() ? float4( 0.6, 0.6, 0.6, 0 ) : float4( 0.3185468, 0.3185468, 0.3185468, 0 );
					float _IsLiteShader1648_g127014 = _IsLiteShader;
					float4 Output_Scope1531_g127014 = ( ( color1529_g127014 * _IsCoreShader1551_g127014 ) + ( color1539_g127014 * _IsBlanketShader1554_g127014 ) + ( color1542_g127014 * _IsImpostorShader1110_g127014 ) + ( color1544_g127014 * _IsPolygonalShader1112_g127014 ) + ( color1649_g127014 * _IsLiteShader1648_g127014 ) );
					float4 ifLocalVar40_g127077 = 0;
					if( Debug_Type367_g127014 == 2.0 )
					ifLocalVar40_g127077 = Output_Scope1531_g127014;
					float4 color529_g127014 = IsGammaSpace() ? float4( 0.62, 0.77, 0.15, 0 ) : float4( 0.3423916, 0.5542217, 0.01960665, 0 );
					float _IsVertexShader1158_g127014 = _IsVertexShader;
					float4 color544_g127014 = IsGammaSpace() ? float4( 0.3252937, 0.6122813, 0.8113208, 0 ) : float4( 0.08639329, 0.3330702, 0.6231937, 0 );
					float _IsSimpleShader359_g127014 = _IsSimpleShader;
					float4 color521_g127014 = IsGammaSpace() ? float4( 0.6566009, 0.3404236, 0.8490566, 0 ) : float4( 0.3886527, 0.09487338, 0.6903409, 0 );
					float _IsStandardShader344_g127014 = _IsStandardShader;
					float4 color1121_g127014 = IsGammaSpace() ? float4( 0.9716981, 0.88463, 0.1787558, 0 ) : float4( 0.9368213, 0.7573396, 0.02686729, 0 );
					float _IsSubsurfaceShader548_g127014 = _IsSubsurfaceShader;
					float4 Output_Lighting525_g127014 = ( ( color529_g127014 * _IsVertexShader1158_g127014 ) + ( color544_g127014 * _IsSimpleShader359_g127014 ) + ( color521_g127014 * _IsStandardShader344_g127014 ) + ( color1121_g127014 * _IsSubsurfaceShader548_g127014 ) );
					float4 ifLocalVar40_g127078 = 0;
					if( Debug_Type367_g127014 == 3.0 )
					ifLocalVar40_g127078 = Output_Lighting525_g127014;
					float4 color1559_g127014 = IsGammaSpace() ? float4( 0.9245283, 0.7969696, 0.4142933, 1 ) : float4( 0.8368256, 0.5987038, 0.1431069, 1 );
					float4 color1563_g127014 = IsGammaSpace() ? float4( 0.3053578, 0.8867924, 0.5362216, 0 ) : float4( 0.0759199, 0.7615293, 0.2491121, 0 );
					float _IsCustomShader1570_g127014 = _IsCustomShader;
					float4 lerpResult1561_g127014 = lerp( color1559_g127014 , color1563_g127014 , _IsCustomShader1570_g127014);
					float4 Output_Custom1560_g127014 = lerpResult1561_g127014;
					float4 ifLocalVar40_g127079 = 0;
					if( Debug_Type367_g127014 == 4.0 )
					ifLocalVar40_g127079 = Output_Custom1560_g127014;
					float3 hsvTorgb1452_g127014 = HSVToRGB( float3(( _IsIdentifier / 1000.0 ),1.0,1.0) );
					float3 gammaToLinear1453_g127014 = GammaToLinearSpace( hsvTorgb1452_g127014 );
					float4 appendResult1657_g127014 = (float4(gammaToLinear1453_g127014 , 1.0));
					float4 Output_Sharing1355_g127014 = appendResult1657_g127014;
					float4 ifLocalVar40_g127080 = 0;
					if( Debug_Type367_g127014 == 5.0 )
					ifLocalVar40_g127080 = Output_Sharing1355_g127014;
					float Debug_Index464_g127014 = TVE_DEBUG_Index;
					half2 Main_UVs1219_g127014 = ( ( IN.ase_texcoord7.xy * (_main_coord_value).xy ) + (_main_coord_value).zw );
					float4 tex2DNode586_g127014 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 );
					float3 appendResult637_g127014 = (float3(tex2DNode586_g127014.r , tex2DNode586_g127014.g , tex2DNode586_g127014.b));
					float3 ifLocalVar40_g127021 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127021 = appendResult637_g127014;
					float ifLocalVar40_g127025 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127025 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 ).a;
					float4 tex2DNode604_g127014 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, Main_UVs1219_g127014 );
					float3 appendResult876_g127014 = (float3(tex2DNode604_g127014.a , tex2DNode604_g127014.g , 1.0));
					float3 gammaToLinear878_g127014 = GammaToLinearSpace( appendResult876_g127014 );
					float3 ifLocalVar40_g127029 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127029 = gammaToLinear878_g127014;
					float ifLocalVar40_g127017 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127017 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).r;
					float ifLocalVar40_g127035 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127035 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).g;
					float ifLocalVar40_g127026 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127026 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).b;
					float ifLocalVar40_g127016 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127016 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).a;
					float2 appendResult1251_g127014 = (float2(IN.ase_texcoord8.z , IN.ase_texcoord8.w));
					float2 Mesh_DetailCoord1254_g127014 = appendResult1251_g127014;
					float2 lerpResult1231_g127014 = lerp( IN.ase_texcoord7.xy , Mesh_DetailCoord1254_g127014 , _DetailCoordMode);
					half2 Layer_02_UVs1234_g127014 = ( ( lerpResult1231_g127014 * (_SecondUVs).xy ) + (_SecondUVs).zw );
					float4 tex2DNode854_g127014 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 );
					float3 appendResult839_g127014 = (float3(tex2DNode854_g127014.r , tex2DNode854_g127014.g , tex2DNode854_g127014.b));
					float3 ifLocalVar40_g127019 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127019 = appendResult839_g127014;
					float ifLocalVar40_g127027 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127027 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 ).a;
					float4 tex2DNode841_g127014 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondNormalTex, Layer_02_UVs1234_g127014 );
					float3 appendResult880_g127014 = (float3(tex2DNode841_g127014.a , tex2DNode841_g127014.g , 1.0));
					float3 gammaToLinear879_g127014 = GammaToLinearSpace( appendResult880_g127014 );
					float3 ifLocalVar40_g127034 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127034 = gammaToLinear879_g127014;
					float ifLocalVar40_g127030 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127030 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).r;
					float ifLocalVar40_g127024 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127024 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).g;
					float ifLocalVar40_g127032 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127032 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).b;
					float ifLocalVar40_g127033 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127033 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).a;
					half2 Emissive_UVs1245_g127014 = ( ( IN.ase_texcoord7.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
					float4 tex2DNode858_g127014 = SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs1245_g127014 );
					float ifLocalVar40_g127023 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127023 = tex2DNode858_g127014.r;
					float Debug_Min721_g127014 = TVE_DEBUG_Min;
					float temp_output_7_0_g127031 = Debug_Min721_g127014;
					float4 temp_cast_4 = (temp_output_7_0_g127031).xxxx;
					float4 temp_output_9_0_g127031 = ( ( float4( ( ( ifLocalVar40_g127021 + ifLocalVar40_g127025 + ifLocalVar40_g127029 ) + ( ifLocalVar40_g127017 + ifLocalVar40_g127035 + ifLocalVar40_g127026 + ifLocalVar40_g127016 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g127019 + ifLocalVar40_g127027 + ifLocalVar40_g127034 ) + ( ifLocalVar40_g127030 + ifLocalVar40_g127024 + ifLocalVar40_g127032 + ifLocalVar40_g127033 ) ) * _DetailMode ) , 0.0 ) + ( ( ifLocalVar40_g127023 * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_4 );
					float Debug_Max723_g127014 = TVE_DEBUG_Max;
					float4 Output_Maps561_g127014 = saturate( ( ( temp_output_9_0_g127031 / ( Debug_Max723_g127014 - temp_output_7_0_g127031 ) ) + 0.0001 ) );
					float4 ifLocalVar40_g127081 = 0;
					if( Debug_Type367_g127014 == 6.0 )
					ifLocalVar40_g127081 = Output_Maps561_g127014;
					float Resolution44_g127052 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
					float4 color62_g127052 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127052 = 0;
					if( Resolution44_g127052 <= 256.0 )
					ifLocalVar61_g127052 = color62_g127052;
					float4 color55_g127052 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127052 = 0;
					if( Resolution44_g127052 == 512.0 )
					ifLocalVar56_g127052 = color55_g127052;
					float4 color42_g127052 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127052 = 0;
					if( Resolution44_g127052 == 1024.0 )
					ifLocalVar40_g127052 = color42_g127052;
					float4 color48_g127052 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127052 = 0;
					if( Resolution44_g127052 == 2048.0 )
					ifLocalVar47_g127052 = color48_g127052;
					float4 color51_g127052 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127052 = 0;
					if( Resolution44_g127052 >= 4096.0 )
					ifLocalVar52_g127052 = color51_g127052;
					float4 ifLocalVar40_g127038 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127038 = ( ifLocalVar61_g127052 + ifLocalVar56_g127052 + ifLocalVar40_g127052 + ifLocalVar47_g127052 + ifLocalVar52_g127052 );
					float Resolution44_g127051 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
					float4 color62_g127051 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127051 = 0;
					if( Resolution44_g127051 <= 256.0 )
					ifLocalVar61_g127051 = color62_g127051;
					float4 color55_g127051 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127051 = 0;
					if( Resolution44_g127051 == 512.0 )
					ifLocalVar56_g127051 = color55_g127051;
					float4 color42_g127051 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127051 = 0;
					if( Resolution44_g127051 == 1024.0 )
					ifLocalVar40_g127051 = color42_g127051;
					float4 color48_g127051 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127051 = 0;
					if( Resolution44_g127051 == 2048.0 )
					ifLocalVar47_g127051 = color48_g127051;
					float4 color51_g127051 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127051 = 0;
					if( Resolution44_g127051 >= 4096.0 )
					ifLocalVar52_g127051 = color51_g127051;
					float4 ifLocalVar40_g127036 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127036 = ( ifLocalVar61_g127051 + ifLocalVar56_g127051 + ifLocalVar40_g127051 + ifLocalVar47_g127051 + ifLocalVar52_g127051 );
					float Resolution44_g127050 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
					float4 color62_g127050 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127050 = 0;
					if( Resolution44_g127050 <= 256.0 )
					ifLocalVar61_g127050 = color62_g127050;
					float4 color55_g127050 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127050 = 0;
					if( Resolution44_g127050 == 512.0 )
					ifLocalVar56_g127050 = color55_g127050;
					float4 color42_g127050 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127050 = 0;
					if( Resolution44_g127050 == 1024.0 )
					ifLocalVar40_g127050 = color42_g127050;
					float4 color48_g127050 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127050 = 0;
					if( Resolution44_g127050 == 2048.0 )
					ifLocalVar47_g127050 = color48_g127050;
					float4 color51_g127050 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127050 = 0;
					if( Resolution44_g127050 >= 4096.0 )
					ifLocalVar52_g127050 = color51_g127050;
					float4 ifLocalVar40_g127037 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127037 = ( ifLocalVar61_g127050 + ifLocalVar56_g127050 + ifLocalVar40_g127050 + ifLocalVar47_g127050 + ifLocalVar52_g127050 );
					float Resolution44_g127057 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 color62_g127057 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127057 = 0;
					if( Resolution44_g127057 <= 256.0 )
					ifLocalVar61_g127057 = color62_g127057;
					float4 color55_g127057 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127057 = 0;
					if( Resolution44_g127057 == 512.0 )
					ifLocalVar56_g127057 = color55_g127057;
					float4 color42_g127057 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127057 = 0;
					if( Resolution44_g127057 == 1024.0 )
					ifLocalVar40_g127057 = color42_g127057;
					float4 color48_g127057 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127057 = 0;
					if( Resolution44_g127057 == 2048.0 )
					ifLocalVar47_g127057 = color48_g127057;
					float4 color51_g127057 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127057 = 0;
					if( Resolution44_g127057 >= 4096.0 )
					ifLocalVar52_g127057 = color51_g127057;
					float4 ifLocalVar40_g127044 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127044 = ( ifLocalVar61_g127057 + ifLocalVar56_g127057 + ifLocalVar40_g127057 + ifLocalVar47_g127057 + ifLocalVar52_g127057 );
					float Resolution44_g127056 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
					float4 color62_g127056 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127056 = 0;
					if( Resolution44_g127056 <= 256.0 )
					ifLocalVar61_g127056 = color62_g127056;
					float4 color55_g127056 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127056 = 0;
					if( Resolution44_g127056 == 512.0 )
					ifLocalVar56_g127056 = color55_g127056;
					float4 color42_g127056 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127056 = 0;
					if( Resolution44_g127056 == 1024.0 )
					ifLocalVar40_g127056 = color42_g127056;
					float4 color48_g127056 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127056 = 0;
					if( Resolution44_g127056 == 2048.0 )
					ifLocalVar47_g127056 = color48_g127056;
					float4 color51_g127056 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127056 = 0;
					if( Resolution44_g127056 >= 4096.0 )
					ifLocalVar52_g127056 = color51_g127056;
					float4 ifLocalVar40_g127042 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127042 = ( ifLocalVar61_g127056 + ifLocalVar56_g127056 + ifLocalVar40_g127056 + ifLocalVar47_g127056 + ifLocalVar52_g127056 );
					float Resolution44_g127058 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 color62_g127058 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127058 = 0;
					if( Resolution44_g127058 <= 256.0 )
					ifLocalVar61_g127058 = color62_g127058;
					float4 color55_g127058 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127058 = 0;
					if( Resolution44_g127058 == 512.0 )
					ifLocalVar56_g127058 = color55_g127058;
					float4 color42_g127058 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127058 = 0;
					if( Resolution44_g127058 == 1024.0 )
					ifLocalVar40_g127058 = color42_g127058;
					float4 color48_g127058 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127058 = 0;
					if( Resolution44_g127058 == 2048.0 )
					ifLocalVar47_g127058 = color48_g127058;
					float4 color51_g127058 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127058 = 0;
					if( Resolution44_g127058 >= 4096.0 )
					ifLocalVar52_g127058 = color51_g127058;
					float4 ifLocalVar40_g127043 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127043 = ( ifLocalVar61_g127058 + ifLocalVar56_g127058 + ifLocalVar40_g127058 + ifLocalVar47_g127058 + ifLocalVar52_g127058 );
					float Resolution44_g127055 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
					float4 color62_g127055 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127055 = 0;
					if( Resolution44_g127055 <= 256.0 )
					ifLocalVar61_g127055 = color62_g127055;
					float4 color55_g127055 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127055 = 0;
					if( Resolution44_g127055 == 512.0 )
					ifLocalVar56_g127055 = color55_g127055;
					float4 color42_g127055 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127055 = 0;
					if( Resolution44_g127055 == 1024.0 )
					ifLocalVar40_g127055 = color42_g127055;
					float4 color48_g127055 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127055 = 0;
					if( Resolution44_g127055 == 2048.0 )
					ifLocalVar47_g127055 = color48_g127055;
					float4 color51_g127055 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127055 = 0;
					if( Resolution44_g127055 >= 4096.0 )
					ifLocalVar52_g127055 = color51_g127055;
					float4 ifLocalVar40_g127045 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127045 = ( ifLocalVar61_g127055 + ifLocalVar56_g127055 + ifLocalVar40_g127055 + ifLocalVar47_g127055 + ifLocalVar52_g127055 );
					float4 Output_Resolution737_g127014 = ( ( ifLocalVar40_g127038 + ifLocalVar40_g127036 + ifLocalVar40_g127037 ) + ( ifLocalVar40_g127044 + ifLocalVar40_g127042 + ifLocalVar40_g127043 ) + ifLocalVar40_g127045 );
					float4 ifLocalVar40_g127082 = 0;
					if( Debug_Type367_g127014 == 7.0 )
					ifLocalVar40_g127082 = Output_Resolution737_g127014;
					float2 uv_MainAlbedoTex = IN.ase_texcoord7.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
					float2 UVs72_g127063 = Main_UVs1219_g127014;
					float Resolution44_g127063 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127063 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127063 * ( Resolution44_g127063 / 8.0 ) ) );
					float4 lerpResult78_g127063 = lerp( SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ) , tex2DNode77_g127063 , tex2DNode77_g127063.a);
					float4 ifLocalVar40_g127041 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127041 = lerpResult78_g127063;
					float2 uv_MainNormalTex = IN.ase_texcoord7.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
					float2 UVs72_g127054 = Main_UVs1219_g127014;
					float Resolution44_g127054 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
					float4 tex2DNode77_g127054 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127054 * ( Resolution44_g127054 / 8.0 ) ) );
					float4 lerpResult78_g127054 = lerp( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, uv_MainNormalTex ) , tex2DNode77_g127054 , tex2DNode77_g127054.a);
					float4 ifLocalVar40_g127039 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127039 = lerpResult78_g127054;
					float2 uv_MainMaskTex = IN.ase_texcoord7.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
					float2 UVs72_g127053 = Main_UVs1219_g127014;
					float Resolution44_g127053 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
					float4 tex2DNode77_g127053 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127053 * ( Resolution44_g127053 / 8.0 ) ) );
					float4 lerpResult78_g127053 = lerp( SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, uv_MainMaskTex ) , tex2DNode77_g127053 , tex2DNode77_g127053.a);
					float4 ifLocalVar40_g127040 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127040 = lerpResult78_g127053;
					float2 uv_SecondAlbedoTex = IN.ase_texcoord7.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
					float2 UVs72_g127061 = Layer_02_UVs1234_g127014;
					float Resolution44_g127061 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127061 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127061 * ( Resolution44_g127061 / 8.0 ) ) );
					float4 lerpResult78_g127061 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127061 , tex2DNode77_g127061.a);
					float4 ifLocalVar40_g127048 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127048 = lerpResult78_g127061;
					float2 uv_SecondMaskTex = IN.ase_texcoord7.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
					float2 UVs72_g127060 = Layer_02_UVs1234_g127014;
					float Resolution44_g127060 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
					float4 tex2DNode77_g127060 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127060 * ( Resolution44_g127060 / 8.0 ) ) );
					float4 lerpResult78_g127060 = lerp( SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, uv_SecondMaskTex ) , tex2DNode77_g127060 , tex2DNode77_g127060.a);
					float4 ifLocalVar40_g127046 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127046 = lerpResult78_g127060;
					float2 UVs72_g127062 = Layer_02_UVs1234_g127014;
					float Resolution44_g127062 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127062 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127062 * ( Resolution44_g127062 / 8.0 ) ) );
					float4 lerpResult78_g127062 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127062 , tex2DNode77_g127062.a);
					float4 ifLocalVar40_g127047 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127047 = lerpResult78_g127062;
					float2 uv_EmissiveTex = IN.ase_texcoord7.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
					float2 UVs72_g127059 = Emissive_UVs1245_g127014;
					float Resolution44_g127059 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
					float4 tex2DNode77_g127059 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127059 * ( Resolution44_g127059 / 8.0 ) ) );
					float4 lerpResult78_g127059 = lerp( SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, uv_EmissiveTex ) , tex2DNode77_g127059 , tex2DNode77_g127059.a);
					float4 ifLocalVar40_g127049 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127049 = lerpResult78_g127059;
					float4 Output_MipLevel1284_g127014 = ( ( ifLocalVar40_g127041 + ifLocalVar40_g127039 + ifLocalVar40_g127040 ) + ( ifLocalVar40_g127048 + ifLocalVar40_g127046 + ifLocalVar40_g127047 ) + ifLocalVar40_g127049 );
					float4 ifLocalVar40_g127083 = 0;
					if( Debug_Type367_g127014 == 8.0 )
					ifLocalVar40_g127083 = Output_MipLevel1284_g127014;
					float ifLocalVar40_g127582 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127582 = (float3( 0,0,0 )).z;
					float Debug_Layer885_g127014 = TVE_DEBUG_Layer;
					float temp_output_82_0_g127401 = Debug_Layer885_g127014;
					float temp_output_19_0_g127403 = TVE_CoatLayers[(int)temp_output_82_0_g127401];
					float3 WorldPosition893_g127014 = worldPos;
					half3 Input_Position180_g127404 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127404 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127404).xz ) );
					float temp_output_82_0_g127404 = temp_output_82_0_g127401;
					float2 temp_output_119_0_g127404 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127404).xz ) );
					float temp_output_7_0_g127409 = 1.0;
					float temp_output_9_0_g127409 = ( saturate( ( distance( Input_Position180_g127404 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127409 );
					float4 lerpResult131_g127404 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127404,temp_output_82_0_g127404), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127404,temp_output_82_0_g127404), 0.0 ) , saturate( ( temp_output_9_0_g127409 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127409 ) ) ));
					float4 temp_output_17_0_g127403 = lerpResult131_g127404;
					float4 temp_output_3_0_g127403 = TVE_CoatParams;
					float4 ifLocalVar18_g127403 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127403 >= 0.5 )
					ifLocalVar18_g127403 = temp_output_17_0_g127403;
					else
					ifLocalVar18_g127403 = temp_output_3_0_g127403;
					float4 lerpResult22_g127403 = lerp( temp_output_3_0_g127403 , temp_output_17_0_g127403 , temp_output_19_0_g127403);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127403 = lerpResult22_g127403;
					#else
					float4 staticSwitch24_g127403 = ifLocalVar18_g127403;
					#endif
					float ifLocalVar40_g127419 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127419 = (staticSwitch24_g127403).g;
					float temp_output_82_0_g127410 = Debug_Layer885_g127014;
					float temp_output_19_0_g127412 = TVE_CoatLayers[(int)temp_output_82_0_g127410];
					half3 Input_Position180_g127413 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127413 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127413).xz ) );
					float temp_output_82_0_g127413 = temp_output_82_0_g127410;
					float2 temp_output_119_0_g127413 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127413).xz ) );
					float temp_output_7_0_g127418 = 1.0;
					float temp_output_9_0_g127418 = ( saturate( ( distance( Input_Position180_g127413 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127418 );
					float4 lerpResult131_g127413 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127413,temp_output_82_0_g127413), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127413,temp_output_82_0_g127413), 0.0 ) , saturate( ( temp_output_9_0_g127418 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127418 ) ) ));
					float4 temp_output_17_0_g127412 = lerpResult131_g127413;
					float4 temp_output_3_0_g127412 = TVE_CoatParams;
					float4 ifLocalVar18_g127412 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127412 >= 0.5 )
					ifLocalVar18_g127412 = temp_output_17_0_g127412;
					else
					ifLocalVar18_g127412 = temp_output_3_0_g127412;
					float4 lerpResult22_g127412 = lerp( temp_output_3_0_g127412 , temp_output_17_0_g127412 , temp_output_19_0_g127412);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127412 = lerpResult22_g127412;
					#else
					float4 staticSwitch24_g127412 = ifLocalVar18_g127412;
					#endif
					float ifLocalVar40_g127420 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127420 = (staticSwitch24_g127412).b;
					float temp_output_82_0_g127430 = Debug_Layer885_g127014;
					float temp_output_19_0_g127432 = TVE_PaintLayers[(int)temp_output_82_0_g127430];
					half3 Input_Position180_g127433 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127433 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127433).xz ) );
					float temp_output_82_0_g127433 = temp_output_82_0_g127430;
					float2 temp_output_119_0_g127433 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127433).xz ) );
					float temp_output_7_0_g127438 = 1.0;
					float temp_output_9_0_g127438 = ( saturate( ( distance( Input_Position180_g127433 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127438 );
					float4 lerpResult131_g127433 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127433,temp_output_82_0_g127433), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127433,temp_output_82_0_g127433), 0.0 ) , saturate( ( temp_output_9_0_g127438 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127438 ) ) ));
					float4 temp_output_17_0_g127432 = lerpResult131_g127433;
					float4 temp_output_3_0_g127432 = TVE_PaintParams;
					float4 ifLocalVar18_g127432 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127432 >= 0.5 )
					ifLocalVar18_g127432 = temp_output_17_0_g127432;
					else
					ifLocalVar18_g127432 = temp_output_3_0_g127432;
					float4 lerpResult22_g127432 = lerp( temp_output_3_0_g127432 , temp_output_17_0_g127432 , temp_output_19_0_g127432);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127432 = lerpResult22_g127432;
					#else
					float4 staticSwitch24_g127432 = ifLocalVar18_g127432;
					#endif
					float3 ifLocalVar40_g127439 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127439 = (staticSwitch24_g127432).rgb;
					float temp_output_82_0_g127421 = Debug_Layer885_g127014;
					float temp_output_19_0_g127423 = TVE_PaintLayers[(int)temp_output_82_0_g127421];
					half3 Input_Position180_g127424 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127424 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127424).xz ) );
					float temp_output_82_0_g127424 = temp_output_82_0_g127421;
					float2 temp_output_119_0_g127424 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127424).xz ) );
					float temp_output_7_0_g127429 = 1.0;
					float temp_output_9_0_g127429 = ( saturate( ( distance( Input_Position180_g127424 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127429 );
					float4 lerpResult131_g127424 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127424,temp_output_82_0_g127424), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127424,temp_output_82_0_g127424), 0.0 ) , saturate( ( temp_output_9_0_g127429 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127429 ) ) ));
					float4 temp_output_17_0_g127423 = lerpResult131_g127424;
					float4 temp_output_3_0_g127423 = TVE_PaintParams;
					float4 ifLocalVar18_g127423 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127423 >= 0.5 )
					ifLocalVar18_g127423 = temp_output_17_0_g127423;
					else
					ifLocalVar18_g127423 = temp_output_3_0_g127423;
					float4 lerpResult22_g127423 = lerp( temp_output_3_0_g127423 , temp_output_17_0_g127423 , temp_output_19_0_g127423);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127423 = lerpResult22_g127423;
					#else
					float4 staticSwitch24_g127423 = ifLocalVar18_g127423;
					#endif
					float ifLocalVar40_g127440 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127440 = saturate( (staticSwitch24_g127423).a );
					float temp_output_82_0_g127441 = Debug_Layer885_g127014;
					float temp_output_19_0_g127443 = TVE_GlowLayers[(int)temp_output_82_0_g127441];
					half3 Input_Position180_g127444 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127444 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127444).xz ) );
					float temp_output_82_0_g127444 = temp_output_82_0_g127441;
					float2 temp_output_119_0_g127444 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127444).xz ) );
					float temp_output_7_0_g127449 = 1.0;
					float temp_output_9_0_g127449 = ( saturate( ( distance( Input_Position180_g127444 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127449 );
					float4 lerpResult131_g127444 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127444,temp_output_82_0_g127444), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127444,temp_output_82_0_g127444), 0.0 ) , saturate( ( temp_output_9_0_g127449 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127449 ) ) ));
					float4 temp_output_17_0_g127443 = lerpResult131_g127444;
					float4 temp_output_3_0_g127443 = TVE_GlowParams;
					float4 ifLocalVar18_g127443 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127443 >= 0.5 )
					ifLocalVar18_g127443 = temp_output_17_0_g127443;
					else
					ifLocalVar18_g127443 = temp_output_3_0_g127443;
					float4 lerpResult22_g127443 = lerp( temp_output_3_0_g127443 , temp_output_17_0_g127443 , temp_output_19_0_g127443);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127443 = lerpResult22_g127443;
					#else
					float4 staticSwitch24_g127443 = ifLocalVar18_g127443;
					#endif
					float3 ifLocalVar40_g127513 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127513 = (staticSwitch24_g127443).rgb;
					float temp_output_82_0_g127504 = Debug_Layer885_g127014;
					float temp_output_19_0_g127506 = TVE_GlowLayers[(int)temp_output_82_0_g127504];
					half3 Input_Position180_g127507 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127507 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127507).xz ) );
					float temp_output_82_0_g127507 = temp_output_82_0_g127504;
					float2 temp_output_119_0_g127507 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127507).xz ) );
					float temp_output_7_0_g127512 = 1.0;
					float temp_output_9_0_g127512 = ( saturate( ( distance( Input_Position180_g127507 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127512 );
					float4 lerpResult131_g127507 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127507,temp_output_82_0_g127507), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127507,temp_output_82_0_g127507), 0.0 ) , saturate( ( temp_output_9_0_g127512 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127512 ) ) ));
					float4 temp_output_17_0_g127506 = lerpResult131_g127507;
					float4 temp_output_3_0_g127506 = TVE_GlowParams;
					float4 ifLocalVar18_g127506 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127506 >= 0.5 )
					ifLocalVar18_g127506 = temp_output_17_0_g127506;
					else
					ifLocalVar18_g127506 = temp_output_3_0_g127506;
					float4 lerpResult22_g127506 = lerp( temp_output_3_0_g127506 , temp_output_17_0_g127506 , temp_output_19_0_g127506);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127506 = lerpResult22_g127506;
					#else
					float4 staticSwitch24_g127506 = ifLocalVar18_g127506;
					#endif
					float ifLocalVar40_g127514 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127514 = saturate( (staticSwitch24_g127506).a );
					float temp_output_132_0_g127477 = Debug_Layer885_g127014;
					float temp_output_19_0_g127479 = TVE_AtmoLayers[(int)temp_output_132_0_g127477];
					half3 Input_Position180_g127480 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127480 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127480).xz ) );
					float temp_output_82_0_g127480 = temp_output_132_0_g127477;
					float2 temp_output_119_0_g127480 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127480).xz ) );
					float temp_output_7_0_g127485 = 1.0;
					float temp_output_9_0_g127485 = ( saturate( ( distance( Input_Position180_g127480 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127485 );
					float4 lerpResult131_g127480 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127480,temp_output_82_0_g127480), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127480,temp_output_82_0_g127480), 0.0 ) , saturate( ( temp_output_9_0_g127485 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127485 ) ) ));
					float4 temp_output_17_0_g127479 = lerpResult131_g127480;
					float4 temp_output_3_0_g127479 = TVE_AtmoParams;
					float4 ifLocalVar18_g127479 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127479 >= 0.5 )
					ifLocalVar18_g127479 = temp_output_17_0_g127479;
					else
					ifLocalVar18_g127479 = temp_output_3_0_g127479;
					float4 lerpResult22_g127479 = lerp( temp_output_3_0_g127479 , temp_output_17_0_g127479 , temp_output_19_0_g127479);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127479 = lerpResult22_g127479;
					#else
					float4 staticSwitch24_g127479 = ifLocalVar18_g127479;
					#endif
					float ifLocalVar40_g127515 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127515 = (staticSwitch24_g127479).r;
					float temp_output_132_0_g127450 = Debug_Layer885_g127014;
					float temp_output_19_0_g127452 = TVE_AtmoLayers[(int)temp_output_132_0_g127450];
					half3 Input_Position180_g127453 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127453 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127453).xz ) );
					float temp_output_82_0_g127453 = temp_output_132_0_g127450;
					float2 temp_output_119_0_g127453 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127453).xz ) );
					float temp_output_7_0_g127458 = 1.0;
					float temp_output_9_0_g127458 = ( saturate( ( distance( Input_Position180_g127453 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127458 );
					float4 lerpResult131_g127453 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127453,temp_output_82_0_g127453), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127453,temp_output_82_0_g127453), 0.0 ) , saturate( ( temp_output_9_0_g127458 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127458 ) ) ));
					float4 temp_output_17_0_g127452 = lerpResult131_g127453;
					float4 temp_output_3_0_g127452 = TVE_AtmoParams;
					float4 ifLocalVar18_g127452 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127452 >= 0.5 )
					ifLocalVar18_g127452 = temp_output_17_0_g127452;
					else
					ifLocalVar18_g127452 = temp_output_3_0_g127452;
					float4 lerpResult22_g127452 = lerp( temp_output_3_0_g127452 , temp_output_17_0_g127452 , temp_output_19_0_g127452);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127452 = lerpResult22_g127452;
					#else
					float4 staticSwitch24_g127452 = ifLocalVar18_g127452;
					#endif
					float ifLocalVar40_g127516 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127516 = (staticSwitch24_g127452).g;
					float temp_output_132_0_g127459 = Debug_Layer885_g127014;
					float temp_output_19_0_g127461 = TVE_AtmoLayers[(int)temp_output_132_0_g127459];
					half3 Input_Position180_g127462 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127462 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127462).xz ) );
					float temp_output_82_0_g127462 = temp_output_132_0_g127459;
					float2 temp_output_119_0_g127462 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127462).xz ) );
					float temp_output_7_0_g127467 = 1.0;
					float temp_output_9_0_g127467 = ( saturate( ( distance( Input_Position180_g127462 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127467 );
					float4 lerpResult131_g127462 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127462,temp_output_82_0_g127462), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127462,temp_output_82_0_g127462), 0.0 ) , saturate( ( temp_output_9_0_g127467 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127467 ) ) ));
					float4 temp_output_17_0_g127461 = lerpResult131_g127462;
					float4 temp_output_3_0_g127461 = TVE_AtmoParams;
					float4 ifLocalVar18_g127461 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127461 >= 0.5 )
					ifLocalVar18_g127461 = temp_output_17_0_g127461;
					else
					ifLocalVar18_g127461 = temp_output_3_0_g127461;
					float4 lerpResult22_g127461 = lerp( temp_output_3_0_g127461 , temp_output_17_0_g127461 , temp_output_19_0_g127461);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127461 = lerpResult22_g127461;
					#else
					float4 staticSwitch24_g127461 = ifLocalVar18_g127461;
					#endif
					float ifLocalVar40_g127517 = 0;
					if( Debug_Index464_g127014 == 9.0 )
					ifLocalVar40_g127517 = (staticSwitch24_g127461).b;
					float temp_output_132_0_g127468 = Debug_Layer885_g127014;
					float temp_output_19_0_g127470 = TVE_AtmoLayers[(int)temp_output_132_0_g127468];
					half3 Input_Position180_g127471 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127471 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127471).xz ) );
					float temp_output_82_0_g127471 = temp_output_132_0_g127468;
					float2 temp_output_119_0_g127471 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127471).xz ) );
					float temp_output_7_0_g127476 = 1.0;
					float temp_output_9_0_g127476 = ( saturate( ( distance( Input_Position180_g127471 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127476 );
					float4 lerpResult131_g127471 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127471,temp_output_82_0_g127471), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127471,temp_output_82_0_g127471), 0.0 ) , saturate( ( temp_output_9_0_g127476 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127476 ) ) ));
					float4 temp_output_17_0_g127470 = lerpResult131_g127471;
					float4 temp_output_3_0_g127470 = TVE_AtmoParams;
					float4 ifLocalVar18_g127470 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127470 >= 0.5 )
					ifLocalVar18_g127470 = temp_output_17_0_g127470;
					else
					ifLocalVar18_g127470 = temp_output_3_0_g127470;
					float4 lerpResult22_g127470 = lerp( temp_output_3_0_g127470 , temp_output_17_0_g127470 , temp_output_19_0_g127470);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127470 = lerpResult22_g127470;
					#else
					float4 staticSwitch24_g127470 = ifLocalVar18_g127470;
					#endif
					float ifLocalVar40_g127518 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127518 = saturate( (staticSwitch24_g127470).a );
					float temp_output_130_0_g127495 = Debug_Layer885_g127014;
					float temp_output_19_0_g127497 = TVE_FormLayers[(int)temp_output_130_0_g127495];
					half3 Input_Position180_g127498 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127498 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127498).xz ) );
					float temp_output_82_0_g127498 = temp_output_130_0_g127495;
					float2 temp_output_119_0_g127498 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127498).xz ) );
					float temp_output_7_0_g127503 = 1.0;
					float temp_output_9_0_g127503 = ( saturate( ( distance( Input_Position180_g127498 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127503 );
					float4 lerpResult131_g127498 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127498,temp_output_82_0_g127498), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127498,temp_output_82_0_g127498), 0.0 ) , saturate( ( temp_output_9_0_g127503 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127503 ) ) ));
					float4 temp_output_17_0_g127497 = lerpResult131_g127498;
					float4 temp_output_3_0_g127497 = TVE_FormParams;
					float4 ifLocalVar18_g127497 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127497 >= 0.5 )
					ifLocalVar18_g127497 = temp_output_17_0_g127497;
					else
					ifLocalVar18_g127497 = temp_output_3_0_g127497;
					float4 lerpResult22_g127497 = lerp( temp_output_3_0_g127497 , temp_output_17_0_g127497 , temp_output_19_0_g127497);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127497 = lerpResult22_g127497;
					#else
					float4 staticSwitch24_g127497 = ifLocalVar18_g127497;
					#endif
					float3 appendResult1013_g127014 = (float3((staticSwitch24_g127497).rg , 0.0));
					float3 ifLocalVar40_g127519 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127519 = appendResult1013_g127014;
					float temp_output_130_0_g127486 = Debug_Layer885_g127014;
					float temp_output_19_0_g127488 = TVE_FormLayers[(int)temp_output_130_0_g127486];
					half3 Input_Position180_g127489 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127489 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127489).xz ) );
					float temp_output_82_0_g127489 = temp_output_130_0_g127486;
					float2 temp_output_119_0_g127489 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127489).xz ) );
					float temp_output_7_0_g127494 = 1.0;
					float temp_output_9_0_g127494 = ( saturate( ( distance( Input_Position180_g127489 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127494 );
					float4 lerpResult131_g127489 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127489,temp_output_82_0_g127489), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127489,temp_output_82_0_g127489), 0.0 ) , saturate( ( temp_output_9_0_g127494 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127494 ) ) ));
					float4 temp_output_17_0_g127488 = lerpResult131_g127489;
					float4 temp_output_3_0_g127488 = TVE_FormParams;
					float4 ifLocalVar18_g127488 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127488 >= 0.5 )
					ifLocalVar18_g127488 = temp_output_17_0_g127488;
					else
					ifLocalVar18_g127488 = temp_output_3_0_g127488;
					float4 lerpResult22_g127488 = lerp( temp_output_3_0_g127488 , temp_output_17_0_g127488 , temp_output_19_0_g127488);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127488 = lerpResult22_g127488;
					#else
					float4 staticSwitch24_g127488 = ifLocalVar18_g127488;
					#endif
					float ifLocalVar40_g127520 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127520 = saturate( (staticSwitch24_g127488).b );
					float temp_output_130_0_g127543 = Debug_Layer885_g127014;
					float temp_output_19_0_g127545 = TVE_FormLayers[(int)temp_output_130_0_g127543];
					half3 Input_Position180_g127546 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127546 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127546).xz ) );
					float temp_output_82_0_g127546 = temp_output_130_0_g127543;
					float2 temp_output_119_0_g127546 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127546).xz ) );
					float temp_output_7_0_g127551 = 1.0;
					float temp_output_9_0_g127551 = ( saturate( ( distance( Input_Position180_g127546 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127551 );
					float4 lerpResult131_g127546 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127546,temp_output_82_0_g127546), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127546,temp_output_82_0_g127546), 0.0 ) , saturate( ( temp_output_9_0_g127551 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127551 ) ) ));
					float4 temp_output_17_0_g127545 = lerpResult131_g127546;
					float4 temp_output_3_0_g127545 = TVE_FormParams;
					float4 ifLocalVar18_g127545 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127545 >= 0.5 )
					ifLocalVar18_g127545 = temp_output_17_0_g127545;
					else
					ifLocalVar18_g127545 = temp_output_3_0_g127545;
					float4 lerpResult22_g127545 = lerp( temp_output_3_0_g127545 , temp_output_17_0_g127545 , temp_output_19_0_g127545);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127545 = lerpResult22_g127545;
					#else
					float4 staticSwitch24_g127545 = ifLocalVar18_g127545;
					#endif
					float ifLocalVar40_g127552 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127552 = saturate( (staticSwitch24_g127545).a );
					float temp_output_136_0_g127521 = Debug_Layer885_g127014;
					float temp_output_19_0_g127523 = TVE_FlowLayers[(int)temp_output_136_0_g127521];
					half3 Input_Position180_g127524 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127524 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127524).xz ) );
					float temp_output_82_0_g127524 = temp_output_136_0_g127521;
					float2 temp_output_119_0_g127524 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127524).xz ) );
					float temp_output_7_0_g127529 = 1.0;
					float temp_output_9_0_g127529 = ( saturate( ( distance( Input_Position180_g127524 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127529 );
					float4 lerpResult131_g127524 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127524,temp_output_82_0_g127524), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127524,temp_output_82_0_g127524), 0.0 ) , saturate( ( temp_output_9_0_g127529 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127529 ) ) ));
					float4 temp_output_17_0_g127523 = lerpResult131_g127524;
					float4 temp_output_3_0_g127523 = TVE_FlowParams;
					float4 ifLocalVar18_g127523 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127523 >= 0.5 )
					ifLocalVar18_g127523 = temp_output_17_0_g127523;
					else
					ifLocalVar18_g127523 = temp_output_3_0_g127523;
					float4 lerpResult22_g127523 = lerp( temp_output_3_0_g127523 , temp_output_17_0_g127523 , temp_output_19_0_g127523);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127523 = lerpResult22_g127523;
					#else
					float4 staticSwitch24_g127523 = ifLocalVar18_g127523;
					#endif
					float3 appendResult1012_g127014 = (float3((staticSwitch24_g127523).rg , 0.0));
					float3 ifLocalVar40_g127539 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127539 = appendResult1012_g127014;
					float temp_output_136_0_g127530 = Debug_Layer885_g127014;
					float temp_output_19_0_g127532 = TVE_FlowLayers[(int)temp_output_136_0_g127530];
					half3 Input_Position180_g127533 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127533 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127533).xz ) );
					float temp_output_82_0_g127533 = temp_output_136_0_g127530;
					float2 temp_output_119_0_g127533 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127533).xz ) );
					float temp_output_7_0_g127538 = 1.0;
					float temp_output_9_0_g127538 = ( saturate( ( distance( Input_Position180_g127533 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127538 );
					float4 lerpResult131_g127533 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127533,temp_output_82_0_g127533), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127533,temp_output_82_0_g127533), 0.0 ) , saturate( ( temp_output_9_0_g127538 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127538 ) ) ));
					float4 temp_output_17_0_g127532 = lerpResult131_g127533;
					float4 temp_output_3_0_g127532 = TVE_FlowParams;
					float4 ifLocalVar18_g127532 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127532 >= 0.5 )
					ifLocalVar18_g127532 = temp_output_17_0_g127532;
					else
					ifLocalVar18_g127532 = temp_output_3_0_g127532;
					float4 lerpResult22_g127532 = lerp( temp_output_3_0_g127532 , temp_output_17_0_g127532 , temp_output_19_0_g127532);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127532 = lerpResult22_g127532;
					#else
					float4 staticSwitch24_g127532 = ifLocalVar18_g127532;
					#endif
					float ifLocalVar40_g127540 = 0;
					if( Debug_Index464_g127014 == 15.0 )
					ifLocalVar40_g127540 = (staticSwitch24_g127532).b;
					float temp_output_136_0_g127555 = Debug_Layer885_g127014;
					float temp_output_19_0_g127556 = TVE_PushLayers[(int)temp_output_136_0_g127555];
					half3 Input_Position180_g127557 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127557 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127557).xz ) );
					float temp_output_82_0_g127557 = temp_output_136_0_g127555;
					float2 temp_output_119_0_g127557 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127557).xz ) );
					float temp_output_7_0_g127562 = 1.0;
					float temp_output_9_0_g127562 = ( saturate( ( distance( Input_Position180_g127557 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127562 );
					float4 lerpResult131_g127557 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127557,temp_output_82_0_g127557), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127557,temp_output_82_0_g127557), 0.0 ) , saturate( ( temp_output_9_0_g127562 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127562 ) ) ));
					float4 temp_output_17_0_g127556 = lerpResult131_g127557;
					float4 temp_output_3_0_g127556 = TVE_PushParams;
					float4 ifLocalVar18_g127556 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127556 >= 0.5 )
					ifLocalVar18_g127556 = temp_output_17_0_g127556;
					else
					ifLocalVar18_g127556 = temp_output_3_0_g127556;
					float4 lerpResult22_g127556 = lerp( temp_output_3_0_g127556 , temp_output_17_0_g127556 , temp_output_19_0_g127556);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127556 = lerpResult22_g127556;
					#else
					float4 staticSwitch24_g127556 = ifLocalVar18_g127556;
					#endif
					float3 appendResult1780_g127014 = (float3((staticSwitch24_g127556).rg , 0.0));
					float3 ifLocalVar40_g127541 = 0;
					if( Debug_Index464_g127014 == 16.0 )
					ifLocalVar40_g127541 = appendResult1780_g127014;
					float temp_output_136_0_g127564 = Debug_Layer885_g127014;
					float temp_output_19_0_g127565 = TVE_PushLayers[(int)temp_output_136_0_g127564];
					half3 Input_Position180_g127566 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127566 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127566).xz ) );
					float temp_output_82_0_g127566 = temp_output_136_0_g127564;
					float2 temp_output_119_0_g127566 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127566).xz ) );
					float temp_output_7_0_g127571 = 1.0;
					float temp_output_9_0_g127571 = ( saturate( ( distance( Input_Position180_g127566 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127571 );
					float4 lerpResult131_g127566 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127566,temp_output_82_0_g127566), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127566,temp_output_82_0_g127566), 0.0 ) , saturate( ( temp_output_9_0_g127571 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127571 ) ) ));
					float4 temp_output_17_0_g127565 = lerpResult131_g127566;
					float4 temp_output_3_0_g127565 = TVE_PushParams;
					float4 ifLocalVar18_g127565 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127565 >= 0.5 )
					ifLocalVar18_g127565 = temp_output_17_0_g127565;
					else
					ifLocalVar18_g127565 = temp_output_3_0_g127565;
					float4 lerpResult22_g127565 = lerp( temp_output_3_0_g127565 , temp_output_17_0_g127565 , temp_output_19_0_g127565);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127565 = lerpResult22_g127565;
					#else
					float4 staticSwitch24_g127565 = ifLocalVar18_g127565;
					#endif
					float ifLocalVar40_g127542 = 0;
					if( Debug_Index464_g127014 == 17.0 )
					ifLocalVar40_g127542 = (staticSwitch24_g127565).b;
					float temp_output_136_0_g127573 = Debug_Layer885_g127014;
					float temp_output_19_0_g127574 = TVE_PushLayers[(int)temp_output_136_0_g127573];
					half3 Input_Position180_g127575 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127575 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127575).xz ) );
					float temp_output_82_0_g127575 = temp_output_136_0_g127573;
					float2 temp_output_119_0_g127575 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127575).xz ) );
					float temp_output_7_0_g127580 = 1.0;
					float temp_output_9_0_g127580 = ( saturate( ( distance( Input_Position180_g127575 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127580 );
					float4 lerpResult131_g127575 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127575,temp_output_82_0_g127575), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127575,temp_output_82_0_g127575), 0.0 ) , saturate( ( temp_output_9_0_g127580 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127580 ) ) ));
					float4 temp_output_17_0_g127574 = lerpResult131_g127575;
					float4 temp_output_3_0_g127574 = TVE_PushParams;
					float4 ifLocalVar18_g127574 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127574 >= 0.5 )
					ifLocalVar18_g127574 = temp_output_17_0_g127574;
					else
					ifLocalVar18_g127574 = temp_output_3_0_g127574;
					float4 lerpResult22_g127574 = lerp( temp_output_3_0_g127574 , temp_output_17_0_g127574 , temp_output_19_0_g127574);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127574 = lerpResult22_g127574;
					#else
					float4 staticSwitch24_g127574 = ifLocalVar18_g127574;
					#endif
					float ifLocalVar40_g127553 = 0;
					if( Debug_Index464_g127014 == 18.0 )
					ifLocalVar40_g127553 = saturate( (staticSwitch24_g127574).a );
					float temp_output_7_0_g127554 = Debug_Min721_g127014;
					float3 temp_cast_59 = (temp_output_7_0_g127554).xxx;
					float3 temp_output_9_0_g127554 = ( ( ifLocalVar40_g127582 + ( ifLocalVar40_g127419 + ifLocalVar40_g127420 ) + ( ifLocalVar40_g127439 + ifLocalVar40_g127440 ) + ( ifLocalVar40_g127513 + ifLocalVar40_g127514 ) + ( ifLocalVar40_g127515 + ifLocalVar40_g127516 + ifLocalVar40_g127517 + ifLocalVar40_g127518 ) + ( ifLocalVar40_g127519 + ifLocalVar40_g127520 + ifLocalVar40_g127552 ) + ( ifLocalVar40_g127539 + ifLocalVar40_g127540 + ifLocalVar40_g127541 + ifLocalVar40_g127542 + ifLocalVar40_g127553 ) ) - temp_cast_59 );
					float4 appendResult1659_g127014 = (float4(saturate( ( ( temp_output_9_0_g127554 / ( Debug_Max723_g127014 - temp_output_7_0_g127554 ) ) + 0.0001 ) ) , 1.0));
					float4 Output_Globals888_g127014 = appendResult1659_g127014;
					float4 ifLocalVar40_g127084 = 0;
					if( Debug_Type367_g127014 == 9.0 )
					ifLocalVar40_g127084 = Output_Globals888_g127014;
					float3 vertexToFrag328_g127014 = IN.ase_texcoord9.xyz;
					float4 color1016_g127014 = IsGammaSpace() ? float4( 0.5831653, 0.6037736, 0.2135992, 0 ) : float4( 0.2992498, 0.3229691, 0.03750122, 0 );
					float4 color1017_g127014 = IsGammaSpace() ? float4( 0.8117647, 0.3488252, 0.2627451, 0 ) : float4( 0.6239604, 0.0997834, 0.05612849, 0 );
					float4 switchResult1015_g127014 = (((ase_vface>0)?(color1016_g127014):(color1017_g127014)));
					float3 ifLocalVar40_g127018 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127018 = (switchResult1015_g127014).rgb;
					float temp_output_7_0_g127074 = Debug_Min721_g127014;
					float3 temp_cast_60 = (temp_output_7_0_g127074).xxx;
					float3 temp_output_9_0_g127074 = ( ( vertexToFrag328_g127014 + ifLocalVar40_g127018 ) - temp_cast_60 );
					float4 appendResult1658_g127014 = (float4(saturate( ( ( temp_output_9_0_g127074 / ( Debug_Max723_g127014 - temp_output_7_0_g127074 ) ) + 0.0001 ) ) , 1.0));
					float4 Output_Mesh316_g127014 = appendResult1658_g127014;
					float4 ifLocalVar40_g127086 = 0;
					if( Debug_Type367_g127014 == 11.0 )
					ifLocalVar40_g127086 = Output_Mesh316_g127014;
					float _IsTVEShader647_g127014 = _IsTVEShader;
					float Debug_Filter322_g127014 = TVE_DEBUG_Filter;
					float lerpResult1524_g127014 = lerp( 1.0 , _IsTVEShader647_g127014 , Debug_Filter322_g127014);
					float4 lerpResult1517_g127014 = lerp( Shading_Inactive1492_g127014 , ( ( ifLocalVar40_g127075 + ifLocalVar40_g127077 + ifLocalVar40_g127078 + ifLocalVar40_g127079 + ifLocalVar40_g127080 ) + ( ifLocalVar40_g127081 + ifLocalVar40_g127082 + ifLocalVar40_g127083 ) + ( ifLocalVar40_g127084 + ifLocalVar40_g127086 ) ) , lerpResult1524_g127014);
					float dotResult1472_g127014 = dot( WorldNormal , worldViewDir );
					float temp_output_1526_0_g127014 = ( 1.0 - saturate( dotResult1472_g127014 ) );
					float Shading_Fresnel1469_g127014 = (( 1.0 - ( temp_output_1526_0_g127014 * temp_output_1526_0_g127014 ) )*0.3 + 0.7);
					float Debug_Shading1653_g127014 = TVE_DEBUG_Shading;
					float lerpResult1655_g127014 = lerp( 1.0 , Shading_Fresnel1469_g127014 , Debug_Shading1653_g127014);
					float Debug_Clip623_g127014 = TVE_DEBUG_Clip;
					float lerpResult622_g127014 = lerp( 1.0 , SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g127014 * _RenderClip ));
					clip( lerpResult622_g127014 - _MainAlphaClipValue);
					clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
					

					o.Albedo = temp_cast_0;
					o.Normal = half3( 0, 0, 1 );
					#if defined(ASE_LIGHTING_SIMPLE)
						o.Specular = 0;
						o.Gloss = 0;
					#else
						#if defined(_SPECULAR_SETUP)
							o.Specular = fixed3( 0, 0, 0 );
						#else
							o.Metallic = 0.0;
						#endif
						o.Occlusion = 1;
						o.Smoothness = 0.0;
					#endif
					o.Emission = ( lerpResult1517_g127014 * lerpResult1655_g127014 ).rgb;
					o.Alpha = 1;
					float3 Translucency = 1;

					#if defined( ASE_DEPTH_WRITE_ON )
						float DeviceDepth = IN.pos.z;
					#endif

					#ifdef _ALPHATEST_ON
						clip( o.Alpha - AlphaClipThreshold );
					#endif

					#if ( ASE_FRAGMENT_NORMAL == 0 )
						o.Normal = normalize(o.Normal.x * IN.worldTangent.xyz + o.Normal.y * IN.worldBitangent.xyz + o.Normal.z * IN.worldNormal.xyz);
					#elif ( ASE_FRAGMENT_NORMAL == 1 )
						o.Normal = UnityObjectToWorldNormal( o.Normal );
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						// @diogo: already in world-space; do nothing
					#endif

					#if defined( ASE_DEPTH_WRITE_ON )
						outputDepth = DeviceDepth;
					#endif

					#ifndef USING_DIRECTIONAL_LIGHT
						half3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
					#else
						half3 lightDir = _WorldSpaceLightPos0.xyz;
					#endif

					UnityGI gi;
					UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
					gi.indirect.diffuse = 0;
					gi.indirect.specular = 0;
					gi.light.color = _LightColor0.rgb;
					gi.light.dir = lightDir;
					gi.light.color *= atten;

					half4 c = 0;
					#if defined(ASE_LIGHTING_SIMPLE)
						#if defined(_SPECULAR_SETUP)
							c += LightingBlinnPhong (o, worldViewDir, gi);
						#else
							c += LightingLambert( o, gi );
						#endif
					#else
						#if defined(_SPECULAR_SETUP)
							c += LightingStandardSpecular (o, worldViewDir, gi);
						#else
							c += LightingStandard( o, worldViewDir, gi );
						#endif
					#endif

					#ifdef ASE_TRANSMISSION
					{
						float shadow = _TransmissionShadow;
						#ifdef DIRECTIONAL
							float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
						#else
							float3 lightAtten = gi.light.color;
						#endif
						half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
						c.rgb += o.Albedo * transmission;
					}
					#endif

					#ifdef ASE_TRANSLUCENCY
					{
						float shadow = _TransShadow;
						float normal = _TransNormal;
						float scattering = _TransScattering;
						float direct = _TransDirect;
						float ambient = _TransAmbient;
						float strength = _TransStrength;

						#ifdef DIRECTIONAL
							float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
						#else
							float3 lightAtten = gi.light.color;
						#endif
						half3 lightDir = gi.light.dir + o.Normal * normal;
						half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
						half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
						c.rgb += o.Albedo * translucency * strength;
					}
					#endif

					#ifdef ASE_FOG
						UNITY_APPLY_FOG(IN.fogCoord, c);
					#endif
					return c;
				}
			ENDCG
		}

		
		Pass
		{
			
			Name "Deferred"
			Tags { "LightMode"="Deferred" }

			AlphaToMask Off

			CGPROGRAM
				#define ASE_GEOMETRY 1
				#define ASE_FRAGMENT_NORMAL 0
				#define ASE_NEEDS_FRAG_SHADOWCOORDS
				#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
				#pragma multi_compile_instancing
				#pragma multi_compile __ LOD_FADE_CROSSFADE
				#pragma multi_compile_fog
				#define ASE_VERSION 19802
				#define ASE_USING_SAMPLING_MACROS 1

				#pragma vertex vert
				#pragma fragment frag
				#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
				#pragma multi_compile_prepassfinal
				#ifndef UNITY_PASS_DEFERRED
					#define UNITY_PASS_DEFERRED
				#endif
				#include "HLSLSupport.cginc"
				#ifdef ASE_GEOMETRY
					#ifndef UNITY_INSTANCED_LOD_FADE
						#define UNITY_INSTANCED_LOD_FADE
					#endif
					#ifndef UNITY_INSTANCED_SH
						#define UNITY_INSTANCED_SH
					#endif
					#ifndef UNITY_INSTANCED_LIGHTMAPSTS
						#define UNITY_INSTANCED_LIGHTMAPSTS
					#endif
				#endif
				#include "UnityShaderVariables.cginc"
				#include "UnityCG.cginc"
				#include "Lighting.cginc"
				#include "UnityPBSLighting.cginc"

				#define ASE_NEEDS_TEXTURE_COORDINATES0
				#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
				#define ASE_NEEDS_TEXTURE_COORDINATES1
				#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
				#define ASE_NEEDS_WORLD_POSITION
				#define ASE_NEEDS_FRAG_WORLD_POSITION
				#define ASE_NEEDS_VERT_POSITION
				#define ASE_NEEDS_VERT_NORMAL
				#define ASE_NEEDS_VERT_TANGENT
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
				#define ASE_NEEDS_TEXTURE_COORDINATES3
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
				#define ASE_NEEDS_WORLD_NORMAL
				#define ASE_NEEDS_FRAG_WORLD_NORMAL
				#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
				#pragma shader_feature_local TVE_LEGACY
				#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
				#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
				#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
				#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
				#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
				#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
				#else//ASE Sampling Macros
				#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
				#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
				#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
				#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
				#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
				#endif//ASE Sampling Macros
				


				struct appdata
				{
					float4 vertex : POSITION;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					float4 ase_texcoord : TEXCOORD0;
					float4 ase_color : COLOR;
					float4 ase_texcoord3 : TEXCOORD3;
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					UNITY_POSITION( pos );
					UNITY_FOG_COORDS( 0 )
					float4 ambientOrLightmapUV : TEXCOORD1;
					float4 worldNormal : TEXCOORD2;
					float4 worldTangent : TEXCOORD3;
					float4 worldBitangent : TEXCOORD4;
					#if defined( ASE_NEEDS_FRAG_SCREEN_POSITION )
						float4 screenPos : TEXCOORD5;
					#endif
					float4 ase_texcoord6 : TEXCOORD6;
					float4 ase_texcoord7 : TEXCOORD7;
					float4 ase_texcoord8 : TEXCOORD8;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				#ifdef LIGHTMAP_ON
				float4 unity_LightmapFade;
				#endif
				half4 unity_Ambient;
				#ifdef ASE_TESSELLATION
					float _TessPhongStrength;
					float _TessValue;
					float _TessMin;
					float _TessMax;
					float _TessEdgeLength;
					float _TessMaxDisp;
				#endif

				uniform half TVE_DEBUG_Layer;
				uniform half TVE_DEBUG_Index;
				uniform half TVE_DEBUG_Type;
				uniform half TVE_DEBUG_Min;
				uniform half TVE_DEBUG_Clip;
				uniform half TVE_DEBUG_Max;
				uniform half TVE_DEBUG_Filter;
				uniform half TVE_DEBUG_Shading;
				uniform half _Banner;
				uniform half _Message;
				uniform float _IsSimpleShader;
				uniform float _IsVertexShader;
				uniform half _IsTVEShader;
				uniform float _IsCoreShader;
				uniform float _IsBlanketShader;
				uniform float _IsImpostorShader;
				uniform float _IsPolygonalShader;
				uniform float _IsLiteShader;
				uniform float _IsStandardShader;
				uniform float _IsSubsurfaceShader;
				uniform float _IsCustomShader;
				uniform float _IsIdentifier;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
				uniform half4 _main_coord_value;
				SamplerState sampler_MainAlbedoTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
				SamplerState sampler_MainNormalTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
				SamplerState sampler_MainMaskTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
				uniform half _DetailCoordMode;
				uniform half4 _SecondUVs;
				SamplerState sampler_SecondAlbedoTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
				SamplerState sampler_SecondNormalTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
				SamplerState sampler_SecondMaskTex;
				uniform float _DetailMode;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
				uniform half4 _EmissiveUVs;
				SamplerState sampler_EmissiveTex;
				uniform float4 _EmissiveColor;
				uniform float _EmissiveCat;
				float4 _MainAlbedoTex_TexelSize;
				float4 _MainNormalTex_TexelSize;
				float4 _MainMaskTex_TexelSize;
				float4 _SecondAlbedoTex_TexelSize;
				float4 _SecondMaskTex_TexelSize;
				float4 _EmissiveTex_TexelSize;
				uniform float4 _MainAlbedoTex_ST;
				UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_DEBUG_MipTex);
				SamplerState samplerTVE_DEBUG_MipTex;
				uniform float4 _MainNormalTex_ST;
				uniform float4 _MainMaskTex_ST;
				uniform float4 _SecondAlbedoTex_ST;
				uniform float4 _SecondMaskTex_ST;
				uniform float4 _EmissiveTex_ST;
				uniform float TVE_CoatLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatBaseTex);
				uniform half4 TVE_RenderBaseCoords;
				SamplerState sampler_Linear_Clamp;
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatNearTex);
				uniform half4 TVE_RenderNearCoords;
				SamplerState sampler_Linear_Repeat;
				uniform float4 TVE_RenderNearPositionR;
				uniform half TVE_RenderNearFadeValue;
				uniform half4 TVE_CoatParams;
				uniform float TVE_PaintLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintNearTex);
				uniform half4 TVE_PaintParams;
				uniform float TVE_GlowLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowNearTex);
				uniform half4 TVE_GlowParams;
				uniform float TVE_AtmoLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoNearTex);
				uniform half4 TVE_AtmoParams;
				uniform float TVE_FormLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormNearTex);
				uniform half4 TVE_FormParams;
				uniform float TVE_FlowLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowNearTex);
				uniform half4 TVE_FlowParams;
				uniform float TVE_PushLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushNearTex);
				uniform half4 TVE_PushParams;
				uniform half4 _object_phase_mode;
				uniform half4 _motion_base_vert_mode;
				uniform half _ObjectHeightValue;
				uniform half4 _motion_base_proc_mode;
				uniform half _ObjectRadiusValue;
				uniform half _motion_base_mask_mode;
				uniform half4 _MotionBaseMaskRemap;
				uniform half _MotionBaseMaskMode;
				uniform half4 _motion_small_vert_mode;
				uniform half4 _motion_small_proc_mode;
				uniform half _motion_small_mask_mode;
				uniform half4 _MotionSmallMaskRemap;
				uniform half _MotionSmallMaskMode;
				uniform half4 _motion_tiny_vert_mode;
				uniform half4 _motion_tiny_proc_mode;
				uniform half _motion_tiny_mask_mode;
				uniform half4 _MotionTinyMaskRemap;
				uniform half _MotionTinyMaskMode;
				uniform float _RenderClip;
				uniform float _MainAlphaClipValue;
				uniform float _IsElementShader;
				uniform float _IsHelperShader;


				float3 HSVToRGB( float3 c )
				{
					float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
					float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
					return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
				}
				
				float2 DecodeFloatToVector2( float enc )
				{
					float2 result ;
					result.y = enc % 2048;
					result.x = floor(enc / 2048);
					return result / (2048 - 1);
				}
				

				v2f VertexFunction (appdata v  ) {
					UNITY_SETUP_INSTANCE_ID(v);
					v2f o;
					UNITY_INITIALIZE_OUTPUT(v2f,o);
					UNITY_TRANSFER_INSTANCE_ID(v,o);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

					float Debug_Index464_g127014 = TVE_DEBUG_Index;
					float3 ifLocalVar40_g127015 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127015 = saturate( v.vertex.xyz );
					float3 ifLocalVar40_g127022 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127022 = v.normal;
					float3 ifLocalVar40_g127028 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127028 = v.tangent.xyz;
					float ifLocalVar40_g127020 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127020 = saturate( v.tangent.w );
					float ifLocalVar40_g127064 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127064 = v.ase_color.r;
					float ifLocalVar40_g127065 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127065 = v.ase_color.g;
					float ifLocalVar40_g127066 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127066 = v.ase_color.b;
					float ifLocalVar40_g127067 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127067 = v.ase_color.a;
					float3 appendResult1147_g127014 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
					float3 ifLocalVar40_g127068 = 0;
					if( Debug_Index464_g127014 == 9.0 )
					ifLocalVar40_g127068 = appendResult1147_g127014;
					float3 appendResult1148_g127014 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
					float3 ifLocalVar40_g127069 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127069 = appendResult1148_g127014;
					float3 appendResult1149_g127014 = (float3(v.texcoord2.xyzw.x , v.texcoord2.xyzw.y , 0.0));
					float3 ifLocalVar40_g127089 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127089 = appendResult1149_g127014;
					float4 break33_g127087 = _object_phase_mode;
					float temp_output_30_0_g127087 = ( v.ase_color.r * break33_g127087.x );
					float temp_output_29_0_g127087 = ( v.ase_color.g * break33_g127087.y );
					float temp_output_31_0_g127087 = ( v.ase_color.b * break33_g127087.z );
					float temp_output_28_0_g127087 = ( temp_output_30_0_g127087 + temp_output_29_0_g127087 + temp_output_31_0_g127087 + ( v.ase_color.a * break33_g127087.w ) );
					half Motion_PhaseMask1725_g127014 = temp_output_28_0_g127087;
					float3 hsvTorgb260_g127014 = HSVToRGB( float3(Motion_PhaseMask1725_g127014,1.0,1.0) );
					float3 gammaToLinear266_g127014 = GammaToLinearSpace( hsvTorgb260_g127014 );
					float3 ifLocalVar40_g127090 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127090 = gammaToLinear266_g127014;
					float4 break1821_g127014 = v.ase_color;
					float4 break33_g127586 = _motion_base_vert_mode;
					float temp_output_30_0_g127586 = ( break1821_g127014.r * break33_g127586.x );
					float temp_output_29_0_g127586 = ( break1821_g127014.g * break33_g127586.y );
					float temp_output_31_0_g127586 = ( break1821_g127014.b * break33_g127586.z );
					float temp_output_28_0_g127586 = ( temp_output_30_0_g127586 + temp_output_29_0_g127586 + temp_output_31_0_g127586 + ( break1821_g127014.a * break33_g127586.w ) );
					float temp_output_1824_0_g127014 = temp_output_28_0_g127586;
					half Bounds_Height1700_g127014 = _ObjectHeightValue;
					half Final_HeightMask1815_g127014 = saturate( ( v.vertex.xyz.y / Bounds_Height1700_g127014 ) );
					float4 break33_g127590 = _motion_base_proc_mode;
					float temp_output_30_0_g127590 = ( Final_HeightMask1815_g127014 * break33_g127590.x );
					half Bounds_Radius1702_g127014 = _ObjectRadiusValue;
					half Final_SphereMask1816_g127014 = saturate( ( length( v.vertex.xyz ) / ( Bounds_Height1700_g127014 * Bounds_Radius1702_g127014 ) ) );
					float temp_output_29_0_g127590 = ( Final_SphereMask1816_g127014 * break33_g127590.y );
					float temp_output_1834_0_g127014 = ( temp_output_30_0_g127590 + temp_output_29_0_g127590 );
					float lerpResult1887_g127014 = lerp( temp_output_1824_0_g127014 , temp_output_1834_0_g127014 , _motion_base_mask_mode);
					float clampResult17_g127583 = clamp( lerpResult1887_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127584 = _MotionBaseMaskRemap.x;
					float temp_output_9_0_g127584 = ( clampResult17_g127583 - temp_output_7_0_g127584 );
					float temp_output_6_0_g127585 = saturate( ( ( temp_output_9_0_g127584 / ( _MotionBaseMaskRemap.y - temp_output_7_0_g127584 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127585 = ( temp_output_6_0_g127585 + _MotionBaseMaskMode );
					#else
					float staticSwitch14_g127585 = temp_output_6_0_g127585;
					#endif
					half Motion_BaseMask1675_g127014 = staticSwitch14_g127585;
					float ifLocalVar40_g127091 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127091 = Motion_BaseMask1675_g127014;
					float4 break1855_g127014 = v.ase_color;
					float4 break33_g127587 = _motion_small_vert_mode;
					float temp_output_30_0_g127587 = ( break1855_g127014.r * break33_g127587.x );
					float temp_output_29_0_g127587 = ( break1855_g127014.g * break33_g127587.y );
					float temp_output_31_0_g127587 = ( break1855_g127014.b * break33_g127587.z );
					float temp_output_28_0_g127587 = ( temp_output_30_0_g127587 + temp_output_29_0_g127587 + temp_output_31_0_g127587 + ( break1855_g127014.a * break33_g127587.w ) );
					float temp_output_1845_0_g127014 = temp_output_28_0_g127587;
					float4 break33_g127591 = _motion_small_proc_mode;
					float temp_output_30_0_g127591 = ( Final_HeightMask1815_g127014 * break33_g127591.x );
					float temp_output_29_0_g127591 = ( Final_SphereMask1816_g127014 * break33_g127591.y );
					float temp_output_1849_0_g127014 = ( temp_output_30_0_g127591 + temp_output_29_0_g127591 );
					float lerpResult1889_g127014 = lerp( temp_output_1845_0_g127014 , temp_output_1849_0_g127014 , _motion_small_mask_mode);
					float enc1882_g127014 = v.ase_texcoord.z;
					float2 localDecodeFloatToVector21882_g127014 = DecodeFloatToVector2( enc1882_g127014 );
					float2 break1878_g127014 = localDecodeFloatToVector21882_g127014;
					half Small_Mask_Legacy1879_g127014 = break1878_g127014.x;
					#ifdef TVE_LEGACY
					float staticSwitch1883_g127014 = Small_Mask_Legacy1879_g127014;
					#else
					float staticSwitch1883_g127014 = lerpResult1889_g127014;
					#endif
					float clampResult17_g127593 = clamp( staticSwitch1883_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127594 = _MotionSmallMaskRemap.x;
					float temp_output_9_0_g127594 = ( clampResult17_g127593 - temp_output_7_0_g127594 );
					float temp_output_6_0_g127595 = saturate( ( ( temp_output_9_0_g127594 / ( _MotionSmallMaskRemap.y - temp_output_7_0_g127594 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127595 = ( temp_output_6_0_g127595 + _MotionSmallMaskMode );
					#else
					float staticSwitch14_g127595 = temp_output_6_0_g127595;
					#endif
					half Motion_SmallMask1693_g127014 = staticSwitch14_g127595;
					float ifLocalVar40_g127092 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127092 = Motion_SmallMask1693_g127014;
					float4 break1867_g127014 = v.ase_color;
					float4 break33_g127588 = _motion_tiny_vert_mode;
					float temp_output_30_0_g127588 = ( break1867_g127014.r * break33_g127588.x );
					float temp_output_29_0_g127588 = ( break1867_g127014.g * break33_g127588.y );
					float temp_output_31_0_g127588 = ( break1867_g127014.b * break33_g127588.z );
					float temp_output_28_0_g127588 = ( temp_output_30_0_g127588 + temp_output_29_0_g127588 + temp_output_31_0_g127588 + ( break1867_g127014.a * break33_g127588.w ) );
					float temp_output_1860_0_g127014 = temp_output_28_0_g127588;
					float4 break33_g127592 = _motion_tiny_proc_mode;
					float temp_output_30_0_g127592 = ( Final_HeightMask1815_g127014 * break33_g127592.x );
					float temp_output_29_0_g127592 = ( Final_SphereMask1816_g127014 * break33_g127592.y );
					float temp_output_1864_0_g127014 = ( temp_output_30_0_g127592 + temp_output_29_0_g127592 );
					float lerpResult1891_g127014 = lerp( temp_output_1860_0_g127014 , temp_output_1864_0_g127014 , _motion_tiny_mask_mode);
					half Tiny_Mask_Legacy1880_g127014 = break1878_g127014.y;
					#ifdef TVE_LEGACY
					float staticSwitch1886_g127014 = Tiny_Mask_Legacy1880_g127014;
					#else
					float staticSwitch1886_g127014 = lerpResult1891_g127014;
					#endif
					float clampResult17_g127596 = clamp( staticSwitch1886_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127597 = _MotionTinyMaskRemap.x;
					float temp_output_9_0_g127597 = ( clampResult17_g127596 - temp_output_7_0_g127597 );
					float temp_output_6_0_g127598 = saturate( ( ( temp_output_9_0_g127597 / ( _MotionTinyMaskRemap.y - temp_output_7_0_g127597 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127598 = ( temp_output_6_0_g127598 + _MotionTinyMaskMode );
					#else
					float staticSwitch14_g127598 = temp_output_6_0_g127598;
					#endif
					half Motion_TinyMask1717_g127014 = staticSwitch14_g127598;
					float ifLocalVar40_g127093 = 0;
					if( Debug_Index464_g127014 == 15.0 )
					ifLocalVar40_g127093 = Motion_TinyMask1717_g127014;
					float3 appendResult60_g127088 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
					float3 ifLocalVar40_g127094 = 0;
					if( Debug_Index464_g127014 == 16.0 )
					ifLocalVar40_g127094 = appendResult60_g127088;
					float3 vertexToFrag328_g127014 = ( ( ifLocalVar40_g127015 + ifLocalVar40_g127022 + ifLocalVar40_g127028 + ifLocalVar40_g127020 ) + ( ifLocalVar40_g127064 + ifLocalVar40_g127065 + ifLocalVar40_g127066 + ifLocalVar40_g127067 ) + ( ifLocalVar40_g127068 + ifLocalVar40_g127069 + ifLocalVar40_g127089 ) + ( ifLocalVar40_g127090 + ifLocalVar40_g127091 + ifLocalVar40_g127092 + ifLocalVar40_g127093 + ifLocalVar40_g127094 ) );
					o.ase_texcoord8.xyz = vertexToFrag328_g127014;
					
					o.ase_texcoord6 = v.ase_texcoord;
					o.ase_texcoord7 = v.texcoord1.xyzw;
					
					//setting value to unused interpolator channels and avoid initialization warnings
					o.ase_texcoord8.w = 0;

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = defaultVertexValue;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = v.normal;
					v.tangent = v.tangent;

					float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
					half3 worldNormal = UnityObjectToWorldNormal( v.normal );
					half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
					half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
					half3 worldBitangent = cross( worldNormal, worldTangent ) * tangentSign;

					o.pos = UnityObjectToClipPos( v.vertex );
					o.worldNormal = float4( worldNormal, worldPos.x );
					o.worldTangent = float4( worldTangent, worldPos.y );
					o.worldBitangent = float4( worldBitangent, worldPos.z );

					o.ambientOrLightmapUV = 0;
					#ifdef LIGHTMAP_ON
						o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					#elif UNITY_SHOULD_SAMPLE_SH
						#ifdef VERTEXLIGHT_ON
							o.ambientOrLightmapUV.rgb += Shade4PointLights(
								unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
								unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
								unity_4LightAtten0, worldPos, worldNormal );
						#endif
						o.ambientOrLightmapUV.rgb = ShadeSHPerVertex( worldNormal, o.ambientOrLightmapUV.rgb );
					#endif
					#ifdef DYNAMICLIGHTMAP_ON
						o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					#endif
					return o;
				}

				#if defined(ASE_TESSELLATION)
				struct VertexControl
				{
					float4 vertex : INTERNALTESSPOS;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					float4 ase_texcoord : TEXCOORD0;
					float4 ase_color : COLOR;
					float4 ase_texcoord3 : TEXCOORD3;

					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct TessellationFactors
				{
					float edge[3] : SV_TessFactor;
					float inside : SV_InsideTessFactor;
				};

				VertexControl vert ( appdata v )
				{
					VertexControl o;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_TRANSFER_INSTANCE_ID(v, o);
					o.vertex = v.vertex;
					o.tangent = v.tangent;
					o.normal = v.normal;
					o.texcoord1 = v.texcoord1;
					o.texcoord2 = v.texcoord2;
					o.ase_texcoord = v.ase_texcoord;
					o.ase_color = v.ase_color;
					o.ase_texcoord3 = v.ase_texcoord3;
					return o;
				}

				TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
				{
					TessellationFactors o;
					float4 tf = 1;
					float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
					float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
					#if defined(ASE_FIXED_TESSELLATION)
					tf = FixedTess( tessValue );
					#elif defined(ASE_DISTANCE_TESSELLATION)
					tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
					#elif defined(ASE_LENGTH_TESSELLATION)
					tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
					#elif defined(ASE_LENGTH_CULL_TESSELLATION)
					tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
					#endif
					o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
					return o;
				}

				[domain("tri")]
				[partitioning("fractional_odd")]
				[outputtopology("triangle_cw")]
				[patchconstantfunc("TessellationFunction")]
				[outputcontrolpoints(3)]
				VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
				{
				   return patch[id];
				}

				[domain("tri")]
				v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
				{
					appdata o = (appdata) 0;
					o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
					o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
					o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
					o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
					o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
					o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
					o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
					o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
					#if defined(ASE_PHONG_TESSELLATION)
					float3 pp[3];
					for (int i = 0; i < 3; ++i)
						pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
					float phongStrength = _TessPhongStrength;
					o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
					#endif
					UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
					return VertexFunction(o);
				}
				#else
				v2f vert ( appdata v )
				{
					return VertexFunction( v );
				}
				#endif

				void frag (v2f IN , bool ase_vface : SV_IsFrontFace
					, out half4 outGBuffer0 : SV_Target0
					, out half4 outGBuffer1 : SV_Target1
					, out half4 outGBuffer2 : SV_Target2
					, out half4 outEmission : SV_Target3
					#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
					, out half4 outShadowMask : SV_Target4
					#endif
					#if defined( ASE_DEPTH_WRITE_ON )
					, out float outputDepth : SV_Depth
					#endif
				)
				{
					UNITY_SETUP_INSTANCE_ID(IN);

					#ifdef LOD_FADE_CROSSFADE
						UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
					#endif

					#if defined(ASE_LIGHTING_SIMPLE)
						SurfaceOutput o = (SurfaceOutput)0;
					#else
						#if defined(_SPECULAR_SETUP)
							SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
						#else
							SurfaceOutputStandard o = (SurfaceOutputStandard)0;
						#endif
					#endif

					float3 WorldNormal = IN.worldNormal;
					float3 WorldTangent = IN.worldTangent;
					float3 WorldBiTangent = IN.worldBitangent;
					float3 worldPos = float3(IN.worldNormal.w,IN.worldTangent.w,IN.worldBitangent.w);
					float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
					half atten = 1;

					float3 temp_cast_0 = (0.0).xxx;
					
					float4 color690_g127014 = IsGammaSpace() ? float4( 0.1, 0.1, 0.1, 0 ) : float4( 0.01002283, 0.01002283, 0.01002283, 0 );
					float4 Shading_Inactive1492_g127014 = color690_g127014;
					float Debug_Type367_g127014 = TVE_DEBUG_Type;
					float4 color646_g127014 = IsGammaSpace() ? float4( 0.9245283, 0.7969696, 0.4142933, 1 ) : float4( 0.8368256, 0.5987038, 0.1431069, 1 );
					float4 Output_Converted717_g127014 = color646_g127014;
					float4 ifLocalVar40_g127075 = 0;
					if( Debug_Type367_g127014 == 0.0 )
					ifLocalVar40_g127075 = Output_Converted717_g127014;
					float4 color1529_g127014 = IsGammaSpace() ? float4( 0.9254902, 0.7960784, 0.4156863, 1 ) : float4( 0.8387991, 0.5972018, 0.1441285, 1 );
					float _IsCoreShader1551_g127014 = _IsCoreShader;
					float4 color1539_g127014 = IsGammaSpace() ? float4( 0.6196079, 0.7686275, 0.1490196, 0 ) : float4( 0.3419145, 0.5520116, 0.01938236, 0 );
					float _IsBlanketShader1554_g127014 = _IsBlanketShader;
					float4 color1542_g127014 = IsGammaSpace() ? float4( 0.9716981, 0.3162602, 0.4816265, 0 ) : float4( 0.9368213, 0.08154967, 0.1974273, 0 );
					float _IsImpostorShader1110_g127014 = _IsImpostorShader;
					float4 color1544_g127014 = IsGammaSpace() ? float4( 0.3254902, 0.6117647, 0.8117647, 0 ) : float4( 0.08650047, 0.3324516, 0.6239604, 0 );
					float _IsPolygonalShader1112_g127014 = _IsPolygonalShader;
					float4 color1649_g127014 = IsGammaSpace() ? float4( 0.6, 0.6, 0.6, 0 ) : float4( 0.3185468, 0.3185468, 0.3185468, 0 );
					float _IsLiteShader1648_g127014 = _IsLiteShader;
					float4 Output_Scope1531_g127014 = ( ( color1529_g127014 * _IsCoreShader1551_g127014 ) + ( color1539_g127014 * _IsBlanketShader1554_g127014 ) + ( color1542_g127014 * _IsImpostorShader1110_g127014 ) + ( color1544_g127014 * _IsPolygonalShader1112_g127014 ) + ( color1649_g127014 * _IsLiteShader1648_g127014 ) );
					float4 ifLocalVar40_g127077 = 0;
					if( Debug_Type367_g127014 == 2.0 )
					ifLocalVar40_g127077 = Output_Scope1531_g127014;
					float4 color529_g127014 = IsGammaSpace() ? float4( 0.62, 0.77, 0.15, 0 ) : float4( 0.3423916, 0.5542217, 0.01960665, 0 );
					float _IsVertexShader1158_g127014 = _IsVertexShader;
					float4 color544_g127014 = IsGammaSpace() ? float4( 0.3252937, 0.6122813, 0.8113208, 0 ) : float4( 0.08639329, 0.3330702, 0.6231937, 0 );
					float _IsSimpleShader359_g127014 = _IsSimpleShader;
					float4 color521_g127014 = IsGammaSpace() ? float4( 0.6566009, 0.3404236, 0.8490566, 0 ) : float4( 0.3886527, 0.09487338, 0.6903409, 0 );
					float _IsStandardShader344_g127014 = _IsStandardShader;
					float4 color1121_g127014 = IsGammaSpace() ? float4( 0.9716981, 0.88463, 0.1787558, 0 ) : float4( 0.9368213, 0.7573396, 0.02686729, 0 );
					float _IsSubsurfaceShader548_g127014 = _IsSubsurfaceShader;
					float4 Output_Lighting525_g127014 = ( ( color529_g127014 * _IsVertexShader1158_g127014 ) + ( color544_g127014 * _IsSimpleShader359_g127014 ) + ( color521_g127014 * _IsStandardShader344_g127014 ) + ( color1121_g127014 * _IsSubsurfaceShader548_g127014 ) );
					float4 ifLocalVar40_g127078 = 0;
					if( Debug_Type367_g127014 == 3.0 )
					ifLocalVar40_g127078 = Output_Lighting525_g127014;
					float4 color1559_g127014 = IsGammaSpace() ? float4( 0.9245283, 0.7969696, 0.4142933, 1 ) : float4( 0.8368256, 0.5987038, 0.1431069, 1 );
					float4 color1563_g127014 = IsGammaSpace() ? float4( 0.3053578, 0.8867924, 0.5362216, 0 ) : float4( 0.0759199, 0.7615293, 0.2491121, 0 );
					float _IsCustomShader1570_g127014 = _IsCustomShader;
					float4 lerpResult1561_g127014 = lerp( color1559_g127014 , color1563_g127014 , _IsCustomShader1570_g127014);
					float4 Output_Custom1560_g127014 = lerpResult1561_g127014;
					float4 ifLocalVar40_g127079 = 0;
					if( Debug_Type367_g127014 == 4.0 )
					ifLocalVar40_g127079 = Output_Custom1560_g127014;
					float3 hsvTorgb1452_g127014 = HSVToRGB( float3(( _IsIdentifier / 1000.0 ),1.0,1.0) );
					float3 gammaToLinear1453_g127014 = GammaToLinearSpace( hsvTorgb1452_g127014 );
					float4 appendResult1657_g127014 = (float4(gammaToLinear1453_g127014 , 1.0));
					float4 Output_Sharing1355_g127014 = appendResult1657_g127014;
					float4 ifLocalVar40_g127080 = 0;
					if( Debug_Type367_g127014 == 5.0 )
					ifLocalVar40_g127080 = Output_Sharing1355_g127014;
					float Debug_Index464_g127014 = TVE_DEBUG_Index;
					half2 Main_UVs1219_g127014 = ( ( IN.ase_texcoord6.xy * (_main_coord_value).xy ) + (_main_coord_value).zw );
					float4 tex2DNode586_g127014 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 );
					float3 appendResult637_g127014 = (float3(tex2DNode586_g127014.r , tex2DNode586_g127014.g , tex2DNode586_g127014.b));
					float3 ifLocalVar40_g127021 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127021 = appendResult637_g127014;
					float ifLocalVar40_g127025 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127025 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 ).a;
					float4 tex2DNode604_g127014 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, Main_UVs1219_g127014 );
					float3 appendResult876_g127014 = (float3(tex2DNode604_g127014.a , tex2DNode604_g127014.g , 1.0));
					float3 gammaToLinear878_g127014 = GammaToLinearSpace( appendResult876_g127014 );
					float3 ifLocalVar40_g127029 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127029 = gammaToLinear878_g127014;
					float ifLocalVar40_g127017 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127017 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).r;
					float ifLocalVar40_g127035 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127035 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).g;
					float ifLocalVar40_g127026 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127026 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).b;
					float ifLocalVar40_g127016 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127016 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).a;
					float2 appendResult1251_g127014 = (float2(IN.ase_texcoord7.z , IN.ase_texcoord7.w));
					float2 Mesh_DetailCoord1254_g127014 = appendResult1251_g127014;
					float2 lerpResult1231_g127014 = lerp( IN.ase_texcoord6.xy , Mesh_DetailCoord1254_g127014 , _DetailCoordMode);
					half2 Layer_02_UVs1234_g127014 = ( ( lerpResult1231_g127014 * (_SecondUVs).xy ) + (_SecondUVs).zw );
					float4 tex2DNode854_g127014 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 );
					float3 appendResult839_g127014 = (float3(tex2DNode854_g127014.r , tex2DNode854_g127014.g , tex2DNode854_g127014.b));
					float3 ifLocalVar40_g127019 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127019 = appendResult839_g127014;
					float ifLocalVar40_g127027 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127027 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 ).a;
					float4 tex2DNode841_g127014 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondNormalTex, Layer_02_UVs1234_g127014 );
					float3 appendResult880_g127014 = (float3(tex2DNode841_g127014.a , tex2DNode841_g127014.g , 1.0));
					float3 gammaToLinear879_g127014 = GammaToLinearSpace( appendResult880_g127014 );
					float3 ifLocalVar40_g127034 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127034 = gammaToLinear879_g127014;
					float ifLocalVar40_g127030 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127030 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).r;
					float ifLocalVar40_g127024 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127024 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).g;
					float ifLocalVar40_g127032 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127032 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).b;
					float ifLocalVar40_g127033 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127033 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).a;
					half2 Emissive_UVs1245_g127014 = ( ( IN.ase_texcoord6.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
					float4 tex2DNode858_g127014 = SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs1245_g127014 );
					float ifLocalVar40_g127023 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127023 = tex2DNode858_g127014.r;
					float Debug_Min721_g127014 = TVE_DEBUG_Min;
					float temp_output_7_0_g127031 = Debug_Min721_g127014;
					float4 temp_cast_4 = (temp_output_7_0_g127031).xxxx;
					float4 temp_output_9_0_g127031 = ( ( float4( ( ( ifLocalVar40_g127021 + ifLocalVar40_g127025 + ifLocalVar40_g127029 ) + ( ifLocalVar40_g127017 + ifLocalVar40_g127035 + ifLocalVar40_g127026 + ifLocalVar40_g127016 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g127019 + ifLocalVar40_g127027 + ifLocalVar40_g127034 ) + ( ifLocalVar40_g127030 + ifLocalVar40_g127024 + ifLocalVar40_g127032 + ifLocalVar40_g127033 ) ) * _DetailMode ) , 0.0 ) + ( ( ifLocalVar40_g127023 * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_4 );
					float Debug_Max723_g127014 = TVE_DEBUG_Max;
					float4 Output_Maps561_g127014 = saturate( ( ( temp_output_9_0_g127031 / ( Debug_Max723_g127014 - temp_output_7_0_g127031 ) ) + 0.0001 ) );
					float4 ifLocalVar40_g127081 = 0;
					if( Debug_Type367_g127014 == 6.0 )
					ifLocalVar40_g127081 = Output_Maps561_g127014;
					float Resolution44_g127052 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
					float4 color62_g127052 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127052 = 0;
					if( Resolution44_g127052 <= 256.0 )
					ifLocalVar61_g127052 = color62_g127052;
					float4 color55_g127052 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127052 = 0;
					if( Resolution44_g127052 == 512.0 )
					ifLocalVar56_g127052 = color55_g127052;
					float4 color42_g127052 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127052 = 0;
					if( Resolution44_g127052 == 1024.0 )
					ifLocalVar40_g127052 = color42_g127052;
					float4 color48_g127052 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127052 = 0;
					if( Resolution44_g127052 == 2048.0 )
					ifLocalVar47_g127052 = color48_g127052;
					float4 color51_g127052 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127052 = 0;
					if( Resolution44_g127052 >= 4096.0 )
					ifLocalVar52_g127052 = color51_g127052;
					float4 ifLocalVar40_g127038 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127038 = ( ifLocalVar61_g127052 + ifLocalVar56_g127052 + ifLocalVar40_g127052 + ifLocalVar47_g127052 + ifLocalVar52_g127052 );
					float Resolution44_g127051 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
					float4 color62_g127051 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127051 = 0;
					if( Resolution44_g127051 <= 256.0 )
					ifLocalVar61_g127051 = color62_g127051;
					float4 color55_g127051 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127051 = 0;
					if( Resolution44_g127051 == 512.0 )
					ifLocalVar56_g127051 = color55_g127051;
					float4 color42_g127051 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127051 = 0;
					if( Resolution44_g127051 == 1024.0 )
					ifLocalVar40_g127051 = color42_g127051;
					float4 color48_g127051 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127051 = 0;
					if( Resolution44_g127051 == 2048.0 )
					ifLocalVar47_g127051 = color48_g127051;
					float4 color51_g127051 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127051 = 0;
					if( Resolution44_g127051 >= 4096.0 )
					ifLocalVar52_g127051 = color51_g127051;
					float4 ifLocalVar40_g127036 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127036 = ( ifLocalVar61_g127051 + ifLocalVar56_g127051 + ifLocalVar40_g127051 + ifLocalVar47_g127051 + ifLocalVar52_g127051 );
					float Resolution44_g127050 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
					float4 color62_g127050 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127050 = 0;
					if( Resolution44_g127050 <= 256.0 )
					ifLocalVar61_g127050 = color62_g127050;
					float4 color55_g127050 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127050 = 0;
					if( Resolution44_g127050 == 512.0 )
					ifLocalVar56_g127050 = color55_g127050;
					float4 color42_g127050 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127050 = 0;
					if( Resolution44_g127050 == 1024.0 )
					ifLocalVar40_g127050 = color42_g127050;
					float4 color48_g127050 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127050 = 0;
					if( Resolution44_g127050 == 2048.0 )
					ifLocalVar47_g127050 = color48_g127050;
					float4 color51_g127050 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127050 = 0;
					if( Resolution44_g127050 >= 4096.0 )
					ifLocalVar52_g127050 = color51_g127050;
					float4 ifLocalVar40_g127037 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127037 = ( ifLocalVar61_g127050 + ifLocalVar56_g127050 + ifLocalVar40_g127050 + ifLocalVar47_g127050 + ifLocalVar52_g127050 );
					float Resolution44_g127057 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 color62_g127057 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127057 = 0;
					if( Resolution44_g127057 <= 256.0 )
					ifLocalVar61_g127057 = color62_g127057;
					float4 color55_g127057 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127057 = 0;
					if( Resolution44_g127057 == 512.0 )
					ifLocalVar56_g127057 = color55_g127057;
					float4 color42_g127057 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127057 = 0;
					if( Resolution44_g127057 == 1024.0 )
					ifLocalVar40_g127057 = color42_g127057;
					float4 color48_g127057 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127057 = 0;
					if( Resolution44_g127057 == 2048.0 )
					ifLocalVar47_g127057 = color48_g127057;
					float4 color51_g127057 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127057 = 0;
					if( Resolution44_g127057 >= 4096.0 )
					ifLocalVar52_g127057 = color51_g127057;
					float4 ifLocalVar40_g127044 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127044 = ( ifLocalVar61_g127057 + ifLocalVar56_g127057 + ifLocalVar40_g127057 + ifLocalVar47_g127057 + ifLocalVar52_g127057 );
					float Resolution44_g127056 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
					float4 color62_g127056 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127056 = 0;
					if( Resolution44_g127056 <= 256.0 )
					ifLocalVar61_g127056 = color62_g127056;
					float4 color55_g127056 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127056 = 0;
					if( Resolution44_g127056 == 512.0 )
					ifLocalVar56_g127056 = color55_g127056;
					float4 color42_g127056 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127056 = 0;
					if( Resolution44_g127056 == 1024.0 )
					ifLocalVar40_g127056 = color42_g127056;
					float4 color48_g127056 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127056 = 0;
					if( Resolution44_g127056 == 2048.0 )
					ifLocalVar47_g127056 = color48_g127056;
					float4 color51_g127056 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127056 = 0;
					if( Resolution44_g127056 >= 4096.0 )
					ifLocalVar52_g127056 = color51_g127056;
					float4 ifLocalVar40_g127042 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127042 = ( ifLocalVar61_g127056 + ifLocalVar56_g127056 + ifLocalVar40_g127056 + ifLocalVar47_g127056 + ifLocalVar52_g127056 );
					float Resolution44_g127058 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 color62_g127058 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127058 = 0;
					if( Resolution44_g127058 <= 256.0 )
					ifLocalVar61_g127058 = color62_g127058;
					float4 color55_g127058 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127058 = 0;
					if( Resolution44_g127058 == 512.0 )
					ifLocalVar56_g127058 = color55_g127058;
					float4 color42_g127058 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127058 = 0;
					if( Resolution44_g127058 == 1024.0 )
					ifLocalVar40_g127058 = color42_g127058;
					float4 color48_g127058 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127058 = 0;
					if( Resolution44_g127058 == 2048.0 )
					ifLocalVar47_g127058 = color48_g127058;
					float4 color51_g127058 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127058 = 0;
					if( Resolution44_g127058 >= 4096.0 )
					ifLocalVar52_g127058 = color51_g127058;
					float4 ifLocalVar40_g127043 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127043 = ( ifLocalVar61_g127058 + ifLocalVar56_g127058 + ifLocalVar40_g127058 + ifLocalVar47_g127058 + ifLocalVar52_g127058 );
					float Resolution44_g127055 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
					float4 color62_g127055 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127055 = 0;
					if( Resolution44_g127055 <= 256.0 )
					ifLocalVar61_g127055 = color62_g127055;
					float4 color55_g127055 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127055 = 0;
					if( Resolution44_g127055 == 512.0 )
					ifLocalVar56_g127055 = color55_g127055;
					float4 color42_g127055 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127055 = 0;
					if( Resolution44_g127055 == 1024.0 )
					ifLocalVar40_g127055 = color42_g127055;
					float4 color48_g127055 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127055 = 0;
					if( Resolution44_g127055 == 2048.0 )
					ifLocalVar47_g127055 = color48_g127055;
					float4 color51_g127055 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127055 = 0;
					if( Resolution44_g127055 >= 4096.0 )
					ifLocalVar52_g127055 = color51_g127055;
					float4 ifLocalVar40_g127045 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127045 = ( ifLocalVar61_g127055 + ifLocalVar56_g127055 + ifLocalVar40_g127055 + ifLocalVar47_g127055 + ifLocalVar52_g127055 );
					float4 Output_Resolution737_g127014 = ( ( ifLocalVar40_g127038 + ifLocalVar40_g127036 + ifLocalVar40_g127037 ) + ( ifLocalVar40_g127044 + ifLocalVar40_g127042 + ifLocalVar40_g127043 ) + ifLocalVar40_g127045 );
					float4 ifLocalVar40_g127082 = 0;
					if( Debug_Type367_g127014 == 7.0 )
					ifLocalVar40_g127082 = Output_Resolution737_g127014;
					float2 uv_MainAlbedoTex = IN.ase_texcoord6.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
					float2 UVs72_g127063 = Main_UVs1219_g127014;
					float Resolution44_g127063 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127063 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127063 * ( Resolution44_g127063 / 8.0 ) ) );
					float4 lerpResult78_g127063 = lerp( SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ) , tex2DNode77_g127063 , tex2DNode77_g127063.a);
					float4 ifLocalVar40_g127041 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127041 = lerpResult78_g127063;
					float2 uv_MainNormalTex = IN.ase_texcoord6.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
					float2 UVs72_g127054 = Main_UVs1219_g127014;
					float Resolution44_g127054 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
					float4 tex2DNode77_g127054 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127054 * ( Resolution44_g127054 / 8.0 ) ) );
					float4 lerpResult78_g127054 = lerp( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, uv_MainNormalTex ) , tex2DNode77_g127054 , tex2DNode77_g127054.a);
					float4 ifLocalVar40_g127039 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127039 = lerpResult78_g127054;
					float2 uv_MainMaskTex = IN.ase_texcoord6.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
					float2 UVs72_g127053 = Main_UVs1219_g127014;
					float Resolution44_g127053 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
					float4 tex2DNode77_g127053 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127053 * ( Resolution44_g127053 / 8.0 ) ) );
					float4 lerpResult78_g127053 = lerp( SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, uv_MainMaskTex ) , tex2DNode77_g127053 , tex2DNode77_g127053.a);
					float4 ifLocalVar40_g127040 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127040 = lerpResult78_g127053;
					float2 uv_SecondAlbedoTex = IN.ase_texcoord6.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
					float2 UVs72_g127061 = Layer_02_UVs1234_g127014;
					float Resolution44_g127061 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127061 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127061 * ( Resolution44_g127061 / 8.0 ) ) );
					float4 lerpResult78_g127061 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127061 , tex2DNode77_g127061.a);
					float4 ifLocalVar40_g127048 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127048 = lerpResult78_g127061;
					float2 uv_SecondMaskTex = IN.ase_texcoord6.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
					float2 UVs72_g127060 = Layer_02_UVs1234_g127014;
					float Resolution44_g127060 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
					float4 tex2DNode77_g127060 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127060 * ( Resolution44_g127060 / 8.0 ) ) );
					float4 lerpResult78_g127060 = lerp( SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, uv_SecondMaskTex ) , tex2DNode77_g127060 , tex2DNode77_g127060.a);
					float4 ifLocalVar40_g127046 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127046 = lerpResult78_g127060;
					float2 UVs72_g127062 = Layer_02_UVs1234_g127014;
					float Resolution44_g127062 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127062 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127062 * ( Resolution44_g127062 / 8.0 ) ) );
					float4 lerpResult78_g127062 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127062 , tex2DNode77_g127062.a);
					float4 ifLocalVar40_g127047 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127047 = lerpResult78_g127062;
					float2 uv_EmissiveTex = IN.ase_texcoord6.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
					float2 UVs72_g127059 = Emissive_UVs1245_g127014;
					float Resolution44_g127059 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
					float4 tex2DNode77_g127059 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127059 * ( Resolution44_g127059 / 8.0 ) ) );
					float4 lerpResult78_g127059 = lerp( SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, uv_EmissiveTex ) , tex2DNode77_g127059 , tex2DNode77_g127059.a);
					float4 ifLocalVar40_g127049 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127049 = lerpResult78_g127059;
					float4 Output_MipLevel1284_g127014 = ( ( ifLocalVar40_g127041 + ifLocalVar40_g127039 + ifLocalVar40_g127040 ) + ( ifLocalVar40_g127048 + ifLocalVar40_g127046 + ifLocalVar40_g127047 ) + ifLocalVar40_g127049 );
					float4 ifLocalVar40_g127083 = 0;
					if( Debug_Type367_g127014 == 8.0 )
					ifLocalVar40_g127083 = Output_MipLevel1284_g127014;
					float ifLocalVar40_g127582 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127582 = (float3( 0,0,0 )).z;
					float Debug_Layer885_g127014 = TVE_DEBUG_Layer;
					float temp_output_82_0_g127401 = Debug_Layer885_g127014;
					float temp_output_19_0_g127403 = TVE_CoatLayers[(int)temp_output_82_0_g127401];
					float3 WorldPosition893_g127014 = worldPos;
					half3 Input_Position180_g127404 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127404 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127404).xz ) );
					float temp_output_82_0_g127404 = temp_output_82_0_g127401;
					float2 temp_output_119_0_g127404 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127404).xz ) );
					float temp_output_7_0_g127409 = 1.0;
					float temp_output_9_0_g127409 = ( saturate( ( distance( Input_Position180_g127404 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127409 );
					float4 lerpResult131_g127404 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127404,temp_output_82_0_g127404), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127404,temp_output_82_0_g127404), 0.0 ) , saturate( ( temp_output_9_0_g127409 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127409 ) ) ));
					float4 temp_output_17_0_g127403 = lerpResult131_g127404;
					float4 temp_output_3_0_g127403 = TVE_CoatParams;
					float4 ifLocalVar18_g127403 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127403 >= 0.5 )
					ifLocalVar18_g127403 = temp_output_17_0_g127403;
					else
					ifLocalVar18_g127403 = temp_output_3_0_g127403;
					float4 lerpResult22_g127403 = lerp( temp_output_3_0_g127403 , temp_output_17_0_g127403 , temp_output_19_0_g127403);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127403 = lerpResult22_g127403;
					#else
					float4 staticSwitch24_g127403 = ifLocalVar18_g127403;
					#endif
					float ifLocalVar40_g127419 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127419 = (staticSwitch24_g127403).g;
					float temp_output_82_0_g127410 = Debug_Layer885_g127014;
					float temp_output_19_0_g127412 = TVE_CoatLayers[(int)temp_output_82_0_g127410];
					half3 Input_Position180_g127413 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127413 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127413).xz ) );
					float temp_output_82_0_g127413 = temp_output_82_0_g127410;
					float2 temp_output_119_0_g127413 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127413).xz ) );
					float temp_output_7_0_g127418 = 1.0;
					float temp_output_9_0_g127418 = ( saturate( ( distance( Input_Position180_g127413 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127418 );
					float4 lerpResult131_g127413 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127413,temp_output_82_0_g127413), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127413,temp_output_82_0_g127413), 0.0 ) , saturate( ( temp_output_9_0_g127418 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127418 ) ) ));
					float4 temp_output_17_0_g127412 = lerpResult131_g127413;
					float4 temp_output_3_0_g127412 = TVE_CoatParams;
					float4 ifLocalVar18_g127412 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127412 >= 0.5 )
					ifLocalVar18_g127412 = temp_output_17_0_g127412;
					else
					ifLocalVar18_g127412 = temp_output_3_0_g127412;
					float4 lerpResult22_g127412 = lerp( temp_output_3_0_g127412 , temp_output_17_0_g127412 , temp_output_19_0_g127412);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127412 = lerpResult22_g127412;
					#else
					float4 staticSwitch24_g127412 = ifLocalVar18_g127412;
					#endif
					float ifLocalVar40_g127420 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127420 = (staticSwitch24_g127412).b;
					float temp_output_82_0_g127430 = Debug_Layer885_g127014;
					float temp_output_19_0_g127432 = TVE_PaintLayers[(int)temp_output_82_0_g127430];
					half3 Input_Position180_g127433 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127433 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127433).xz ) );
					float temp_output_82_0_g127433 = temp_output_82_0_g127430;
					float2 temp_output_119_0_g127433 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127433).xz ) );
					float temp_output_7_0_g127438 = 1.0;
					float temp_output_9_0_g127438 = ( saturate( ( distance( Input_Position180_g127433 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127438 );
					float4 lerpResult131_g127433 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127433,temp_output_82_0_g127433), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127433,temp_output_82_0_g127433), 0.0 ) , saturate( ( temp_output_9_0_g127438 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127438 ) ) ));
					float4 temp_output_17_0_g127432 = lerpResult131_g127433;
					float4 temp_output_3_0_g127432 = TVE_PaintParams;
					float4 ifLocalVar18_g127432 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127432 >= 0.5 )
					ifLocalVar18_g127432 = temp_output_17_0_g127432;
					else
					ifLocalVar18_g127432 = temp_output_3_0_g127432;
					float4 lerpResult22_g127432 = lerp( temp_output_3_0_g127432 , temp_output_17_0_g127432 , temp_output_19_0_g127432);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127432 = lerpResult22_g127432;
					#else
					float4 staticSwitch24_g127432 = ifLocalVar18_g127432;
					#endif
					float3 ifLocalVar40_g127439 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127439 = (staticSwitch24_g127432).rgb;
					float temp_output_82_0_g127421 = Debug_Layer885_g127014;
					float temp_output_19_0_g127423 = TVE_PaintLayers[(int)temp_output_82_0_g127421];
					half3 Input_Position180_g127424 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127424 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127424).xz ) );
					float temp_output_82_0_g127424 = temp_output_82_0_g127421;
					float2 temp_output_119_0_g127424 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127424).xz ) );
					float temp_output_7_0_g127429 = 1.0;
					float temp_output_9_0_g127429 = ( saturate( ( distance( Input_Position180_g127424 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127429 );
					float4 lerpResult131_g127424 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127424,temp_output_82_0_g127424), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127424,temp_output_82_0_g127424), 0.0 ) , saturate( ( temp_output_9_0_g127429 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127429 ) ) ));
					float4 temp_output_17_0_g127423 = lerpResult131_g127424;
					float4 temp_output_3_0_g127423 = TVE_PaintParams;
					float4 ifLocalVar18_g127423 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127423 >= 0.5 )
					ifLocalVar18_g127423 = temp_output_17_0_g127423;
					else
					ifLocalVar18_g127423 = temp_output_3_0_g127423;
					float4 lerpResult22_g127423 = lerp( temp_output_3_0_g127423 , temp_output_17_0_g127423 , temp_output_19_0_g127423);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127423 = lerpResult22_g127423;
					#else
					float4 staticSwitch24_g127423 = ifLocalVar18_g127423;
					#endif
					float ifLocalVar40_g127440 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127440 = saturate( (staticSwitch24_g127423).a );
					float temp_output_82_0_g127441 = Debug_Layer885_g127014;
					float temp_output_19_0_g127443 = TVE_GlowLayers[(int)temp_output_82_0_g127441];
					half3 Input_Position180_g127444 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127444 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127444).xz ) );
					float temp_output_82_0_g127444 = temp_output_82_0_g127441;
					float2 temp_output_119_0_g127444 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127444).xz ) );
					float temp_output_7_0_g127449 = 1.0;
					float temp_output_9_0_g127449 = ( saturate( ( distance( Input_Position180_g127444 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127449 );
					float4 lerpResult131_g127444 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127444,temp_output_82_0_g127444), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127444,temp_output_82_0_g127444), 0.0 ) , saturate( ( temp_output_9_0_g127449 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127449 ) ) ));
					float4 temp_output_17_0_g127443 = lerpResult131_g127444;
					float4 temp_output_3_0_g127443 = TVE_GlowParams;
					float4 ifLocalVar18_g127443 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127443 >= 0.5 )
					ifLocalVar18_g127443 = temp_output_17_0_g127443;
					else
					ifLocalVar18_g127443 = temp_output_3_0_g127443;
					float4 lerpResult22_g127443 = lerp( temp_output_3_0_g127443 , temp_output_17_0_g127443 , temp_output_19_0_g127443);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127443 = lerpResult22_g127443;
					#else
					float4 staticSwitch24_g127443 = ifLocalVar18_g127443;
					#endif
					float3 ifLocalVar40_g127513 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127513 = (staticSwitch24_g127443).rgb;
					float temp_output_82_0_g127504 = Debug_Layer885_g127014;
					float temp_output_19_0_g127506 = TVE_GlowLayers[(int)temp_output_82_0_g127504];
					half3 Input_Position180_g127507 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127507 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127507).xz ) );
					float temp_output_82_0_g127507 = temp_output_82_0_g127504;
					float2 temp_output_119_0_g127507 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127507).xz ) );
					float temp_output_7_0_g127512 = 1.0;
					float temp_output_9_0_g127512 = ( saturate( ( distance( Input_Position180_g127507 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127512 );
					float4 lerpResult131_g127507 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127507,temp_output_82_0_g127507), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127507,temp_output_82_0_g127507), 0.0 ) , saturate( ( temp_output_9_0_g127512 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127512 ) ) ));
					float4 temp_output_17_0_g127506 = lerpResult131_g127507;
					float4 temp_output_3_0_g127506 = TVE_GlowParams;
					float4 ifLocalVar18_g127506 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127506 >= 0.5 )
					ifLocalVar18_g127506 = temp_output_17_0_g127506;
					else
					ifLocalVar18_g127506 = temp_output_3_0_g127506;
					float4 lerpResult22_g127506 = lerp( temp_output_3_0_g127506 , temp_output_17_0_g127506 , temp_output_19_0_g127506);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127506 = lerpResult22_g127506;
					#else
					float4 staticSwitch24_g127506 = ifLocalVar18_g127506;
					#endif
					float ifLocalVar40_g127514 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127514 = saturate( (staticSwitch24_g127506).a );
					float temp_output_132_0_g127477 = Debug_Layer885_g127014;
					float temp_output_19_0_g127479 = TVE_AtmoLayers[(int)temp_output_132_0_g127477];
					half3 Input_Position180_g127480 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127480 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127480).xz ) );
					float temp_output_82_0_g127480 = temp_output_132_0_g127477;
					float2 temp_output_119_0_g127480 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127480).xz ) );
					float temp_output_7_0_g127485 = 1.0;
					float temp_output_9_0_g127485 = ( saturate( ( distance( Input_Position180_g127480 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127485 );
					float4 lerpResult131_g127480 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127480,temp_output_82_0_g127480), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127480,temp_output_82_0_g127480), 0.0 ) , saturate( ( temp_output_9_0_g127485 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127485 ) ) ));
					float4 temp_output_17_0_g127479 = lerpResult131_g127480;
					float4 temp_output_3_0_g127479 = TVE_AtmoParams;
					float4 ifLocalVar18_g127479 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127479 >= 0.5 )
					ifLocalVar18_g127479 = temp_output_17_0_g127479;
					else
					ifLocalVar18_g127479 = temp_output_3_0_g127479;
					float4 lerpResult22_g127479 = lerp( temp_output_3_0_g127479 , temp_output_17_0_g127479 , temp_output_19_0_g127479);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127479 = lerpResult22_g127479;
					#else
					float4 staticSwitch24_g127479 = ifLocalVar18_g127479;
					#endif
					float ifLocalVar40_g127515 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127515 = (staticSwitch24_g127479).r;
					float temp_output_132_0_g127450 = Debug_Layer885_g127014;
					float temp_output_19_0_g127452 = TVE_AtmoLayers[(int)temp_output_132_0_g127450];
					half3 Input_Position180_g127453 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127453 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127453).xz ) );
					float temp_output_82_0_g127453 = temp_output_132_0_g127450;
					float2 temp_output_119_0_g127453 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127453).xz ) );
					float temp_output_7_0_g127458 = 1.0;
					float temp_output_9_0_g127458 = ( saturate( ( distance( Input_Position180_g127453 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127458 );
					float4 lerpResult131_g127453 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127453,temp_output_82_0_g127453), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127453,temp_output_82_0_g127453), 0.0 ) , saturate( ( temp_output_9_0_g127458 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127458 ) ) ));
					float4 temp_output_17_0_g127452 = lerpResult131_g127453;
					float4 temp_output_3_0_g127452 = TVE_AtmoParams;
					float4 ifLocalVar18_g127452 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127452 >= 0.5 )
					ifLocalVar18_g127452 = temp_output_17_0_g127452;
					else
					ifLocalVar18_g127452 = temp_output_3_0_g127452;
					float4 lerpResult22_g127452 = lerp( temp_output_3_0_g127452 , temp_output_17_0_g127452 , temp_output_19_0_g127452);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127452 = lerpResult22_g127452;
					#else
					float4 staticSwitch24_g127452 = ifLocalVar18_g127452;
					#endif
					float ifLocalVar40_g127516 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127516 = (staticSwitch24_g127452).g;
					float temp_output_132_0_g127459 = Debug_Layer885_g127014;
					float temp_output_19_0_g127461 = TVE_AtmoLayers[(int)temp_output_132_0_g127459];
					half3 Input_Position180_g127462 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127462 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127462).xz ) );
					float temp_output_82_0_g127462 = temp_output_132_0_g127459;
					float2 temp_output_119_0_g127462 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127462).xz ) );
					float temp_output_7_0_g127467 = 1.0;
					float temp_output_9_0_g127467 = ( saturate( ( distance( Input_Position180_g127462 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127467 );
					float4 lerpResult131_g127462 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127462,temp_output_82_0_g127462), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127462,temp_output_82_0_g127462), 0.0 ) , saturate( ( temp_output_9_0_g127467 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127467 ) ) ));
					float4 temp_output_17_0_g127461 = lerpResult131_g127462;
					float4 temp_output_3_0_g127461 = TVE_AtmoParams;
					float4 ifLocalVar18_g127461 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127461 >= 0.5 )
					ifLocalVar18_g127461 = temp_output_17_0_g127461;
					else
					ifLocalVar18_g127461 = temp_output_3_0_g127461;
					float4 lerpResult22_g127461 = lerp( temp_output_3_0_g127461 , temp_output_17_0_g127461 , temp_output_19_0_g127461);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127461 = lerpResult22_g127461;
					#else
					float4 staticSwitch24_g127461 = ifLocalVar18_g127461;
					#endif
					float ifLocalVar40_g127517 = 0;
					if( Debug_Index464_g127014 == 9.0 )
					ifLocalVar40_g127517 = (staticSwitch24_g127461).b;
					float temp_output_132_0_g127468 = Debug_Layer885_g127014;
					float temp_output_19_0_g127470 = TVE_AtmoLayers[(int)temp_output_132_0_g127468];
					half3 Input_Position180_g127471 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127471 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127471).xz ) );
					float temp_output_82_0_g127471 = temp_output_132_0_g127468;
					float2 temp_output_119_0_g127471 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127471).xz ) );
					float temp_output_7_0_g127476 = 1.0;
					float temp_output_9_0_g127476 = ( saturate( ( distance( Input_Position180_g127471 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127476 );
					float4 lerpResult131_g127471 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127471,temp_output_82_0_g127471), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127471,temp_output_82_0_g127471), 0.0 ) , saturate( ( temp_output_9_0_g127476 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127476 ) ) ));
					float4 temp_output_17_0_g127470 = lerpResult131_g127471;
					float4 temp_output_3_0_g127470 = TVE_AtmoParams;
					float4 ifLocalVar18_g127470 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127470 >= 0.5 )
					ifLocalVar18_g127470 = temp_output_17_0_g127470;
					else
					ifLocalVar18_g127470 = temp_output_3_0_g127470;
					float4 lerpResult22_g127470 = lerp( temp_output_3_0_g127470 , temp_output_17_0_g127470 , temp_output_19_0_g127470);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127470 = lerpResult22_g127470;
					#else
					float4 staticSwitch24_g127470 = ifLocalVar18_g127470;
					#endif
					float ifLocalVar40_g127518 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127518 = saturate( (staticSwitch24_g127470).a );
					float temp_output_130_0_g127495 = Debug_Layer885_g127014;
					float temp_output_19_0_g127497 = TVE_FormLayers[(int)temp_output_130_0_g127495];
					half3 Input_Position180_g127498 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127498 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127498).xz ) );
					float temp_output_82_0_g127498 = temp_output_130_0_g127495;
					float2 temp_output_119_0_g127498 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127498).xz ) );
					float temp_output_7_0_g127503 = 1.0;
					float temp_output_9_0_g127503 = ( saturate( ( distance( Input_Position180_g127498 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127503 );
					float4 lerpResult131_g127498 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127498,temp_output_82_0_g127498), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127498,temp_output_82_0_g127498), 0.0 ) , saturate( ( temp_output_9_0_g127503 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127503 ) ) ));
					float4 temp_output_17_0_g127497 = lerpResult131_g127498;
					float4 temp_output_3_0_g127497 = TVE_FormParams;
					float4 ifLocalVar18_g127497 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127497 >= 0.5 )
					ifLocalVar18_g127497 = temp_output_17_0_g127497;
					else
					ifLocalVar18_g127497 = temp_output_3_0_g127497;
					float4 lerpResult22_g127497 = lerp( temp_output_3_0_g127497 , temp_output_17_0_g127497 , temp_output_19_0_g127497);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127497 = lerpResult22_g127497;
					#else
					float4 staticSwitch24_g127497 = ifLocalVar18_g127497;
					#endif
					float3 appendResult1013_g127014 = (float3((staticSwitch24_g127497).rg , 0.0));
					float3 ifLocalVar40_g127519 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127519 = appendResult1013_g127014;
					float temp_output_130_0_g127486 = Debug_Layer885_g127014;
					float temp_output_19_0_g127488 = TVE_FormLayers[(int)temp_output_130_0_g127486];
					half3 Input_Position180_g127489 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127489 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127489).xz ) );
					float temp_output_82_0_g127489 = temp_output_130_0_g127486;
					float2 temp_output_119_0_g127489 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127489).xz ) );
					float temp_output_7_0_g127494 = 1.0;
					float temp_output_9_0_g127494 = ( saturate( ( distance( Input_Position180_g127489 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127494 );
					float4 lerpResult131_g127489 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127489,temp_output_82_0_g127489), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127489,temp_output_82_0_g127489), 0.0 ) , saturate( ( temp_output_9_0_g127494 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127494 ) ) ));
					float4 temp_output_17_0_g127488 = lerpResult131_g127489;
					float4 temp_output_3_0_g127488 = TVE_FormParams;
					float4 ifLocalVar18_g127488 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127488 >= 0.5 )
					ifLocalVar18_g127488 = temp_output_17_0_g127488;
					else
					ifLocalVar18_g127488 = temp_output_3_0_g127488;
					float4 lerpResult22_g127488 = lerp( temp_output_3_0_g127488 , temp_output_17_0_g127488 , temp_output_19_0_g127488);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127488 = lerpResult22_g127488;
					#else
					float4 staticSwitch24_g127488 = ifLocalVar18_g127488;
					#endif
					float ifLocalVar40_g127520 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127520 = saturate( (staticSwitch24_g127488).b );
					float temp_output_130_0_g127543 = Debug_Layer885_g127014;
					float temp_output_19_0_g127545 = TVE_FormLayers[(int)temp_output_130_0_g127543];
					half3 Input_Position180_g127546 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127546 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127546).xz ) );
					float temp_output_82_0_g127546 = temp_output_130_0_g127543;
					float2 temp_output_119_0_g127546 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127546).xz ) );
					float temp_output_7_0_g127551 = 1.0;
					float temp_output_9_0_g127551 = ( saturate( ( distance( Input_Position180_g127546 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127551 );
					float4 lerpResult131_g127546 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127546,temp_output_82_0_g127546), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127546,temp_output_82_0_g127546), 0.0 ) , saturate( ( temp_output_9_0_g127551 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127551 ) ) ));
					float4 temp_output_17_0_g127545 = lerpResult131_g127546;
					float4 temp_output_3_0_g127545 = TVE_FormParams;
					float4 ifLocalVar18_g127545 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127545 >= 0.5 )
					ifLocalVar18_g127545 = temp_output_17_0_g127545;
					else
					ifLocalVar18_g127545 = temp_output_3_0_g127545;
					float4 lerpResult22_g127545 = lerp( temp_output_3_0_g127545 , temp_output_17_0_g127545 , temp_output_19_0_g127545);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127545 = lerpResult22_g127545;
					#else
					float4 staticSwitch24_g127545 = ifLocalVar18_g127545;
					#endif
					float ifLocalVar40_g127552 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127552 = saturate( (staticSwitch24_g127545).a );
					float temp_output_136_0_g127521 = Debug_Layer885_g127014;
					float temp_output_19_0_g127523 = TVE_FlowLayers[(int)temp_output_136_0_g127521];
					half3 Input_Position180_g127524 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127524 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127524).xz ) );
					float temp_output_82_0_g127524 = temp_output_136_0_g127521;
					float2 temp_output_119_0_g127524 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127524).xz ) );
					float temp_output_7_0_g127529 = 1.0;
					float temp_output_9_0_g127529 = ( saturate( ( distance( Input_Position180_g127524 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127529 );
					float4 lerpResult131_g127524 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127524,temp_output_82_0_g127524), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127524,temp_output_82_0_g127524), 0.0 ) , saturate( ( temp_output_9_0_g127529 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127529 ) ) ));
					float4 temp_output_17_0_g127523 = lerpResult131_g127524;
					float4 temp_output_3_0_g127523 = TVE_FlowParams;
					float4 ifLocalVar18_g127523 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127523 >= 0.5 )
					ifLocalVar18_g127523 = temp_output_17_0_g127523;
					else
					ifLocalVar18_g127523 = temp_output_3_0_g127523;
					float4 lerpResult22_g127523 = lerp( temp_output_3_0_g127523 , temp_output_17_0_g127523 , temp_output_19_0_g127523);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127523 = lerpResult22_g127523;
					#else
					float4 staticSwitch24_g127523 = ifLocalVar18_g127523;
					#endif
					float3 appendResult1012_g127014 = (float3((staticSwitch24_g127523).rg , 0.0));
					float3 ifLocalVar40_g127539 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127539 = appendResult1012_g127014;
					float temp_output_136_0_g127530 = Debug_Layer885_g127014;
					float temp_output_19_0_g127532 = TVE_FlowLayers[(int)temp_output_136_0_g127530];
					half3 Input_Position180_g127533 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127533 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127533).xz ) );
					float temp_output_82_0_g127533 = temp_output_136_0_g127530;
					float2 temp_output_119_0_g127533 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127533).xz ) );
					float temp_output_7_0_g127538 = 1.0;
					float temp_output_9_0_g127538 = ( saturate( ( distance( Input_Position180_g127533 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127538 );
					float4 lerpResult131_g127533 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127533,temp_output_82_0_g127533), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127533,temp_output_82_0_g127533), 0.0 ) , saturate( ( temp_output_9_0_g127538 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127538 ) ) ));
					float4 temp_output_17_0_g127532 = lerpResult131_g127533;
					float4 temp_output_3_0_g127532 = TVE_FlowParams;
					float4 ifLocalVar18_g127532 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127532 >= 0.5 )
					ifLocalVar18_g127532 = temp_output_17_0_g127532;
					else
					ifLocalVar18_g127532 = temp_output_3_0_g127532;
					float4 lerpResult22_g127532 = lerp( temp_output_3_0_g127532 , temp_output_17_0_g127532 , temp_output_19_0_g127532);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127532 = lerpResult22_g127532;
					#else
					float4 staticSwitch24_g127532 = ifLocalVar18_g127532;
					#endif
					float ifLocalVar40_g127540 = 0;
					if( Debug_Index464_g127014 == 15.0 )
					ifLocalVar40_g127540 = (staticSwitch24_g127532).b;
					float temp_output_136_0_g127555 = Debug_Layer885_g127014;
					float temp_output_19_0_g127556 = TVE_PushLayers[(int)temp_output_136_0_g127555];
					half3 Input_Position180_g127557 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127557 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127557).xz ) );
					float temp_output_82_0_g127557 = temp_output_136_0_g127555;
					float2 temp_output_119_0_g127557 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127557).xz ) );
					float temp_output_7_0_g127562 = 1.0;
					float temp_output_9_0_g127562 = ( saturate( ( distance( Input_Position180_g127557 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127562 );
					float4 lerpResult131_g127557 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127557,temp_output_82_0_g127557), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127557,temp_output_82_0_g127557), 0.0 ) , saturate( ( temp_output_9_0_g127562 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127562 ) ) ));
					float4 temp_output_17_0_g127556 = lerpResult131_g127557;
					float4 temp_output_3_0_g127556 = TVE_PushParams;
					float4 ifLocalVar18_g127556 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127556 >= 0.5 )
					ifLocalVar18_g127556 = temp_output_17_0_g127556;
					else
					ifLocalVar18_g127556 = temp_output_3_0_g127556;
					float4 lerpResult22_g127556 = lerp( temp_output_3_0_g127556 , temp_output_17_0_g127556 , temp_output_19_0_g127556);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127556 = lerpResult22_g127556;
					#else
					float4 staticSwitch24_g127556 = ifLocalVar18_g127556;
					#endif
					float3 appendResult1780_g127014 = (float3((staticSwitch24_g127556).rg , 0.0));
					float3 ifLocalVar40_g127541 = 0;
					if( Debug_Index464_g127014 == 16.0 )
					ifLocalVar40_g127541 = appendResult1780_g127014;
					float temp_output_136_0_g127564 = Debug_Layer885_g127014;
					float temp_output_19_0_g127565 = TVE_PushLayers[(int)temp_output_136_0_g127564];
					half3 Input_Position180_g127566 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127566 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127566).xz ) );
					float temp_output_82_0_g127566 = temp_output_136_0_g127564;
					float2 temp_output_119_0_g127566 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127566).xz ) );
					float temp_output_7_0_g127571 = 1.0;
					float temp_output_9_0_g127571 = ( saturate( ( distance( Input_Position180_g127566 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127571 );
					float4 lerpResult131_g127566 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127566,temp_output_82_0_g127566), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127566,temp_output_82_0_g127566), 0.0 ) , saturate( ( temp_output_9_0_g127571 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127571 ) ) ));
					float4 temp_output_17_0_g127565 = lerpResult131_g127566;
					float4 temp_output_3_0_g127565 = TVE_PushParams;
					float4 ifLocalVar18_g127565 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127565 >= 0.5 )
					ifLocalVar18_g127565 = temp_output_17_0_g127565;
					else
					ifLocalVar18_g127565 = temp_output_3_0_g127565;
					float4 lerpResult22_g127565 = lerp( temp_output_3_0_g127565 , temp_output_17_0_g127565 , temp_output_19_0_g127565);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127565 = lerpResult22_g127565;
					#else
					float4 staticSwitch24_g127565 = ifLocalVar18_g127565;
					#endif
					float ifLocalVar40_g127542 = 0;
					if( Debug_Index464_g127014 == 17.0 )
					ifLocalVar40_g127542 = (staticSwitch24_g127565).b;
					float temp_output_136_0_g127573 = Debug_Layer885_g127014;
					float temp_output_19_0_g127574 = TVE_PushLayers[(int)temp_output_136_0_g127573];
					half3 Input_Position180_g127575 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127575 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127575).xz ) );
					float temp_output_82_0_g127575 = temp_output_136_0_g127573;
					float2 temp_output_119_0_g127575 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127575).xz ) );
					float temp_output_7_0_g127580 = 1.0;
					float temp_output_9_0_g127580 = ( saturate( ( distance( Input_Position180_g127575 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127580 );
					float4 lerpResult131_g127575 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127575,temp_output_82_0_g127575), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127575,temp_output_82_0_g127575), 0.0 ) , saturate( ( temp_output_9_0_g127580 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127580 ) ) ));
					float4 temp_output_17_0_g127574 = lerpResult131_g127575;
					float4 temp_output_3_0_g127574 = TVE_PushParams;
					float4 ifLocalVar18_g127574 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127574 >= 0.5 )
					ifLocalVar18_g127574 = temp_output_17_0_g127574;
					else
					ifLocalVar18_g127574 = temp_output_3_0_g127574;
					float4 lerpResult22_g127574 = lerp( temp_output_3_0_g127574 , temp_output_17_0_g127574 , temp_output_19_0_g127574);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127574 = lerpResult22_g127574;
					#else
					float4 staticSwitch24_g127574 = ifLocalVar18_g127574;
					#endif
					float ifLocalVar40_g127553 = 0;
					if( Debug_Index464_g127014 == 18.0 )
					ifLocalVar40_g127553 = saturate( (staticSwitch24_g127574).a );
					float temp_output_7_0_g127554 = Debug_Min721_g127014;
					float3 temp_cast_59 = (temp_output_7_0_g127554).xxx;
					float3 temp_output_9_0_g127554 = ( ( ifLocalVar40_g127582 + ( ifLocalVar40_g127419 + ifLocalVar40_g127420 ) + ( ifLocalVar40_g127439 + ifLocalVar40_g127440 ) + ( ifLocalVar40_g127513 + ifLocalVar40_g127514 ) + ( ifLocalVar40_g127515 + ifLocalVar40_g127516 + ifLocalVar40_g127517 + ifLocalVar40_g127518 ) + ( ifLocalVar40_g127519 + ifLocalVar40_g127520 + ifLocalVar40_g127552 ) + ( ifLocalVar40_g127539 + ifLocalVar40_g127540 + ifLocalVar40_g127541 + ifLocalVar40_g127542 + ifLocalVar40_g127553 ) ) - temp_cast_59 );
					float4 appendResult1659_g127014 = (float4(saturate( ( ( temp_output_9_0_g127554 / ( Debug_Max723_g127014 - temp_output_7_0_g127554 ) ) + 0.0001 ) ) , 1.0));
					float4 Output_Globals888_g127014 = appendResult1659_g127014;
					float4 ifLocalVar40_g127084 = 0;
					if( Debug_Type367_g127014 == 9.0 )
					ifLocalVar40_g127084 = Output_Globals888_g127014;
					float3 vertexToFrag328_g127014 = IN.ase_texcoord8.xyz;
					float4 color1016_g127014 = IsGammaSpace() ? float4( 0.5831653, 0.6037736, 0.2135992, 0 ) : float4( 0.2992498, 0.3229691, 0.03750122, 0 );
					float4 color1017_g127014 = IsGammaSpace() ? float4( 0.8117647, 0.3488252, 0.2627451, 0 ) : float4( 0.6239604, 0.0997834, 0.05612849, 0 );
					float4 switchResult1015_g127014 = (((ase_vface>0)?(color1016_g127014):(color1017_g127014)));
					float3 ifLocalVar40_g127018 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127018 = (switchResult1015_g127014).rgb;
					float temp_output_7_0_g127074 = Debug_Min721_g127014;
					float3 temp_cast_60 = (temp_output_7_0_g127074).xxx;
					float3 temp_output_9_0_g127074 = ( ( vertexToFrag328_g127014 + ifLocalVar40_g127018 ) - temp_cast_60 );
					float4 appendResult1658_g127014 = (float4(saturate( ( ( temp_output_9_0_g127074 / ( Debug_Max723_g127014 - temp_output_7_0_g127074 ) ) + 0.0001 ) ) , 1.0));
					float4 Output_Mesh316_g127014 = appendResult1658_g127014;
					float4 ifLocalVar40_g127086 = 0;
					if( Debug_Type367_g127014 == 11.0 )
					ifLocalVar40_g127086 = Output_Mesh316_g127014;
					float _IsTVEShader647_g127014 = _IsTVEShader;
					float Debug_Filter322_g127014 = TVE_DEBUG_Filter;
					float lerpResult1524_g127014 = lerp( 1.0 , _IsTVEShader647_g127014 , Debug_Filter322_g127014);
					float4 lerpResult1517_g127014 = lerp( Shading_Inactive1492_g127014 , ( ( ifLocalVar40_g127075 + ifLocalVar40_g127077 + ifLocalVar40_g127078 + ifLocalVar40_g127079 + ifLocalVar40_g127080 ) + ( ifLocalVar40_g127081 + ifLocalVar40_g127082 + ifLocalVar40_g127083 ) + ( ifLocalVar40_g127084 + ifLocalVar40_g127086 ) ) , lerpResult1524_g127014);
					float dotResult1472_g127014 = dot( WorldNormal , worldViewDir );
					float temp_output_1526_0_g127014 = ( 1.0 - saturate( dotResult1472_g127014 ) );
					float Shading_Fresnel1469_g127014 = (( 1.0 - ( temp_output_1526_0_g127014 * temp_output_1526_0_g127014 ) )*0.3 + 0.7);
					float Debug_Shading1653_g127014 = TVE_DEBUG_Shading;
					float lerpResult1655_g127014 = lerp( 1.0 , Shading_Fresnel1469_g127014 , Debug_Shading1653_g127014);
					float Debug_Clip623_g127014 = TVE_DEBUG_Clip;
					float lerpResult622_g127014 = lerp( 1.0 , SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g127014 * _RenderClip ));
					clip( lerpResult622_g127014 - _MainAlphaClipValue);
					clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
					

					o.Albedo = temp_cast_0;
					o.Normal = half3( 0, 0, 1 );
					#if defined(ASE_LIGHTING_SIMPLE)
						o.Specular = 1;
						o.Gloss = 1;
					#else
						#if defined(_SPECULAR_SETUP)
							o.Specular = fixed3( 1, 1, 1 );
						#else
							o.Metallic = 0.0;
						#endif
						o.Occlusion = 1;
						o.Smoothness = 0.0;
					#endif
					o.Emission = ( lerpResult1517_g127014 * lerpResult1655_g127014 ).rgb;
					o.Alpha = 1;
					float3 BakedGI = 0;

					#if defined( ASE_DEPTH_WRITE_ON )
						float DeviceDepth = IN.pos.z;
					#endif

					#if ( ASE_FRAGMENT_NORMAL == 0 )
						o.Normal = normalize(o.Normal.x * IN.worldTangent.xyz + o.Normal.y * IN.worldBitangent.xyz + o.Normal.z * IN.worldNormal.xyz);
					#elif ( ASE_FRAGMENT_NORMAL == 1 )
						o.Normal = UnityObjectToWorldNormal( o.Normal );
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						// @diogo: already in world-space; do nothing
					#endif

					#ifdef _ALPHATEST_ON
						clip( o.Alpha - AlphaClipThreshold );
					#endif

					#if defined( ASE_DEPTH_WRITE_ON )
						outputDepth = DeviceDepth;
					#endif

					#ifndef USING_DIRECTIONAL_LIGHT
						half3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
					#else
						half3 lightDir = _WorldSpaceLightPos0.xyz;
					#endif

					UnityGI gi;
					UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
					gi.indirect.diffuse = 0;
					gi.indirect.specular = 0;
					gi.light.color = 0;
					gi.light.dir = half3(0,1,0);

					UnityGIInput giInput;
					UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
					giInput.light = gi.light;
					giInput.worldPos = worldPos;
					giInput.worldViewDir = worldViewDir;
					giInput.atten = atten;
					#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
						giInput.lightmapUV = IN.ambientOrLightmapUV;
					#else
						giInput.lightmapUV = 0.0;
					#endif
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						giInput.ambient = IN.ambientOrLightmapUV.rgb;
					#else
						giInput.ambient.rgb = 0.0;
					#endif
					giInput.probeHDR[0] = unity_SpecCube0_HDR;
					giInput.probeHDR[1] = unity_SpecCube1_HDR;
					#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
						giInput.boxMin[0] = unity_SpecCube0_BoxMin;
					#endif
					#ifdef UNITY_SPECCUBE_BOX_PROJECTION
						giInput.boxMax[0] = unity_SpecCube0_BoxMax;
						giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
						giInput.boxMax[1] = unity_SpecCube1_BoxMax;
						giInput.boxMin[1] = unity_SpecCube1_BoxMin;
						giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
					#endif

					#if defined(ASE_LIGHTING_SIMPLE)
						#if defined(_SPECULAR_SETUP)
							LightingBlinnPhong_GI(o, giInput, gi);
						#else
							LightingLambert_GI(o, giInput, gi);
						#endif
					#else
						#if defined(_SPECULAR_SETUP)
							LightingStandardSpecular_GI(o, giInput, gi);
						#else
							LightingStandard_GI(o, giInput, gi);
						#endif
					#endif

					#ifdef ASE_BAKEDGI
						gi.indirect.diffuse = BakedGI;
					#endif

					#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
						gi.indirect.diffuse = 0;
					#endif

					#if defined(ASE_LIGHTING_SIMPLE)
						#if defined(_SPECULAR_SETUP)
							outEmission = LightingBlinnPhong_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
						#else
							outEmission = LightingLambert_Deferred( o, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
						#endif
					#else
						#if defined(_SPECULAR_SETUP)
							outEmission = LightingStandardSpecular_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
						#else
							outEmission = LightingStandard_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
						#endif
					#endif

					#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
						outShadowMask = UnityGetRawBakedOcclusions( IN.ambientOrLightmapUV.xy, float3( 0, 0, 0 ) );
					#endif
					#ifndef UNITY_HDR_ON
						outEmission.rgb = exp2(-outEmission.rgb);
					#endif
				}
			ENDCG
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }
			Cull Off

			CGPROGRAM
				#define ASE_GEOMETRY 1
				#define ASE_FRAGMENT_NORMAL 0
				#define ASE_NEEDS_FRAG_SHADOWCOORDS
				#pragma multi_compile_instancing
				#pragma multi_compile __ LOD_FADE_CROSSFADE
				#pragma multi_compile_fog
				#define ASE_VERSION 19802
				#define ASE_USING_SAMPLING_MACROS 1

				#pragma vertex vert
				#pragma fragment frag
				#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
				#pragma shader_feature EDITOR_VISUALIZATION
				#ifndef UNITY_PASS_META
					#define UNITY_PASS_META
				#endif
				#include "HLSLSupport.cginc"
				#ifdef ASE_GEOMETRY
					#ifndef UNITY_INSTANCED_LOD_FADE
						#define UNITY_INSTANCED_LOD_FADE
					#endif
					#ifndef UNITY_INSTANCED_SH
						#define UNITY_INSTANCED_SH
					#endif
					#ifndef UNITY_INSTANCED_LIGHTMAPSTS
						#define UNITY_INSTANCED_LIGHTMAPSTS
					#endif
				#endif
				#include "UnityShaderVariables.cginc"
				#include "UnityCG.cginc"
				#include "Lighting.cginc"
				#include "UnityPBSLighting.cginc"
				#include "UnityMetaPass.cginc"

				#define ASE_NEEDS_TEXTURE_COORDINATES0
				#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
				#define ASE_NEEDS_TEXTURE_COORDINATES1
				#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
				#define ASE_NEEDS_VERT_POSITION
				#define ASE_NEEDS_VERT_NORMAL
				#define ASE_NEEDS_VERT_TANGENT
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
				#define ASE_NEEDS_TEXTURE_COORDINATES3
				#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
				#pragma shader_feature_local TVE_LEGACY
				#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
				#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
				#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
				#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
				#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
				#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
				#else//ASE Sampling Macros
				#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
				#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
				#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
				#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
				#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
				#endif//ASE Sampling Macros
				


				struct appdata
				{
					float4 vertex : POSITION;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord : TEXCOORD0;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					float4 ase_color : COLOR;
					float4 ase_texcoord3 : TEXCOORD3;
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					UNITY_POSITION( pos );
					#ifdef EDITOR_VISUALIZATION
						float2 vizUV : TEXCOORD1;
						float4 lightCoord : TEXCOORD2;
					#endif
					float4 ase_texcoord3 : TEXCOORD3;
					float4 ase_texcoord4 : TEXCOORD4;
					float4 ase_texcoord5 : TEXCOORD5;
					float4 ase_texcoord6 : TEXCOORD6;
					float4 ase_texcoord7 : TEXCOORD7;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				#ifdef ASE_TESSELLATION
					float _TessPhongStrength;
					float _TessValue;
					float _TessMin;
					float _TessMax;
					float _TessEdgeLength;
					float _TessMaxDisp;
				#endif

				uniform half TVE_DEBUG_Layer;
				uniform half TVE_DEBUG_Index;
				uniform half TVE_DEBUG_Type;
				uniform half TVE_DEBUG_Min;
				uniform half TVE_DEBUG_Clip;
				uniform half TVE_DEBUG_Max;
				uniform half TVE_DEBUG_Filter;
				uniform half TVE_DEBUG_Shading;
				uniform half _Banner;
				uniform half _Message;
				uniform float _IsSimpleShader;
				uniform float _IsVertexShader;
				uniform half _IsTVEShader;
				uniform float _IsCoreShader;
				uniform float _IsBlanketShader;
				uniform float _IsImpostorShader;
				uniform float _IsPolygonalShader;
				uniform float _IsLiteShader;
				uniform float _IsStandardShader;
				uniform float _IsSubsurfaceShader;
				uniform float _IsCustomShader;
				uniform float _IsIdentifier;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
				uniform half4 _main_coord_value;
				SamplerState sampler_MainAlbedoTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
				SamplerState sampler_MainNormalTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
				SamplerState sampler_MainMaskTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
				uniform half _DetailCoordMode;
				uniform half4 _SecondUVs;
				SamplerState sampler_SecondAlbedoTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
				SamplerState sampler_SecondNormalTex;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
				SamplerState sampler_SecondMaskTex;
				uniform float _DetailMode;
				UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
				uniform half4 _EmissiveUVs;
				SamplerState sampler_EmissiveTex;
				uniform float4 _EmissiveColor;
				uniform float _EmissiveCat;
				float4 _MainAlbedoTex_TexelSize;
				float4 _MainNormalTex_TexelSize;
				float4 _MainMaskTex_TexelSize;
				float4 _SecondAlbedoTex_TexelSize;
				float4 _SecondMaskTex_TexelSize;
				float4 _EmissiveTex_TexelSize;
				uniform float4 _MainAlbedoTex_ST;
				UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_DEBUG_MipTex);
				SamplerState samplerTVE_DEBUG_MipTex;
				uniform float4 _MainNormalTex_ST;
				uniform float4 _MainMaskTex_ST;
				uniform float4 _SecondAlbedoTex_ST;
				uniform float4 _SecondMaskTex_ST;
				uniform float4 _EmissiveTex_ST;
				uniform float TVE_CoatLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatBaseTex);
				uniform half4 TVE_RenderBaseCoords;
				SamplerState sampler_Linear_Clamp;
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatNearTex);
				uniform half4 TVE_RenderNearCoords;
				SamplerState sampler_Linear_Repeat;
				uniform float4 TVE_RenderNearPositionR;
				uniform half TVE_RenderNearFadeValue;
				uniform half4 TVE_CoatParams;
				uniform float TVE_PaintLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintNearTex);
				uniform half4 TVE_PaintParams;
				uniform float TVE_GlowLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowNearTex);
				uniform half4 TVE_GlowParams;
				uniform float TVE_AtmoLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoNearTex);
				uniform half4 TVE_AtmoParams;
				uniform float TVE_FormLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormNearTex);
				uniform half4 TVE_FormParams;
				uniform float TVE_FlowLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowNearTex);
				uniform half4 TVE_FlowParams;
				uniform float TVE_PushLayers[10];
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushBaseTex);
				UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushNearTex);
				uniform half4 TVE_PushParams;
				uniform half4 _object_phase_mode;
				uniform half4 _motion_base_vert_mode;
				uniform half _ObjectHeightValue;
				uniform half4 _motion_base_proc_mode;
				uniform half _ObjectRadiusValue;
				uniform half _motion_base_mask_mode;
				uniform half4 _MotionBaseMaskRemap;
				uniform half _MotionBaseMaskMode;
				uniform half4 _motion_small_vert_mode;
				uniform half4 _motion_small_proc_mode;
				uniform half _motion_small_mask_mode;
				uniform half4 _MotionSmallMaskRemap;
				uniform half _MotionSmallMaskMode;
				uniform half4 _motion_tiny_vert_mode;
				uniform half4 _motion_tiny_proc_mode;
				uniform half _motion_tiny_mask_mode;
				uniform half4 _MotionTinyMaskRemap;
				uniform half _MotionTinyMaskMode;
				uniform float _RenderClip;
				uniform float _MainAlphaClipValue;
				uniform float _IsElementShader;
				uniform float _IsHelperShader;


				float3 HSVToRGB( float3 c )
				{
					float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
					float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
					return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
				}
				
				float2 DecodeFloatToVector2( float enc )
				{
					float2 result ;
					result.y = enc % 2048;
					result.x = floor(enc / 2048);
					return result / (2048 - 1);
				}
				

				v2f VertexFunction( appdata v  )
				{
					UNITY_SETUP_INSTANCE_ID(v);
					v2f o;
					UNITY_INITIALIZE_OUTPUT(v2f,o);
					UNITY_TRANSFER_INSTANCE_ID(v,o);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

					float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( v.vertex ).xyz, 1 ) ).xyz;
					o.ase_texcoord5.xyz = ase_positionWS;
					float Debug_Index464_g127014 = TVE_DEBUG_Index;
					float3 ifLocalVar40_g127015 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127015 = saturate( v.vertex.xyz );
					float3 ifLocalVar40_g127022 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127022 = v.normal;
					float3 ifLocalVar40_g127028 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127028 = v.tangent.xyz;
					float ifLocalVar40_g127020 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127020 = saturate( v.tangent.w );
					float ifLocalVar40_g127064 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127064 = v.ase_color.r;
					float ifLocalVar40_g127065 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127065 = v.ase_color.g;
					float ifLocalVar40_g127066 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127066 = v.ase_color.b;
					float ifLocalVar40_g127067 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127067 = v.ase_color.a;
					float3 appendResult1147_g127014 = (float3(v.texcoord.xyzw.x , v.texcoord.xyzw.y , 0.0));
					float3 ifLocalVar40_g127068 = 0;
					if( Debug_Index464_g127014 == 9.0 )
					ifLocalVar40_g127068 = appendResult1147_g127014;
					float3 appendResult1148_g127014 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
					float3 ifLocalVar40_g127069 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127069 = appendResult1148_g127014;
					float3 appendResult1149_g127014 = (float3(v.texcoord2.xyzw.x , v.texcoord2.xyzw.y , 0.0));
					float3 ifLocalVar40_g127089 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127089 = appendResult1149_g127014;
					float4 break33_g127087 = _object_phase_mode;
					float temp_output_30_0_g127087 = ( v.ase_color.r * break33_g127087.x );
					float temp_output_29_0_g127087 = ( v.ase_color.g * break33_g127087.y );
					float temp_output_31_0_g127087 = ( v.ase_color.b * break33_g127087.z );
					float temp_output_28_0_g127087 = ( temp_output_30_0_g127087 + temp_output_29_0_g127087 + temp_output_31_0_g127087 + ( v.ase_color.a * break33_g127087.w ) );
					half Motion_PhaseMask1725_g127014 = temp_output_28_0_g127087;
					float3 hsvTorgb260_g127014 = HSVToRGB( float3(Motion_PhaseMask1725_g127014,1.0,1.0) );
					float3 gammaToLinear266_g127014 = GammaToLinearSpace( hsvTorgb260_g127014 );
					float3 ifLocalVar40_g127090 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127090 = gammaToLinear266_g127014;
					float4 break1821_g127014 = v.ase_color;
					float4 break33_g127586 = _motion_base_vert_mode;
					float temp_output_30_0_g127586 = ( break1821_g127014.r * break33_g127586.x );
					float temp_output_29_0_g127586 = ( break1821_g127014.g * break33_g127586.y );
					float temp_output_31_0_g127586 = ( break1821_g127014.b * break33_g127586.z );
					float temp_output_28_0_g127586 = ( temp_output_30_0_g127586 + temp_output_29_0_g127586 + temp_output_31_0_g127586 + ( break1821_g127014.a * break33_g127586.w ) );
					float temp_output_1824_0_g127014 = temp_output_28_0_g127586;
					half Bounds_Height1700_g127014 = _ObjectHeightValue;
					half Final_HeightMask1815_g127014 = saturate( ( v.vertex.xyz.y / Bounds_Height1700_g127014 ) );
					float4 break33_g127590 = _motion_base_proc_mode;
					float temp_output_30_0_g127590 = ( Final_HeightMask1815_g127014 * break33_g127590.x );
					half Bounds_Radius1702_g127014 = _ObjectRadiusValue;
					half Final_SphereMask1816_g127014 = saturate( ( length( v.vertex.xyz ) / ( Bounds_Height1700_g127014 * Bounds_Radius1702_g127014 ) ) );
					float temp_output_29_0_g127590 = ( Final_SphereMask1816_g127014 * break33_g127590.y );
					float temp_output_1834_0_g127014 = ( temp_output_30_0_g127590 + temp_output_29_0_g127590 );
					float lerpResult1887_g127014 = lerp( temp_output_1824_0_g127014 , temp_output_1834_0_g127014 , _motion_base_mask_mode);
					float clampResult17_g127583 = clamp( lerpResult1887_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127584 = _MotionBaseMaskRemap.x;
					float temp_output_9_0_g127584 = ( clampResult17_g127583 - temp_output_7_0_g127584 );
					float temp_output_6_0_g127585 = saturate( ( ( temp_output_9_0_g127584 / ( _MotionBaseMaskRemap.y - temp_output_7_0_g127584 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127585 = ( temp_output_6_0_g127585 + _MotionBaseMaskMode );
					#else
					float staticSwitch14_g127585 = temp_output_6_0_g127585;
					#endif
					half Motion_BaseMask1675_g127014 = staticSwitch14_g127585;
					float ifLocalVar40_g127091 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127091 = Motion_BaseMask1675_g127014;
					float4 break1855_g127014 = v.ase_color;
					float4 break33_g127587 = _motion_small_vert_mode;
					float temp_output_30_0_g127587 = ( break1855_g127014.r * break33_g127587.x );
					float temp_output_29_0_g127587 = ( break1855_g127014.g * break33_g127587.y );
					float temp_output_31_0_g127587 = ( break1855_g127014.b * break33_g127587.z );
					float temp_output_28_0_g127587 = ( temp_output_30_0_g127587 + temp_output_29_0_g127587 + temp_output_31_0_g127587 + ( break1855_g127014.a * break33_g127587.w ) );
					float temp_output_1845_0_g127014 = temp_output_28_0_g127587;
					float4 break33_g127591 = _motion_small_proc_mode;
					float temp_output_30_0_g127591 = ( Final_HeightMask1815_g127014 * break33_g127591.x );
					float temp_output_29_0_g127591 = ( Final_SphereMask1816_g127014 * break33_g127591.y );
					float temp_output_1849_0_g127014 = ( temp_output_30_0_g127591 + temp_output_29_0_g127591 );
					float lerpResult1889_g127014 = lerp( temp_output_1845_0_g127014 , temp_output_1849_0_g127014 , _motion_small_mask_mode);
					float enc1882_g127014 = v.texcoord.xyzw.z;
					float2 localDecodeFloatToVector21882_g127014 = DecodeFloatToVector2( enc1882_g127014 );
					float2 break1878_g127014 = localDecodeFloatToVector21882_g127014;
					half Small_Mask_Legacy1879_g127014 = break1878_g127014.x;
					#ifdef TVE_LEGACY
					float staticSwitch1883_g127014 = Small_Mask_Legacy1879_g127014;
					#else
					float staticSwitch1883_g127014 = lerpResult1889_g127014;
					#endif
					float clampResult17_g127593 = clamp( staticSwitch1883_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127594 = _MotionSmallMaskRemap.x;
					float temp_output_9_0_g127594 = ( clampResult17_g127593 - temp_output_7_0_g127594 );
					float temp_output_6_0_g127595 = saturate( ( ( temp_output_9_0_g127594 / ( _MotionSmallMaskRemap.y - temp_output_7_0_g127594 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127595 = ( temp_output_6_0_g127595 + _MotionSmallMaskMode );
					#else
					float staticSwitch14_g127595 = temp_output_6_0_g127595;
					#endif
					half Motion_SmallMask1693_g127014 = staticSwitch14_g127595;
					float ifLocalVar40_g127092 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127092 = Motion_SmallMask1693_g127014;
					float4 break1867_g127014 = v.ase_color;
					float4 break33_g127588 = _motion_tiny_vert_mode;
					float temp_output_30_0_g127588 = ( break1867_g127014.r * break33_g127588.x );
					float temp_output_29_0_g127588 = ( break1867_g127014.g * break33_g127588.y );
					float temp_output_31_0_g127588 = ( break1867_g127014.b * break33_g127588.z );
					float temp_output_28_0_g127588 = ( temp_output_30_0_g127588 + temp_output_29_0_g127588 + temp_output_31_0_g127588 + ( break1867_g127014.a * break33_g127588.w ) );
					float temp_output_1860_0_g127014 = temp_output_28_0_g127588;
					float4 break33_g127592 = _motion_tiny_proc_mode;
					float temp_output_30_0_g127592 = ( Final_HeightMask1815_g127014 * break33_g127592.x );
					float temp_output_29_0_g127592 = ( Final_SphereMask1816_g127014 * break33_g127592.y );
					float temp_output_1864_0_g127014 = ( temp_output_30_0_g127592 + temp_output_29_0_g127592 );
					float lerpResult1891_g127014 = lerp( temp_output_1860_0_g127014 , temp_output_1864_0_g127014 , _motion_tiny_mask_mode);
					half Tiny_Mask_Legacy1880_g127014 = break1878_g127014.y;
					#ifdef TVE_LEGACY
					float staticSwitch1886_g127014 = Tiny_Mask_Legacy1880_g127014;
					#else
					float staticSwitch1886_g127014 = lerpResult1891_g127014;
					#endif
					float clampResult17_g127596 = clamp( staticSwitch1886_g127014 , 0.0001 , 0.9999 );
					float temp_output_7_0_g127597 = _MotionTinyMaskRemap.x;
					float temp_output_9_0_g127597 = ( clampResult17_g127596 - temp_output_7_0_g127597 );
					float temp_output_6_0_g127598 = saturate( ( ( temp_output_9_0_g127597 / ( _MotionTinyMaskRemap.y - temp_output_7_0_g127597 ) ) + 0.0001 ) );
					#ifdef TVE_DUMMY
					float staticSwitch14_g127598 = ( temp_output_6_0_g127598 + _MotionTinyMaskMode );
					#else
					float staticSwitch14_g127598 = temp_output_6_0_g127598;
					#endif
					half Motion_TinyMask1717_g127014 = staticSwitch14_g127598;
					float ifLocalVar40_g127093 = 0;
					if( Debug_Index464_g127014 == 15.0 )
					ifLocalVar40_g127093 = Motion_TinyMask1717_g127014;
					float3 appendResult60_g127088 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
					float3 ifLocalVar40_g127094 = 0;
					if( Debug_Index464_g127014 == 16.0 )
					ifLocalVar40_g127094 = appendResult60_g127088;
					float3 vertexToFrag328_g127014 = ( ( ifLocalVar40_g127015 + ifLocalVar40_g127022 + ifLocalVar40_g127028 + ifLocalVar40_g127020 ) + ( ifLocalVar40_g127064 + ifLocalVar40_g127065 + ifLocalVar40_g127066 + ifLocalVar40_g127067 ) + ( ifLocalVar40_g127068 + ifLocalVar40_g127069 + ifLocalVar40_g127089 ) + ( ifLocalVar40_g127090 + ifLocalVar40_g127091 + ifLocalVar40_g127092 + ifLocalVar40_g127093 + ifLocalVar40_g127094 ) );
					o.ase_texcoord6.xyz = vertexToFrag328_g127014;
					float3 ase_normalWS = UnityObjectToWorldNormal( v.normal );
					o.ase_texcoord7.xyz = ase_normalWS;
					
					o.ase_texcoord3 = v.texcoord.xyzw;
					o.ase_texcoord4 = v.texcoord1.xyzw;
					
					//setting value to unused interpolator channels and avoid initialization warnings
					o.ase_texcoord5.w = 0;
					o.ase_texcoord6.w = 0;
					o.ase_texcoord7.w = 0;

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = defaultVertexValue;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = v.normal;
					v.tangent = v.tangent;

					#ifdef EDITOR_VISUALIZATION
						o.vizUV = 0;
						o.lightCoord = 0;
						if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
							o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.texcoord.xy, v.texcoord1.xy, v.texcoord2.xy, unity_EditorViz_Texture_ST);
						else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
						{
							o.vizUV = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
							o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
						}
					#endif

					o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
					return o;
				}

				#if defined(ASE_TESSELLATION)
				struct VertexControl
				{
					float4 vertex : INTERNALTESSPOS;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					float4 ase_color : COLOR;
					float4 ase_texcoord3 : TEXCOORD3;

					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct TessellationFactors
				{
					float edge[3] : SV_TessFactor;
					float inside : SV_InsideTessFactor;
				};

				VertexControl vert ( appdata v )
				{
					VertexControl o;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_TRANSFER_INSTANCE_ID(v, o);
					o.vertex = v.vertex;
					o.tangent = v.tangent;
					o.normal = v.normal;
					o.texcoord1 = v.texcoord1;
					o.texcoord2 = v.texcoord2;
					o.texcoord = v.texcoord;
					o.ase_color = v.ase_color;
					o.ase_texcoord3 = v.ase_texcoord3;
					return o;
				}

				TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
				{
					TessellationFactors o;
					float4 tf = 1;
					float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
					float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
					#if defined(ASE_FIXED_TESSELLATION)
					tf = FixedTess( tessValue );
					#elif defined(ASE_DISTANCE_TESSELLATION)
					tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
					#elif defined(ASE_LENGTH_TESSELLATION)
					tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
					#elif defined(ASE_LENGTH_CULL_TESSELLATION)
					tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
					#endif
					o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
					return o;
				}

				[domain("tri")]
				[partitioning("fractional_odd")]
				[outputtopology("triangle_cw")]
				[patchconstantfunc("TessellationFunction")]
				[outputcontrolpoints(3)]
				VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
				{
				   return patch[id];
				}

				[domain("tri")]
				v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
				{
					appdata o = (appdata) 0;
					o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
					o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
					o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
					o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
					o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
					o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
					o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
					o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
					#if defined(ASE_PHONG_TESSELLATION)
					float3 pp[3];
					for (int i = 0; i < 3; ++i)
						pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
					float phongStrength = _TessPhongStrength;
					o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
					#endif
					UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
					return VertexFunction(o);
				}
				#else
				v2f vert( appdata v )
				{
					return VertexFunction( v );
				}
				#endif

				half4 frag( v2f IN , bool ase_vface : SV_IsFrontFace ) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID(IN);

					#ifdef LOD_FADE_CROSSFADE
						UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
					#endif

					#if defined(ASE_LIGHTING_SIMPLE)
						SurfaceOutput o = (SurfaceOutput)0;
					#else
						#if defined(_SPECULAR_SETUP)
							SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
						#else
							SurfaceOutputStandard o = (SurfaceOutputStandard)0;
						#endif
					#endif

					float3 temp_cast_0 = (0.0).xxx;
					
					float4 color690_g127014 = IsGammaSpace() ? float4( 0.1, 0.1, 0.1, 0 ) : float4( 0.01002283, 0.01002283, 0.01002283, 0 );
					float4 Shading_Inactive1492_g127014 = color690_g127014;
					float Debug_Type367_g127014 = TVE_DEBUG_Type;
					float4 color646_g127014 = IsGammaSpace() ? float4( 0.9245283, 0.7969696, 0.4142933, 1 ) : float4( 0.8368256, 0.5987038, 0.1431069, 1 );
					float4 Output_Converted717_g127014 = color646_g127014;
					float4 ifLocalVar40_g127075 = 0;
					if( Debug_Type367_g127014 == 0.0 )
					ifLocalVar40_g127075 = Output_Converted717_g127014;
					float4 color1529_g127014 = IsGammaSpace() ? float4( 0.9254902, 0.7960784, 0.4156863, 1 ) : float4( 0.8387991, 0.5972018, 0.1441285, 1 );
					float _IsCoreShader1551_g127014 = _IsCoreShader;
					float4 color1539_g127014 = IsGammaSpace() ? float4( 0.6196079, 0.7686275, 0.1490196, 0 ) : float4( 0.3419145, 0.5520116, 0.01938236, 0 );
					float _IsBlanketShader1554_g127014 = _IsBlanketShader;
					float4 color1542_g127014 = IsGammaSpace() ? float4( 0.9716981, 0.3162602, 0.4816265, 0 ) : float4( 0.9368213, 0.08154967, 0.1974273, 0 );
					float _IsImpostorShader1110_g127014 = _IsImpostorShader;
					float4 color1544_g127014 = IsGammaSpace() ? float4( 0.3254902, 0.6117647, 0.8117647, 0 ) : float4( 0.08650047, 0.3324516, 0.6239604, 0 );
					float _IsPolygonalShader1112_g127014 = _IsPolygonalShader;
					float4 color1649_g127014 = IsGammaSpace() ? float4( 0.6, 0.6, 0.6, 0 ) : float4( 0.3185468, 0.3185468, 0.3185468, 0 );
					float _IsLiteShader1648_g127014 = _IsLiteShader;
					float4 Output_Scope1531_g127014 = ( ( color1529_g127014 * _IsCoreShader1551_g127014 ) + ( color1539_g127014 * _IsBlanketShader1554_g127014 ) + ( color1542_g127014 * _IsImpostorShader1110_g127014 ) + ( color1544_g127014 * _IsPolygonalShader1112_g127014 ) + ( color1649_g127014 * _IsLiteShader1648_g127014 ) );
					float4 ifLocalVar40_g127077 = 0;
					if( Debug_Type367_g127014 == 2.0 )
					ifLocalVar40_g127077 = Output_Scope1531_g127014;
					float4 color529_g127014 = IsGammaSpace() ? float4( 0.62, 0.77, 0.15, 0 ) : float4( 0.3423916, 0.5542217, 0.01960665, 0 );
					float _IsVertexShader1158_g127014 = _IsVertexShader;
					float4 color544_g127014 = IsGammaSpace() ? float4( 0.3252937, 0.6122813, 0.8113208, 0 ) : float4( 0.08639329, 0.3330702, 0.6231937, 0 );
					float _IsSimpleShader359_g127014 = _IsSimpleShader;
					float4 color521_g127014 = IsGammaSpace() ? float4( 0.6566009, 0.3404236, 0.8490566, 0 ) : float4( 0.3886527, 0.09487338, 0.6903409, 0 );
					float _IsStandardShader344_g127014 = _IsStandardShader;
					float4 color1121_g127014 = IsGammaSpace() ? float4( 0.9716981, 0.88463, 0.1787558, 0 ) : float4( 0.9368213, 0.7573396, 0.02686729, 0 );
					float _IsSubsurfaceShader548_g127014 = _IsSubsurfaceShader;
					float4 Output_Lighting525_g127014 = ( ( color529_g127014 * _IsVertexShader1158_g127014 ) + ( color544_g127014 * _IsSimpleShader359_g127014 ) + ( color521_g127014 * _IsStandardShader344_g127014 ) + ( color1121_g127014 * _IsSubsurfaceShader548_g127014 ) );
					float4 ifLocalVar40_g127078 = 0;
					if( Debug_Type367_g127014 == 3.0 )
					ifLocalVar40_g127078 = Output_Lighting525_g127014;
					float4 color1559_g127014 = IsGammaSpace() ? float4( 0.9245283, 0.7969696, 0.4142933, 1 ) : float4( 0.8368256, 0.5987038, 0.1431069, 1 );
					float4 color1563_g127014 = IsGammaSpace() ? float4( 0.3053578, 0.8867924, 0.5362216, 0 ) : float4( 0.0759199, 0.7615293, 0.2491121, 0 );
					float _IsCustomShader1570_g127014 = _IsCustomShader;
					float4 lerpResult1561_g127014 = lerp( color1559_g127014 , color1563_g127014 , _IsCustomShader1570_g127014);
					float4 Output_Custom1560_g127014 = lerpResult1561_g127014;
					float4 ifLocalVar40_g127079 = 0;
					if( Debug_Type367_g127014 == 4.0 )
					ifLocalVar40_g127079 = Output_Custom1560_g127014;
					float3 hsvTorgb1452_g127014 = HSVToRGB( float3(( _IsIdentifier / 1000.0 ),1.0,1.0) );
					float3 gammaToLinear1453_g127014 = GammaToLinearSpace( hsvTorgb1452_g127014 );
					float4 appendResult1657_g127014 = (float4(gammaToLinear1453_g127014 , 1.0));
					float4 Output_Sharing1355_g127014 = appendResult1657_g127014;
					float4 ifLocalVar40_g127080 = 0;
					if( Debug_Type367_g127014 == 5.0 )
					ifLocalVar40_g127080 = Output_Sharing1355_g127014;
					float Debug_Index464_g127014 = TVE_DEBUG_Index;
					half2 Main_UVs1219_g127014 = ( ( IN.ase_texcoord3.xy * (_main_coord_value).xy ) + (_main_coord_value).zw );
					float4 tex2DNode586_g127014 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 );
					float3 appendResult637_g127014 = (float3(tex2DNode586_g127014.r , tex2DNode586_g127014.g , tex2DNode586_g127014.b));
					float3 ifLocalVar40_g127021 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127021 = appendResult637_g127014;
					float ifLocalVar40_g127025 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127025 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 ).a;
					float4 tex2DNode604_g127014 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, Main_UVs1219_g127014 );
					float3 appendResult876_g127014 = (float3(tex2DNode604_g127014.a , tex2DNode604_g127014.g , 1.0));
					float3 gammaToLinear878_g127014 = GammaToLinearSpace( appendResult876_g127014 );
					float3 ifLocalVar40_g127029 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127029 = gammaToLinear878_g127014;
					float ifLocalVar40_g127017 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127017 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).r;
					float ifLocalVar40_g127035 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127035 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).g;
					float ifLocalVar40_g127026 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127026 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).b;
					float ifLocalVar40_g127016 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127016 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).a;
					float2 appendResult1251_g127014 = (float2(IN.ase_texcoord4.z , IN.ase_texcoord4.w));
					float2 Mesh_DetailCoord1254_g127014 = appendResult1251_g127014;
					float2 lerpResult1231_g127014 = lerp( IN.ase_texcoord3.xy , Mesh_DetailCoord1254_g127014 , _DetailCoordMode);
					half2 Layer_02_UVs1234_g127014 = ( ( lerpResult1231_g127014 * (_SecondUVs).xy ) + (_SecondUVs).zw );
					float4 tex2DNode854_g127014 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 );
					float3 appendResult839_g127014 = (float3(tex2DNode854_g127014.r , tex2DNode854_g127014.g , tex2DNode854_g127014.b));
					float3 ifLocalVar40_g127019 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127019 = appendResult839_g127014;
					float ifLocalVar40_g127027 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127027 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 ).a;
					float4 tex2DNode841_g127014 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondNormalTex, Layer_02_UVs1234_g127014 );
					float3 appendResult880_g127014 = (float3(tex2DNode841_g127014.a , tex2DNode841_g127014.g , 1.0));
					float3 gammaToLinear879_g127014 = GammaToLinearSpace( appendResult880_g127014 );
					float3 ifLocalVar40_g127034 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127034 = gammaToLinear879_g127014;
					float ifLocalVar40_g127030 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127030 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).r;
					float ifLocalVar40_g127024 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127024 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).g;
					float ifLocalVar40_g127032 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127032 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).b;
					float ifLocalVar40_g127033 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127033 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).a;
					half2 Emissive_UVs1245_g127014 = ( ( IN.ase_texcoord3.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
					float4 tex2DNode858_g127014 = SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs1245_g127014 );
					float ifLocalVar40_g127023 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127023 = tex2DNode858_g127014.r;
					float Debug_Min721_g127014 = TVE_DEBUG_Min;
					float temp_output_7_0_g127031 = Debug_Min721_g127014;
					float4 temp_cast_4 = (temp_output_7_0_g127031).xxxx;
					float4 temp_output_9_0_g127031 = ( ( float4( ( ( ifLocalVar40_g127021 + ifLocalVar40_g127025 + ifLocalVar40_g127029 ) + ( ifLocalVar40_g127017 + ifLocalVar40_g127035 + ifLocalVar40_g127026 + ifLocalVar40_g127016 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g127019 + ifLocalVar40_g127027 + ifLocalVar40_g127034 ) + ( ifLocalVar40_g127030 + ifLocalVar40_g127024 + ifLocalVar40_g127032 + ifLocalVar40_g127033 ) ) * _DetailMode ) , 0.0 ) + ( ( ifLocalVar40_g127023 * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_4 );
					float Debug_Max723_g127014 = TVE_DEBUG_Max;
					float4 Output_Maps561_g127014 = saturate( ( ( temp_output_9_0_g127031 / ( Debug_Max723_g127014 - temp_output_7_0_g127031 ) ) + 0.0001 ) );
					float4 ifLocalVar40_g127081 = 0;
					if( Debug_Type367_g127014 == 6.0 )
					ifLocalVar40_g127081 = Output_Maps561_g127014;
					float Resolution44_g127052 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
					float4 color62_g127052 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127052 = 0;
					if( Resolution44_g127052 <= 256.0 )
					ifLocalVar61_g127052 = color62_g127052;
					float4 color55_g127052 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127052 = 0;
					if( Resolution44_g127052 == 512.0 )
					ifLocalVar56_g127052 = color55_g127052;
					float4 color42_g127052 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127052 = 0;
					if( Resolution44_g127052 == 1024.0 )
					ifLocalVar40_g127052 = color42_g127052;
					float4 color48_g127052 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127052 = 0;
					if( Resolution44_g127052 == 2048.0 )
					ifLocalVar47_g127052 = color48_g127052;
					float4 color51_g127052 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127052 = 0;
					if( Resolution44_g127052 >= 4096.0 )
					ifLocalVar52_g127052 = color51_g127052;
					float4 ifLocalVar40_g127038 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127038 = ( ifLocalVar61_g127052 + ifLocalVar56_g127052 + ifLocalVar40_g127052 + ifLocalVar47_g127052 + ifLocalVar52_g127052 );
					float Resolution44_g127051 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
					float4 color62_g127051 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127051 = 0;
					if( Resolution44_g127051 <= 256.0 )
					ifLocalVar61_g127051 = color62_g127051;
					float4 color55_g127051 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127051 = 0;
					if( Resolution44_g127051 == 512.0 )
					ifLocalVar56_g127051 = color55_g127051;
					float4 color42_g127051 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127051 = 0;
					if( Resolution44_g127051 == 1024.0 )
					ifLocalVar40_g127051 = color42_g127051;
					float4 color48_g127051 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127051 = 0;
					if( Resolution44_g127051 == 2048.0 )
					ifLocalVar47_g127051 = color48_g127051;
					float4 color51_g127051 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127051 = 0;
					if( Resolution44_g127051 >= 4096.0 )
					ifLocalVar52_g127051 = color51_g127051;
					float4 ifLocalVar40_g127036 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127036 = ( ifLocalVar61_g127051 + ifLocalVar56_g127051 + ifLocalVar40_g127051 + ifLocalVar47_g127051 + ifLocalVar52_g127051 );
					float Resolution44_g127050 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
					float4 color62_g127050 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127050 = 0;
					if( Resolution44_g127050 <= 256.0 )
					ifLocalVar61_g127050 = color62_g127050;
					float4 color55_g127050 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127050 = 0;
					if( Resolution44_g127050 == 512.0 )
					ifLocalVar56_g127050 = color55_g127050;
					float4 color42_g127050 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127050 = 0;
					if( Resolution44_g127050 == 1024.0 )
					ifLocalVar40_g127050 = color42_g127050;
					float4 color48_g127050 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127050 = 0;
					if( Resolution44_g127050 == 2048.0 )
					ifLocalVar47_g127050 = color48_g127050;
					float4 color51_g127050 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127050 = 0;
					if( Resolution44_g127050 >= 4096.0 )
					ifLocalVar52_g127050 = color51_g127050;
					float4 ifLocalVar40_g127037 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127037 = ( ifLocalVar61_g127050 + ifLocalVar56_g127050 + ifLocalVar40_g127050 + ifLocalVar47_g127050 + ifLocalVar52_g127050 );
					float Resolution44_g127057 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 color62_g127057 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127057 = 0;
					if( Resolution44_g127057 <= 256.0 )
					ifLocalVar61_g127057 = color62_g127057;
					float4 color55_g127057 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127057 = 0;
					if( Resolution44_g127057 == 512.0 )
					ifLocalVar56_g127057 = color55_g127057;
					float4 color42_g127057 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127057 = 0;
					if( Resolution44_g127057 == 1024.0 )
					ifLocalVar40_g127057 = color42_g127057;
					float4 color48_g127057 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127057 = 0;
					if( Resolution44_g127057 == 2048.0 )
					ifLocalVar47_g127057 = color48_g127057;
					float4 color51_g127057 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127057 = 0;
					if( Resolution44_g127057 >= 4096.0 )
					ifLocalVar52_g127057 = color51_g127057;
					float4 ifLocalVar40_g127044 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127044 = ( ifLocalVar61_g127057 + ifLocalVar56_g127057 + ifLocalVar40_g127057 + ifLocalVar47_g127057 + ifLocalVar52_g127057 );
					float Resolution44_g127056 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
					float4 color62_g127056 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127056 = 0;
					if( Resolution44_g127056 <= 256.0 )
					ifLocalVar61_g127056 = color62_g127056;
					float4 color55_g127056 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127056 = 0;
					if( Resolution44_g127056 == 512.0 )
					ifLocalVar56_g127056 = color55_g127056;
					float4 color42_g127056 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127056 = 0;
					if( Resolution44_g127056 == 1024.0 )
					ifLocalVar40_g127056 = color42_g127056;
					float4 color48_g127056 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127056 = 0;
					if( Resolution44_g127056 == 2048.0 )
					ifLocalVar47_g127056 = color48_g127056;
					float4 color51_g127056 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127056 = 0;
					if( Resolution44_g127056 >= 4096.0 )
					ifLocalVar52_g127056 = color51_g127056;
					float4 ifLocalVar40_g127042 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127042 = ( ifLocalVar61_g127056 + ifLocalVar56_g127056 + ifLocalVar40_g127056 + ifLocalVar47_g127056 + ifLocalVar52_g127056 );
					float Resolution44_g127058 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 color62_g127058 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127058 = 0;
					if( Resolution44_g127058 <= 256.0 )
					ifLocalVar61_g127058 = color62_g127058;
					float4 color55_g127058 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127058 = 0;
					if( Resolution44_g127058 == 512.0 )
					ifLocalVar56_g127058 = color55_g127058;
					float4 color42_g127058 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127058 = 0;
					if( Resolution44_g127058 == 1024.0 )
					ifLocalVar40_g127058 = color42_g127058;
					float4 color48_g127058 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127058 = 0;
					if( Resolution44_g127058 == 2048.0 )
					ifLocalVar47_g127058 = color48_g127058;
					float4 color51_g127058 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127058 = 0;
					if( Resolution44_g127058 >= 4096.0 )
					ifLocalVar52_g127058 = color51_g127058;
					float4 ifLocalVar40_g127043 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127043 = ( ifLocalVar61_g127058 + ifLocalVar56_g127058 + ifLocalVar40_g127058 + ifLocalVar47_g127058 + ifLocalVar52_g127058 );
					float Resolution44_g127055 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
					float4 color62_g127055 = IsGammaSpace() ? float4( 0.484069, 0.862666, 0.9245283, 0 ) : float4( 0.1995908, 0.7155456, 0.8368256, 0 );
					float4 ifLocalVar61_g127055 = 0;
					if( Resolution44_g127055 <= 256.0 )
					ifLocalVar61_g127055 = color62_g127055;
					float4 color55_g127055 = IsGammaSpace() ? float4( 0.1933962, 0.7383016, 1, 0 ) : float4( 0.03108436, 0.5044825, 1, 0 );
					float4 ifLocalVar56_g127055 = 0;
					if( Resolution44_g127055 == 512.0 )
					ifLocalVar56_g127055 = color55_g127055;
					float4 color42_g127055 = IsGammaSpace() ? float4( 0.4431373, 0.7921569, 0.1764706, 0 ) : float4( 0.1651322, 0.5906189, 0.02624122, 0 );
					float4 ifLocalVar40_g127055 = 0;
					if( Resolution44_g127055 == 1024.0 )
					ifLocalVar40_g127055 = color42_g127055;
					float4 color48_g127055 = IsGammaSpace() ? float4( 1, 0.6889491, 0.07075471, 0 ) : float4( 1, 0.4324122, 0.006068094, 0 );
					float4 ifLocalVar47_g127055 = 0;
					if( Resolution44_g127055 == 2048.0 )
					ifLocalVar47_g127055 = color48_g127055;
					float4 color51_g127055 = IsGammaSpace() ? float4( 1, 0.2066492, 0.0990566, 0 ) : float4( 1, 0.03521443, 0.009877041, 0 );
					float4 ifLocalVar52_g127055 = 0;
					if( Resolution44_g127055 >= 4096.0 )
					ifLocalVar52_g127055 = color51_g127055;
					float4 ifLocalVar40_g127045 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127045 = ( ifLocalVar61_g127055 + ifLocalVar56_g127055 + ifLocalVar40_g127055 + ifLocalVar47_g127055 + ifLocalVar52_g127055 );
					float4 Output_Resolution737_g127014 = ( ( ifLocalVar40_g127038 + ifLocalVar40_g127036 + ifLocalVar40_g127037 ) + ( ifLocalVar40_g127044 + ifLocalVar40_g127042 + ifLocalVar40_g127043 ) + ifLocalVar40_g127045 );
					float4 ifLocalVar40_g127082 = 0;
					if( Debug_Type367_g127014 == 7.0 )
					ifLocalVar40_g127082 = Output_Resolution737_g127014;
					float2 uv_MainAlbedoTex = IN.ase_texcoord3.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
					float2 UVs72_g127063 = Main_UVs1219_g127014;
					float Resolution44_g127063 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127063 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127063 * ( Resolution44_g127063 / 8.0 ) ) );
					float4 lerpResult78_g127063 = lerp( SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ) , tex2DNode77_g127063 , tex2DNode77_g127063.a);
					float4 ifLocalVar40_g127041 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127041 = lerpResult78_g127063;
					float2 uv_MainNormalTex = IN.ase_texcoord3.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
					float2 UVs72_g127054 = Main_UVs1219_g127014;
					float Resolution44_g127054 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
					float4 tex2DNode77_g127054 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127054 * ( Resolution44_g127054 / 8.0 ) ) );
					float4 lerpResult78_g127054 = lerp( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, uv_MainNormalTex ) , tex2DNode77_g127054 , tex2DNode77_g127054.a);
					float4 ifLocalVar40_g127039 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127039 = lerpResult78_g127054;
					float2 uv_MainMaskTex = IN.ase_texcoord3.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
					float2 UVs72_g127053 = Main_UVs1219_g127014;
					float Resolution44_g127053 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
					float4 tex2DNode77_g127053 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127053 * ( Resolution44_g127053 / 8.0 ) ) );
					float4 lerpResult78_g127053 = lerp( SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, uv_MainMaskTex ) , tex2DNode77_g127053 , tex2DNode77_g127053.a);
					float4 ifLocalVar40_g127040 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127040 = lerpResult78_g127053;
					float2 uv_SecondAlbedoTex = IN.ase_texcoord3.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
					float2 UVs72_g127061 = Layer_02_UVs1234_g127014;
					float Resolution44_g127061 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127061 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127061 * ( Resolution44_g127061 / 8.0 ) ) );
					float4 lerpResult78_g127061 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127061 , tex2DNode77_g127061.a);
					float4 ifLocalVar40_g127048 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127048 = lerpResult78_g127061;
					float2 uv_SecondMaskTex = IN.ase_texcoord3.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
					float2 UVs72_g127060 = Layer_02_UVs1234_g127014;
					float Resolution44_g127060 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
					float4 tex2DNode77_g127060 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127060 * ( Resolution44_g127060 / 8.0 ) ) );
					float4 lerpResult78_g127060 = lerp( SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, uv_SecondMaskTex ) , tex2DNode77_g127060 , tex2DNode77_g127060.a);
					float4 ifLocalVar40_g127046 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127046 = lerpResult78_g127060;
					float2 UVs72_g127062 = Layer_02_UVs1234_g127014;
					float Resolution44_g127062 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
					float4 tex2DNode77_g127062 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127062 * ( Resolution44_g127062 / 8.0 ) ) );
					float4 lerpResult78_g127062 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127062 , tex2DNode77_g127062.a);
					float4 ifLocalVar40_g127047 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127047 = lerpResult78_g127062;
					float2 uv_EmissiveTex = IN.ase_texcoord3.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
					float2 UVs72_g127059 = Emissive_UVs1245_g127014;
					float Resolution44_g127059 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
					float4 tex2DNode77_g127059 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127059 * ( Resolution44_g127059 / 8.0 ) ) );
					float4 lerpResult78_g127059 = lerp( SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, uv_EmissiveTex ) , tex2DNode77_g127059 , tex2DNode77_g127059.a);
					float4 ifLocalVar40_g127049 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127049 = lerpResult78_g127059;
					float4 Output_MipLevel1284_g127014 = ( ( ifLocalVar40_g127041 + ifLocalVar40_g127039 + ifLocalVar40_g127040 ) + ( ifLocalVar40_g127048 + ifLocalVar40_g127046 + ifLocalVar40_g127047 ) + ifLocalVar40_g127049 );
					float4 ifLocalVar40_g127083 = 0;
					if( Debug_Type367_g127014 == 8.0 )
					ifLocalVar40_g127083 = Output_MipLevel1284_g127014;
					float ifLocalVar40_g127582 = 0;
					if( Debug_Index464_g127014 == 0.0 )
					ifLocalVar40_g127582 = (float3( 0,0,0 )).z;
					float Debug_Layer885_g127014 = TVE_DEBUG_Layer;
					float temp_output_82_0_g127401 = Debug_Layer885_g127014;
					float temp_output_19_0_g127403 = TVE_CoatLayers[(int)temp_output_82_0_g127401];
					float3 ase_positionWS = IN.ase_texcoord5.xyz;
					float3 WorldPosition893_g127014 = ase_positionWS;
					half3 Input_Position180_g127404 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127404 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127404).xz ) );
					float temp_output_82_0_g127404 = temp_output_82_0_g127401;
					float2 temp_output_119_0_g127404 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127404).xz ) );
					float temp_output_7_0_g127409 = 1.0;
					float temp_output_9_0_g127409 = ( saturate( ( distance( Input_Position180_g127404 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127409 );
					float4 lerpResult131_g127404 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127404,temp_output_82_0_g127404), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127404,temp_output_82_0_g127404), 0.0 ) , saturate( ( temp_output_9_0_g127409 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127409 ) ) ));
					float4 temp_output_17_0_g127403 = lerpResult131_g127404;
					float4 temp_output_3_0_g127403 = TVE_CoatParams;
					float4 ifLocalVar18_g127403 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127403 >= 0.5 )
					ifLocalVar18_g127403 = temp_output_17_0_g127403;
					else
					ifLocalVar18_g127403 = temp_output_3_0_g127403;
					float4 lerpResult22_g127403 = lerp( temp_output_3_0_g127403 , temp_output_17_0_g127403 , temp_output_19_0_g127403);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127403 = lerpResult22_g127403;
					#else
					float4 staticSwitch24_g127403 = ifLocalVar18_g127403;
					#endif
					float ifLocalVar40_g127419 = 0;
					if( Debug_Index464_g127014 == 1.0 )
					ifLocalVar40_g127419 = (staticSwitch24_g127403).g;
					float temp_output_82_0_g127410 = Debug_Layer885_g127014;
					float temp_output_19_0_g127412 = TVE_CoatLayers[(int)temp_output_82_0_g127410];
					half3 Input_Position180_g127413 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127413 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127413).xz ) );
					float temp_output_82_0_g127413 = temp_output_82_0_g127410;
					float2 temp_output_119_0_g127413 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127413).xz ) );
					float temp_output_7_0_g127418 = 1.0;
					float temp_output_9_0_g127418 = ( saturate( ( distance( Input_Position180_g127413 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127418 );
					float4 lerpResult131_g127413 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127413,temp_output_82_0_g127413), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127413,temp_output_82_0_g127413), 0.0 ) , saturate( ( temp_output_9_0_g127418 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127418 ) ) ));
					float4 temp_output_17_0_g127412 = lerpResult131_g127413;
					float4 temp_output_3_0_g127412 = TVE_CoatParams;
					float4 ifLocalVar18_g127412 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127412 >= 0.5 )
					ifLocalVar18_g127412 = temp_output_17_0_g127412;
					else
					ifLocalVar18_g127412 = temp_output_3_0_g127412;
					float4 lerpResult22_g127412 = lerp( temp_output_3_0_g127412 , temp_output_17_0_g127412 , temp_output_19_0_g127412);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127412 = lerpResult22_g127412;
					#else
					float4 staticSwitch24_g127412 = ifLocalVar18_g127412;
					#endif
					float ifLocalVar40_g127420 = 0;
					if( Debug_Index464_g127014 == 2.0 )
					ifLocalVar40_g127420 = (staticSwitch24_g127412).b;
					float temp_output_82_0_g127430 = Debug_Layer885_g127014;
					float temp_output_19_0_g127432 = TVE_PaintLayers[(int)temp_output_82_0_g127430];
					half3 Input_Position180_g127433 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127433 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127433).xz ) );
					float temp_output_82_0_g127433 = temp_output_82_0_g127430;
					float2 temp_output_119_0_g127433 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127433).xz ) );
					float temp_output_7_0_g127438 = 1.0;
					float temp_output_9_0_g127438 = ( saturate( ( distance( Input_Position180_g127433 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127438 );
					float4 lerpResult131_g127433 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127433,temp_output_82_0_g127433), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127433,temp_output_82_0_g127433), 0.0 ) , saturate( ( temp_output_9_0_g127438 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127438 ) ) ));
					float4 temp_output_17_0_g127432 = lerpResult131_g127433;
					float4 temp_output_3_0_g127432 = TVE_PaintParams;
					float4 ifLocalVar18_g127432 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127432 >= 0.5 )
					ifLocalVar18_g127432 = temp_output_17_0_g127432;
					else
					ifLocalVar18_g127432 = temp_output_3_0_g127432;
					float4 lerpResult22_g127432 = lerp( temp_output_3_0_g127432 , temp_output_17_0_g127432 , temp_output_19_0_g127432);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127432 = lerpResult22_g127432;
					#else
					float4 staticSwitch24_g127432 = ifLocalVar18_g127432;
					#endif
					float3 ifLocalVar40_g127439 = 0;
					if( Debug_Index464_g127014 == 3.0 )
					ifLocalVar40_g127439 = (staticSwitch24_g127432).rgb;
					float temp_output_82_0_g127421 = Debug_Layer885_g127014;
					float temp_output_19_0_g127423 = TVE_PaintLayers[(int)temp_output_82_0_g127421];
					half3 Input_Position180_g127424 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127424 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127424).xz ) );
					float temp_output_82_0_g127424 = temp_output_82_0_g127421;
					float2 temp_output_119_0_g127424 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127424).xz ) );
					float temp_output_7_0_g127429 = 1.0;
					float temp_output_9_0_g127429 = ( saturate( ( distance( Input_Position180_g127424 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127429 );
					float4 lerpResult131_g127424 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127424,temp_output_82_0_g127424), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127424,temp_output_82_0_g127424), 0.0 ) , saturate( ( temp_output_9_0_g127429 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127429 ) ) ));
					float4 temp_output_17_0_g127423 = lerpResult131_g127424;
					float4 temp_output_3_0_g127423 = TVE_PaintParams;
					float4 ifLocalVar18_g127423 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127423 >= 0.5 )
					ifLocalVar18_g127423 = temp_output_17_0_g127423;
					else
					ifLocalVar18_g127423 = temp_output_3_0_g127423;
					float4 lerpResult22_g127423 = lerp( temp_output_3_0_g127423 , temp_output_17_0_g127423 , temp_output_19_0_g127423);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127423 = lerpResult22_g127423;
					#else
					float4 staticSwitch24_g127423 = ifLocalVar18_g127423;
					#endif
					float ifLocalVar40_g127440 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127440 = saturate( (staticSwitch24_g127423).a );
					float temp_output_82_0_g127441 = Debug_Layer885_g127014;
					float temp_output_19_0_g127443 = TVE_GlowLayers[(int)temp_output_82_0_g127441];
					half3 Input_Position180_g127444 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127444 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127444).xz ) );
					float temp_output_82_0_g127444 = temp_output_82_0_g127441;
					float2 temp_output_119_0_g127444 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127444).xz ) );
					float temp_output_7_0_g127449 = 1.0;
					float temp_output_9_0_g127449 = ( saturate( ( distance( Input_Position180_g127444 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127449 );
					float4 lerpResult131_g127444 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127444,temp_output_82_0_g127444), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127444,temp_output_82_0_g127444), 0.0 ) , saturate( ( temp_output_9_0_g127449 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127449 ) ) ));
					float4 temp_output_17_0_g127443 = lerpResult131_g127444;
					float4 temp_output_3_0_g127443 = TVE_GlowParams;
					float4 ifLocalVar18_g127443 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127443 >= 0.5 )
					ifLocalVar18_g127443 = temp_output_17_0_g127443;
					else
					ifLocalVar18_g127443 = temp_output_3_0_g127443;
					float4 lerpResult22_g127443 = lerp( temp_output_3_0_g127443 , temp_output_17_0_g127443 , temp_output_19_0_g127443);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127443 = lerpResult22_g127443;
					#else
					float4 staticSwitch24_g127443 = ifLocalVar18_g127443;
					#endif
					float3 ifLocalVar40_g127513 = 0;
					if( Debug_Index464_g127014 == 5.0 )
					ifLocalVar40_g127513 = (staticSwitch24_g127443).rgb;
					float temp_output_82_0_g127504 = Debug_Layer885_g127014;
					float temp_output_19_0_g127506 = TVE_GlowLayers[(int)temp_output_82_0_g127504];
					half3 Input_Position180_g127507 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127507 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127507).xz ) );
					float temp_output_82_0_g127507 = temp_output_82_0_g127504;
					float2 temp_output_119_0_g127507 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127507).xz ) );
					float temp_output_7_0_g127512 = 1.0;
					float temp_output_9_0_g127512 = ( saturate( ( distance( Input_Position180_g127507 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127512 );
					float4 lerpResult131_g127507 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127507,temp_output_82_0_g127507), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127507,temp_output_82_0_g127507), 0.0 ) , saturate( ( temp_output_9_0_g127512 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127512 ) ) ));
					float4 temp_output_17_0_g127506 = lerpResult131_g127507;
					float4 temp_output_3_0_g127506 = TVE_GlowParams;
					float4 ifLocalVar18_g127506 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127506 >= 0.5 )
					ifLocalVar18_g127506 = temp_output_17_0_g127506;
					else
					ifLocalVar18_g127506 = temp_output_3_0_g127506;
					float4 lerpResult22_g127506 = lerp( temp_output_3_0_g127506 , temp_output_17_0_g127506 , temp_output_19_0_g127506);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127506 = lerpResult22_g127506;
					#else
					float4 staticSwitch24_g127506 = ifLocalVar18_g127506;
					#endif
					float ifLocalVar40_g127514 = 0;
					if( Debug_Index464_g127014 == 6.0 )
					ifLocalVar40_g127514 = saturate( (staticSwitch24_g127506).a );
					float temp_output_132_0_g127477 = Debug_Layer885_g127014;
					float temp_output_19_0_g127479 = TVE_AtmoLayers[(int)temp_output_132_0_g127477];
					half3 Input_Position180_g127480 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127480 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127480).xz ) );
					float temp_output_82_0_g127480 = temp_output_132_0_g127477;
					float2 temp_output_119_0_g127480 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127480).xz ) );
					float temp_output_7_0_g127485 = 1.0;
					float temp_output_9_0_g127485 = ( saturate( ( distance( Input_Position180_g127480 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127485 );
					float4 lerpResult131_g127480 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127480,temp_output_82_0_g127480), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127480,temp_output_82_0_g127480), 0.0 ) , saturate( ( temp_output_9_0_g127485 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127485 ) ) ));
					float4 temp_output_17_0_g127479 = lerpResult131_g127480;
					float4 temp_output_3_0_g127479 = TVE_AtmoParams;
					float4 ifLocalVar18_g127479 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127479 >= 0.5 )
					ifLocalVar18_g127479 = temp_output_17_0_g127479;
					else
					ifLocalVar18_g127479 = temp_output_3_0_g127479;
					float4 lerpResult22_g127479 = lerp( temp_output_3_0_g127479 , temp_output_17_0_g127479 , temp_output_19_0_g127479);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127479 = lerpResult22_g127479;
					#else
					float4 staticSwitch24_g127479 = ifLocalVar18_g127479;
					#endif
					float ifLocalVar40_g127515 = 0;
					if( Debug_Index464_g127014 == 7.0 )
					ifLocalVar40_g127515 = (staticSwitch24_g127479).r;
					float temp_output_132_0_g127450 = Debug_Layer885_g127014;
					float temp_output_19_0_g127452 = TVE_AtmoLayers[(int)temp_output_132_0_g127450];
					half3 Input_Position180_g127453 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127453 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127453).xz ) );
					float temp_output_82_0_g127453 = temp_output_132_0_g127450;
					float2 temp_output_119_0_g127453 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127453).xz ) );
					float temp_output_7_0_g127458 = 1.0;
					float temp_output_9_0_g127458 = ( saturate( ( distance( Input_Position180_g127453 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127458 );
					float4 lerpResult131_g127453 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127453,temp_output_82_0_g127453), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127453,temp_output_82_0_g127453), 0.0 ) , saturate( ( temp_output_9_0_g127458 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127458 ) ) ));
					float4 temp_output_17_0_g127452 = lerpResult131_g127453;
					float4 temp_output_3_0_g127452 = TVE_AtmoParams;
					float4 ifLocalVar18_g127452 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127452 >= 0.5 )
					ifLocalVar18_g127452 = temp_output_17_0_g127452;
					else
					ifLocalVar18_g127452 = temp_output_3_0_g127452;
					float4 lerpResult22_g127452 = lerp( temp_output_3_0_g127452 , temp_output_17_0_g127452 , temp_output_19_0_g127452);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127452 = lerpResult22_g127452;
					#else
					float4 staticSwitch24_g127452 = ifLocalVar18_g127452;
					#endif
					float ifLocalVar40_g127516 = 0;
					if( Debug_Index464_g127014 == 8.0 )
					ifLocalVar40_g127516 = (staticSwitch24_g127452).g;
					float temp_output_132_0_g127459 = Debug_Layer885_g127014;
					float temp_output_19_0_g127461 = TVE_AtmoLayers[(int)temp_output_132_0_g127459];
					half3 Input_Position180_g127462 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127462 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127462).xz ) );
					float temp_output_82_0_g127462 = temp_output_132_0_g127459;
					float2 temp_output_119_0_g127462 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127462).xz ) );
					float temp_output_7_0_g127467 = 1.0;
					float temp_output_9_0_g127467 = ( saturate( ( distance( Input_Position180_g127462 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127467 );
					float4 lerpResult131_g127462 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127462,temp_output_82_0_g127462), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127462,temp_output_82_0_g127462), 0.0 ) , saturate( ( temp_output_9_0_g127467 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127467 ) ) ));
					float4 temp_output_17_0_g127461 = lerpResult131_g127462;
					float4 temp_output_3_0_g127461 = TVE_AtmoParams;
					float4 ifLocalVar18_g127461 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127461 >= 0.5 )
					ifLocalVar18_g127461 = temp_output_17_0_g127461;
					else
					ifLocalVar18_g127461 = temp_output_3_0_g127461;
					float4 lerpResult22_g127461 = lerp( temp_output_3_0_g127461 , temp_output_17_0_g127461 , temp_output_19_0_g127461);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127461 = lerpResult22_g127461;
					#else
					float4 staticSwitch24_g127461 = ifLocalVar18_g127461;
					#endif
					float ifLocalVar40_g127517 = 0;
					if( Debug_Index464_g127014 == 9.0 )
					ifLocalVar40_g127517 = (staticSwitch24_g127461).b;
					float temp_output_132_0_g127468 = Debug_Layer885_g127014;
					float temp_output_19_0_g127470 = TVE_AtmoLayers[(int)temp_output_132_0_g127468];
					half3 Input_Position180_g127471 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127471 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127471).xz ) );
					float temp_output_82_0_g127471 = temp_output_132_0_g127468;
					float2 temp_output_119_0_g127471 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127471).xz ) );
					float temp_output_7_0_g127476 = 1.0;
					float temp_output_9_0_g127476 = ( saturate( ( distance( Input_Position180_g127471 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127476 );
					float4 lerpResult131_g127471 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127471,temp_output_82_0_g127471), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127471,temp_output_82_0_g127471), 0.0 ) , saturate( ( temp_output_9_0_g127476 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127476 ) ) ));
					float4 temp_output_17_0_g127470 = lerpResult131_g127471;
					float4 temp_output_3_0_g127470 = TVE_AtmoParams;
					float4 ifLocalVar18_g127470 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127470 >= 0.5 )
					ifLocalVar18_g127470 = temp_output_17_0_g127470;
					else
					ifLocalVar18_g127470 = temp_output_3_0_g127470;
					float4 lerpResult22_g127470 = lerp( temp_output_3_0_g127470 , temp_output_17_0_g127470 , temp_output_19_0_g127470);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127470 = lerpResult22_g127470;
					#else
					float4 staticSwitch24_g127470 = ifLocalVar18_g127470;
					#endif
					float ifLocalVar40_g127518 = 0;
					if( Debug_Index464_g127014 == 10.0 )
					ifLocalVar40_g127518 = saturate( (staticSwitch24_g127470).a );
					float temp_output_130_0_g127495 = Debug_Layer885_g127014;
					float temp_output_19_0_g127497 = TVE_FormLayers[(int)temp_output_130_0_g127495];
					half3 Input_Position180_g127498 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127498 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127498).xz ) );
					float temp_output_82_0_g127498 = temp_output_130_0_g127495;
					float2 temp_output_119_0_g127498 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127498).xz ) );
					float temp_output_7_0_g127503 = 1.0;
					float temp_output_9_0_g127503 = ( saturate( ( distance( Input_Position180_g127498 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127503 );
					float4 lerpResult131_g127498 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127498,temp_output_82_0_g127498), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127498,temp_output_82_0_g127498), 0.0 ) , saturate( ( temp_output_9_0_g127503 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127503 ) ) ));
					float4 temp_output_17_0_g127497 = lerpResult131_g127498;
					float4 temp_output_3_0_g127497 = TVE_FormParams;
					float4 ifLocalVar18_g127497 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127497 >= 0.5 )
					ifLocalVar18_g127497 = temp_output_17_0_g127497;
					else
					ifLocalVar18_g127497 = temp_output_3_0_g127497;
					float4 lerpResult22_g127497 = lerp( temp_output_3_0_g127497 , temp_output_17_0_g127497 , temp_output_19_0_g127497);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127497 = lerpResult22_g127497;
					#else
					float4 staticSwitch24_g127497 = ifLocalVar18_g127497;
					#endif
					float3 appendResult1013_g127014 = (float3((staticSwitch24_g127497).rg , 0.0));
					float3 ifLocalVar40_g127519 = 0;
					if( Debug_Index464_g127014 == 11.0 )
					ifLocalVar40_g127519 = appendResult1013_g127014;
					float temp_output_130_0_g127486 = Debug_Layer885_g127014;
					float temp_output_19_0_g127488 = TVE_FormLayers[(int)temp_output_130_0_g127486];
					half3 Input_Position180_g127489 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127489 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127489).xz ) );
					float temp_output_82_0_g127489 = temp_output_130_0_g127486;
					float2 temp_output_119_0_g127489 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127489).xz ) );
					float temp_output_7_0_g127494 = 1.0;
					float temp_output_9_0_g127494 = ( saturate( ( distance( Input_Position180_g127489 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127494 );
					float4 lerpResult131_g127489 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127489,temp_output_82_0_g127489), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127489,temp_output_82_0_g127489), 0.0 ) , saturate( ( temp_output_9_0_g127494 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127494 ) ) ));
					float4 temp_output_17_0_g127488 = lerpResult131_g127489;
					float4 temp_output_3_0_g127488 = TVE_FormParams;
					float4 ifLocalVar18_g127488 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127488 >= 0.5 )
					ifLocalVar18_g127488 = temp_output_17_0_g127488;
					else
					ifLocalVar18_g127488 = temp_output_3_0_g127488;
					float4 lerpResult22_g127488 = lerp( temp_output_3_0_g127488 , temp_output_17_0_g127488 , temp_output_19_0_g127488);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127488 = lerpResult22_g127488;
					#else
					float4 staticSwitch24_g127488 = ifLocalVar18_g127488;
					#endif
					float ifLocalVar40_g127520 = 0;
					if( Debug_Index464_g127014 == 12.0 )
					ifLocalVar40_g127520 = saturate( (staticSwitch24_g127488).b );
					float temp_output_130_0_g127543 = Debug_Layer885_g127014;
					float temp_output_19_0_g127545 = TVE_FormLayers[(int)temp_output_130_0_g127543];
					half3 Input_Position180_g127546 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127546 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127546).xz ) );
					float temp_output_82_0_g127546 = temp_output_130_0_g127543;
					float2 temp_output_119_0_g127546 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127546).xz ) );
					float temp_output_7_0_g127551 = 1.0;
					float temp_output_9_0_g127551 = ( saturate( ( distance( Input_Position180_g127546 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127551 );
					float4 lerpResult131_g127546 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127546,temp_output_82_0_g127546), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127546,temp_output_82_0_g127546), 0.0 ) , saturate( ( temp_output_9_0_g127551 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127551 ) ) ));
					float4 temp_output_17_0_g127545 = lerpResult131_g127546;
					float4 temp_output_3_0_g127545 = TVE_FormParams;
					float4 ifLocalVar18_g127545 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127545 >= 0.5 )
					ifLocalVar18_g127545 = temp_output_17_0_g127545;
					else
					ifLocalVar18_g127545 = temp_output_3_0_g127545;
					float4 lerpResult22_g127545 = lerp( temp_output_3_0_g127545 , temp_output_17_0_g127545 , temp_output_19_0_g127545);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127545 = lerpResult22_g127545;
					#else
					float4 staticSwitch24_g127545 = ifLocalVar18_g127545;
					#endif
					float ifLocalVar40_g127552 = 0;
					if( Debug_Index464_g127014 == 13.0 )
					ifLocalVar40_g127552 = saturate( (staticSwitch24_g127545).a );
					float temp_output_136_0_g127521 = Debug_Layer885_g127014;
					float temp_output_19_0_g127523 = TVE_FlowLayers[(int)temp_output_136_0_g127521];
					half3 Input_Position180_g127524 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127524 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127524).xz ) );
					float temp_output_82_0_g127524 = temp_output_136_0_g127521;
					float2 temp_output_119_0_g127524 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127524).xz ) );
					float temp_output_7_0_g127529 = 1.0;
					float temp_output_9_0_g127529 = ( saturate( ( distance( Input_Position180_g127524 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127529 );
					float4 lerpResult131_g127524 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127524,temp_output_82_0_g127524), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127524,temp_output_82_0_g127524), 0.0 ) , saturate( ( temp_output_9_0_g127529 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127529 ) ) ));
					float4 temp_output_17_0_g127523 = lerpResult131_g127524;
					float4 temp_output_3_0_g127523 = TVE_FlowParams;
					float4 ifLocalVar18_g127523 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127523 >= 0.5 )
					ifLocalVar18_g127523 = temp_output_17_0_g127523;
					else
					ifLocalVar18_g127523 = temp_output_3_0_g127523;
					float4 lerpResult22_g127523 = lerp( temp_output_3_0_g127523 , temp_output_17_0_g127523 , temp_output_19_0_g127523);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127523 = lerpResult22_g127523;
					#else
					float4 staticSwitch24_g127523 = ifLocalVar18_g127523;
					#endif
					float3 appendResult1012_g127014 = (float3((staticSwitch24_g127523).rg , 0.0));
					float3 ifLocalVar40_g127539 = 0;
					if( Debug_Index464_g127014 == 14.0 )
					ifLocalVar40_g127539 = appendResult1012_g127014;
					float temp_output_136_0_g127530 = Debug_Layer885_g127014;
					float temp_output_19_0_g127532 = TVE_FlowLayers[(int)temp_output_136_0_g127530];
					half3 Input_Position180_g127533 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127533 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127533).xz ) );
					float temp_output_82_0_g127533 = temp_output_136_0_g127530;
					float2 temp_output_119_0_g127533 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127533).xz ) );
					float temp_output_7_0_g127538 = 1.0;
					float temp_output_9_0_g127538 = ( saturate( ( distance( Input_Position180_g127533 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127538 );
					float4 lerpResult131_g127533 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127533,temp_output_82_0_g127533), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127533,temp_output_82_0_g127533), 0.0 ) , saturate( ( temp_output_9_0_g127538 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127538 ) ) ));
					float4 temp_output_17_0_g127532 = lerpResult131_g127533;
					float4 temp_output_3_0_g127532 = TVE_FlowParams;
					float4 ifLocalVar18_g127532 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127532 >= 0.5 )
					ifLocalVar18_g127532 = temp_output_17_0_g127532;
					else
					ifLocalVar18_g127532 = temp_output_3_0_g127532;
					float4 lerpResult22_g127532 = lerp( temp_output_3_0_g127532 , temp_output_17_0_g127532 , temp_output_19_0_g127532);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127532 = lerpResult22_g127532;
					#else
					float4 staticSwitch24_g127532 = ifLocalVar18_g127532;
					#endif
					float ifLocalVar40_g127540 = 0;
					if( Debug_Index464_g127014 == 15.0 )
					ifLocalVar40_g127540 = (staticSwitch24_g127532).b;
					float temp_output_136_0_g127555 = Debug_Layer885_g127014;
					float temp_output_19_0_g127556 = TVE_PushLayers[(int)temp_output_136_0_g127555];
					half3 Input_Position180_g127557 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127557 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127557).xz ) );
					float temp_output_82_0_g127557 = temp_output_136_0_g127555;
					float2 temp_output_119_0_g127557 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127557).xz ) );
					float temp_output_7_0_g127562 = 1.0;
					float temp_output_9_0_g127562 = ( saturate( ( distance( Input_Position180_g127557 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127562 );
					float4 lerpResult131_g127557 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127557,temp_output_82_0_g127557), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127557,temp_output_82_0_g127557), 0.0 ) , saturate( ( temp_output_9_0_g127562 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127562 ) ) ));
					float4 temp_output_17_0_g127556 = lerpResult131_g127557;
					float4 temp_output_3_0_g127556 = TVE_PushParams;
					float4 ifLocalVar18_g127556 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127556 >= 0.5 )
					ifLocalVar18_g127556 = temp_output_17_0_g127556;
					else
					ifLocalVar18_g127556 = temp_output_3_0_g127556;
					float4 lerpResult22_g127556 = lerp( temp_output_3_0_g127556 , temp_output_17_0_g127556 , temp_output_19_0_g127556);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127556 = lerpResult22_g127556;
					#else
					float4 staticSwitch24_g127556 = ifLocalVar18_g127556;
					#endif
					float3 appendResult1780_g127014 = (float3((staticSwitch24_g127556).rg , 0.0));
					float3 ifLocalVar40_g127541 = 0;
					if( Debug_Index464_g127014 == 16.0 )
					ifLocalVar40_g127541 = appendResult1780_g127014;
					float temp_output_136_0_g127564 = Debug_Layer885_g127014;
					float temp_output_19_0_g127565 = TVE_PushLayers[(int)temp_output_136_0_g127564];
					half3 Input_Position180_g127566 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127566 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127566).xz ) );
					float temp_output_82_0_g127566 = temp_output_136_0_g127564;
					float2 temp_output_119_0_g127566 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127566).xz ) );
					float temp_output_7_0_g127571 = 1.0;
					float temp_output_9_0_g127571 = ( saturate( ( distance( Input_Position180_g127566 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127571 );
					float4 lerpResult131_g127566 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127566,temp_output_82_0_g127566), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127566,temp_output_82_0_g127566), 0.0 ) , saturate( ( temp_output_9_0_g127571 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127571 ) ) ));
					float4 temp_output_17_0_g127565 = lerpResult131_g127566;
					float4 temp_output_3_0_g127565 = TVE_PushParams;
					float4 ifLocalVar18_g127565 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127565 >= 0.5 )
					ifLocalVar18_g127565 = temp_output_17_0_g127565;
					else
					ifLocalVar18_g127565 = temp_output_3_0_g127565;
					float4 lerpResult22_g127565 = lerp( temp_output_3_0_g127565 , temp_output_17_0_g127565 , temp_output_19_0_g127565);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127565 = lerpResult22_g127565;
					#else
					float4 staticSwitch24_g127565 = ifLocalVar18_g127565;
					#endif
					float ifLocalVar40_g127542 = 0;
					if( Debug_Index464_g127014 == 17.0 )
					ifLocalVar40_g127542 = (staticSwitch24_g127565).b;
					float temp_output_136_0_g127573 = Debug_Layer885_g127014;
					float temp_output_19_0_g127574 = TVE_PushLayers[(int)temp_output_136_0_g127573];
					half3 Input_Position180_g127575 = WorldPosition893_g127014;
					float2 temp_output_75_0_g127575 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127575).xz ) );
					float temp_output_82_0_g127575 = temp_output_136_0_g127573;
					float2 temp_output_119_0_g127575 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127575).xz ) );
					float temp_output_7_0_g127580 = 1.0;
					float temp_output_9_0_g127580 = ( saturate( ( distance( Input_Position180_g127575 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127580 );
					float4 lerpResult131_g127575 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127575,temp_output_82_0_g127575), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127575,temp_output_82_0_g127575), 0.0 ) , saturate( ( temp_output_9_0_g127580 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127580 ) ) ));
					float4 temp_output_17_0_g127574 = lerpResult131_g127575;
					float4 temp_output_3_0_g127574 = TVE_PushParams;
					float4 ifLocalVar18_g127574 = 0;
					UNITY_BRANCH 
					if( temp_output_19_0_g127574 >= 0.5 )
					ifLocalVar18_g127574 = temp_output_17_0_g127574;
					else
					ifLocalVar18_g127574 = temp_output_3_0_g127574;
					float4 lerpResult22_g127574 = lerp( temp_output_3_0_g127574 , temp_output_17_0_g127574 , temp_output_19_0_g127574);
					#ifdef SHADER_API_MOBILE
					float4 staticSwitch24_g127574 = lerpResult22_g127574;
					#else
					float4 staticSwitch24_g127574 = ifLocalVar18_g127574;
					#endif
					float ifLocalVar40_g127553 = 0;
					if( Debug_Index464_g127014 == 18.0 )
					ifLocalVar40_g127553 = saturate( (staticSwitch24_g127574).a );
					float temp_output_7_0_g127554 = Debug_Min721_g127014;
					float3 temp_cast_59 = (temp_output_7_0_g127554).xxx;
					float3 temp_output_9_0_g127554 = ( ( ifLocalVar40_g127582 + ( ifLocalVar40_g127419 + ifLocalVar40_g127420 ) + ( ifLocalVar40_g127439 + ifLocalVar40_g127440 ) + ( ifLocalVar40_g127513 + ifLocalVar40_g127514 ) + ( ifLocalVar40_g127515 + ifLocalVar40_g127516 + ifLocalVar40_g127517 + ifLocalVar40_g127518 ) + ( ifLocalVar40_g127519 + ifLocalVar40_g127520 + ifLocalVar40_g127552 ) + ( ifLocalVar40_g127539 + ifLocalVar40_g127540 + ifLocalVar40_g127541 + ifLocalVar40_g127542 + ifLocalVar40_g127553 ) ) - temp_cast_59 );
					float4 appendResult1659_g127014 = (float4(saturate( ( ( temp_output_9_0_g127554 / ( Debug_Max723_g127014 - temp_output_7_0_g127554 ) ) + 0.0001 ) ) , 1.0));
					float4 Output_Globals888_g127014 = appendResult1659_g127014;
					float4 ifLocalVar40_g127084 = 0;
					if( Debug_Type367_g127014 == 9.0 )
					ifLocalVar40_g127084 = Output_Globals888_g127014;
					float3 vertexToFrag328_g127014 = IN.ase_texcoord6.xyz;
					float4 color1016_g127014 = IsGammaSpace() ? float4( 0.5831653, 0.6037736, 0.2135992, 0 ) : float4( 0.2992498, 0.3229691, 0.03750122, 0 );
					float4 color1017_g127014 = IsGammaSpace() ? float4( 0.8117647, 0.3488252, 0.2627451, 0 ) : float4( 0.6239604, 0.0997834, 0.05612849, 0 );
					float4 switchResult1015_g127014 = (((ase_vface>0)?(color1016_g127014):(color1017_g127014)));
					float3 ifLocalVar40_g127018 = 0;
					if( Debug_Index464_g127014 == 4.0 )
					ifLocalVar40_g127018 = (switchResult1015_g127014).rgb;
					float temp_output_7_0_g127074 = Debug_Min721_g127014;
					float3 temp_cast_60 = (temp_output_7_0_g127074).xxx;
					float3 temp_output_9_0_g127074 = ( ( vertexToFrag328_g127014 + ifLocalVar40_g127018 ) - temp_cast_60 );
					float4 appendResult1658_g127014 = (float4(saturate( ( ( temp_output_9_0_g127074 / ( Debug_Max723_g127014 - temp_output_7_0_g127074 ) ) + 0.0001 ) ) , 1.0));
					float4 Output_Mesh316_g127014 = appendResult1658_g127014;
					float4 ifLocalVar40_g127086 = 0;
					if( Debug_Type367_g127014 == 11.0 )
					ifLocalVar40_g127086 = Output_Mesh316_g127014;
					float _IsTVEShader647_g127014 = _IsTVEShader;
					float Debug_Filter322_g127014 = TVE_DEBUG_Filter;
					float lerpResult1524_g127014 = lerp( 1.0 , _IsTVEShader647_g127014 , Debug_Filter322_g127014);
					float4 lerpResult1517_g127014 = lerp( Shading_Inactive1492_g127014 , ( ( ifLocalVar40_g127075 + ifLocalVar40_g127077 + ifLocalVar40_g127078 + ifLocalVar40_g127079 + ifLocalVar40_g127080 ) + ( ifLocalVar40_g127081 + ifLocalVar40_g127082 + ifLocalVar40_g127083 ) + ( ifLocalVar40_g127084 + ifLocalVar40_g127086 ) ) , lerpResult1524_g127014);
					float3 ase_normalWS = IN.ase_texcoord7.xyz;
					float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
					float3 ase_viewDirWS = normalize( ase_viewVectorWS );
					float dotResult1472_g127014 = dot( ase_normalWS , ase_viewDirWS );
					float temp_output_1526_0_g127014 = ( 1.0 - saturate( dotResult1472_g127014 ) );
					float Shading_Fresnel1469_g127014 = (( 1.0 - ( temp_output_1526_0_g127014 * temp_output_1526_0_g127014 ) )*0.3 + 0.7);
					float Debug_Shading1653_g127014 = TVE_DEBUG_Shading;
					float lerpResult1655_g127014 = lerp( 1.0 , Shading_Fresnel1469_g127014 , Debug_Shading1653_g127014);
					float Debug_Clip623_g127014 = TVE_DEBUG_Clip;
					float lerpResult622_g127014 = lerp( 1.0 , SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g127014 * _RenderClip ));
					clip( lerpResult622_g127014 - _MainAlphaClipValue);
					clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
					

					o.Albedo = temp_cast_0;
					o.Normal = half3( 0, 0, 1 );
					o.Emission = ( lerpResult1517_g127014 * lerpResult1655_g127014 ).rgb;
					o.Alpha = 1;

					#ifdef _ALPHATEST_ON
						clip( o.Alpha - AlphaClipThreshold );
					#endif

					UnityMetaInput metaIN;
					UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
					metaIN.Albedo = o.Albedo;
					metaIN.Emission = o.Emission;
					#ifdef EDITOR_VISUALIZATION
						metaIN.VizUV = IN.vizUV;
						metaIN.LightCoord = IN.lightCoord;
					#endif
					return UnityMetaFragment(metaIN);
				}
				ENDCG
			}

			
			Pass
			{
				
				Name "ShadowCaster"
				Tags { "LightMode"="ShadowCaster" }
				ZWrite On
				ZTest LEqual
				AlphaToMask Off

				CGPROGRAM
				#define ASE_GEOMETRY 1
				#define ASE_FRAGMENT_NORMAL 0
				#define ASE_NEEDS_FRAG_SHADOWCOORDS
				#pragma multi_compile_instancing
				#pragma multi_compile __ LOD_FADE_CROSSFADE
				#pragma multi_compile_fog
				#define ASE_VERSION 19802
				#define ASE_USING_SAMPLING_MACROS 1

				#pragma vertex vert
				#pragma fragment frag
				#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
				#pragma multi_compile_shadowcaster
				#ifndef UNITY_PASS_SHADOWCASTER
					#define UNITY_PASS_SHADOWCASTER
				#endif
				#include "HLSLSupport.cginc"
				#ifdef ASE_GEOMETRY
					#ifndef UNITY_INSTANCED_LOD_FADE
						#define UNITY_INSTANCED_LOD_FADE
					#endif
					#ifndef UNITY_INSTANCED_SH
						#define UNITY_INSTANCED_SH
					#endif
					#ifndef UNITY_INSTANCED_LIGHTMAPSTS
						#define UNITY_INSTANCED_LIGHTMAPSTS
					#endif
				#endif
				#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
					#define CAN_SKIP_VPOS
				#endif
				#include "UnityShaderVariables.cginc"
				#include "UnityCG.cginc"
				#include "Lighting.cginc"
				#include "UnityPBSLighting.cginc"

				

				struct appdata
				{
					float4 vertex : POSITION;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					V2F_SHADOW_CASTER;
					
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				#ifdef UNITY_STANDARD_USE_DITHER_MASK
					sampler3D _DitherMaskLOD;
				#endif
				#ifdef ASE_TESSELLATION
					float _TessPhongStrength;
					float _TessValue;
					float _TessMin;
					float _TessMax;
					float _TessEdgeLength;
					float _TessMaxDisp;
				#endif

				uniform half TVE_DEBUG_Layer;
				uniform half TVE_DEBUG_Index;
				uniform half TVE_DEBUG_Type;
				uniform half TVE_DEBUG_Min;
				uniform half TVE_DEBUG_Clip;
				uniform half TVE_DEBUG_Max;
				uniform half TVE_DEBUG_Filter;
				uniform half TVE_DEBUG_Shading;
				uniform half _Banner;
				uniform half _Message;
				uniform float _IsSimpleShader;
				uniform float _IsVertexShader;
				uniform half _IsTVEShader;


				
				v2f VertexFunction( appdata v  )
				{
					UNITY_SETUP_INSTANCE_ID(v);
					v2f o;
					UNITY_INITIALIZE_OUTPUT(v2f,o);
					UNITY_TRANSFER_INSTANCE_ID(v,o);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

					

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = defaultVertexValue;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = v.normal;
					v.tangent = v.tangent;

					TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
					return o;
				}

				#if defined(ASE_TESSELLATION)
				struct VertexControl
				{
					float4 vertex : INTERNALTESSPOS;
					float4 tangent : TANGENT;
					float3 normal : NORMAL;
					float4 texcoord1 : TEXCOORD1;
					float4 texcoord2 : TEXCOORD2;
					
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct TessellationFactors
				{
					float edge[3] : SV_TessFactor;
					float inside : SV_InsideTessFactor;
				};

				VertexControl vert ( appdata v )
				{
					VertexControl o;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_TRANSFER_INSTANCE_ID(v, o);
					o.vertex = v.vertex;
					o.tangent = v.tangent;
					o.normal = v.normal;
					o.texcoord1 = v.texcoord1;
					o.texcoord2 = v.texcoord2;
					
					return o;
				}

				TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
				{
					TessellationFactors o;
					float4 tf = 1;
					float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
					float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
					#if defined(ASE_FIXED_TESSELLATION)
					tf = FixedTess( tessValue );
					#elif defined(ASE_DISTANCE_TESSELLATION)
					tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
					#elif defined(ASE_LENGTH_TESSELLATION)
					tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
					#elif defined(ASE_LENGTH_CULL_TESSELLATION)
					tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
					#endif
					o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
					return o;
				}

				[domain("tri")]
				[partitioning("fractional_odd")]
				[outputtopology("triangle_cw")]
				[patchconstantfunc("TessellationFunction")]
				[outputcontrolpoints(3)]
				VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
				{
				   return patch[id];
				}

				[domain("tri")]
				v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
				{
					appdata o = (appdata) 0;
					o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
					o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
					o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
					o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
					o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
					
					#if defined(ASE_PHONG_TESSELLATION)
					float3 pp[3];
					for (int i = 0; i < 3; ++i)
						pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
					float phongStrength = _TessPhongStrength;
					o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
					#endif
					UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
					return VertexFunction(o);
				}
				#else
				v2f vert( appdata v )
				{
					return VertexFunction( v );
				}
				#endif

				half4 frag( v2f IN 
					#if defined( ASE_DEPTH_WRITE_ON )
					, out float outputDepth : SV_Depth
					#endif
					#if !defined( CAN_SKIP_VPOS )
					, UNITY_VPOS_TYPE vpos : VPOS
					#endif
					) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID(IN);

					#ifdef LOD_FADE_CROSSFADE
						UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
					#endif

					#if defined(ASE_LIGHTING_SIMPLE)
						SurfaceOutput o = (SurfaceOutput)0;
					#else
						#if defined(_SPECULAR_SETUP)
							SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
						#else
							SurfaceOutputStandard o = (SurfaceOutputStandard)0;
						#endif
					#endif

					

					o.Alpha = 1;

					#if defined( ASE_DEPTH_WRITE_ON )
						float DeviceDepth = IN.pos.z;
					#endif

					#ifdef _ALPHATEST_SHADOW_ON
						if (unity_LightShadowBias.z != 0.0)
							clip(o.Alpha - AlphaClipThresholdShadow);
						#ifdef _ALPHATEST_ON
						else
							clip(o.Alpha - AlphaClipThreshold);
						#endif
					#else
						#ifdef _ALPHATEST_ON
							clip(o.Alpha - AlphaClipThreshold);
						#endif
					#endif

					#if defined( CAN_SKIP_VPOS )
					float2 vpos = IN.pos;
					#endif

					#ifdef UNITY_STANDARD_USE_DITHER_MASK
						half alphaRef = tex3D(_DitherMaskLOD, float3(vpos.xy*0.25,o.Alpha*0.9375)).a;
						clip(alphaRef - 0.01);
					#endif

					#if defined( ASE_DEPTH_WRITE_ON )
						outputDepth = DeviceDepth;
					#endif

					SHADOW_CASTER_FRAGMENT(IN)
				}
			ENDCG
		}
		
	}
	
	
	Fallback Off
}
/*ASEBEGIN
Version=19802
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2155;-1792,-5248;Half;False;Global;TVE_DEBUG_Layer;TVE_DEBUG_Layer;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2013;-1792,-5312;Half;False;Global;TVE_DEBUG_Index;TVE_DEBUG_Index;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1908;-1792,-5376;Half;False;Global;TVE_DEBUG_Type;TVE_DEBUG_Type;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2069;-1792,-4992;Half;False;Global;TVE_DEBUG_Min;TVE_DEBUG_Min;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2032;-1792,-5056;Half;False;Global;TVE_DEBUG_Clip;TVE_DEBUG_Clip;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2070;-1792,-4928;Half;False;Global;TVE_DEBUG_Max;TVE_DEBUG_Max;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1953;-1792,-5184;Half;False;Global;TVE_DEBUG_Filter;TVE_DEBUG_Filter;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2329;-1792,-5120;Half;False;Global;TVE_DEBUG_Shading;TVE_DEBUG_Shading;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1774;-880,2944;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1803;-1344,2944;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1878;-1792,-5632;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;True;1;StyledBanner(Debug);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1772;-1088,3072;Float;False;Constant;_Float3;Float 3;31;0;Create;True;0;0;0;False;0;False;24;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1931;-1408,-5632;Half;False;Property;_DebugCategory;[ Debug Category ];140;0;Create;True;0;0;0;False;1;StyledCategory(Debug Settings, 5, 10);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1843;-1632,2944;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1771;-1088,2944;Inherit;False;-1;;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1800;-1472,2944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1804;-1792,2944;Inherit;False;Constant;_Float1;Float 1;0;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1881;-1600,-5632;Half;False;Property;_Message;Message;141;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use this shader to debug the original mesh or the converted mesh attributes., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2203;-896,-5632;Inherit;False;Base Compile;-1;;73162;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2352;-1408,-5376;Inherit;False;Tool Debug;1;;127014;d48cde928c5068141abea1713047719b;1,1236,0;8;336;FLOAT;0;False;465;FLOAT;0;False;884;FLOAT;0;False;337;FLOAT;0;False;1652;FLOAT;0;False;624;FLOAT;0;False;720;FLOAT;0;False;722;FLOAT;0;False;1;COLOR;338
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2359;-1152,-5376;Inherit;False;Constant;_Float4;Float 4;36;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2353;-896,-5376;Float;False;False;-1;3;AmplifyShaderEditor.MaterialInspector;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ExtraPrePass;0;0;ExtraPrePass;5;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;5;False;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=ForwardBase;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2354;-896,-5376;Float;False;True;-1;3;;0;14;Hidden/BOXOPHOBIC/The Visual Engine/Helpers/Debug;28cd5599e02859647ae1798e4fcaef6c;True;ForwardBase;0;1;ForwardBase;17;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;5;False;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;False;0;;0;0;Standard;42;Category;0;0;Workflow;1;0;Surface;0;0;  Blend;0;0;  Dither Shadows;1;0;Two Sided;0;638807808135481458;Deferred Pass;1;0;Normal Space,InvertActionOnDeselection;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;Receive Shadows;1;0;Receive Specular;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;Ambient Light;1;0;Meta Pass;1;0;Add Pass;1;0;Override Baked GI;0;0;Write Depth;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Fwd Specular Highlights Toggle;0;0;Fwd Reflections Toggle;0;0;Disable Batching;0;0;Vertex Position,InvertActionOnDeselection;1;0;0;6;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2355;-896,-5376;Float;False;False;-1;3;AmplifyShaderEditor.MaterialInspector;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ForwardAdd;0;2;ForwardAdd;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;5;False;0;False;True;4;1;False;;1;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;True;1;LightMode=ForwardAdd;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2356;-896,-5376;Float;False;False;-1;3;AmplifyShaderEditor.MaterialInspector;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Deferred;0;3;Deferred;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;5;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Deferred;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2357;-896,-5376;Float;False;False;-1;3;AmplifyShaderEditor.MaterialInspector;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Meta;0;4;Meta;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;5;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2358;-896,-5376;Float;False;False;-1;3;AmplifyShaderEditor.MaterialInspector;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;5;ShadowCaster;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;5;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
WireConnection;1774;0;1771;0
WireConnection;1774;1;1772;0
WireConnection;1774;3;1803;0
WireConnection;1803;0;1800;0
WireConnection;1843;0;1804;0
WireConnection;1800;0;1843;0
WireConnection;2352;336;1908;0
WireConnection;2352;465;2013;0
WireConnection;2352;884;2155;0
WireConnection;2352;337;1953;0
WireConnection;2352;1652;2329;0
WireConnection;2352;624;2032;0
WireConnection;2352;720;2069;0
WireConnection;2352;722;2070;0
WireConnection;2354;0;2359;0
WireConnection;2354;4;2359;0
WireConnection;2354;5;2359;0
WireConnection;2354;2;2352;338
ASEEND*/
//CHKSM=1B197ACC1F99262C595CEDD3D1DDB425C5A98299