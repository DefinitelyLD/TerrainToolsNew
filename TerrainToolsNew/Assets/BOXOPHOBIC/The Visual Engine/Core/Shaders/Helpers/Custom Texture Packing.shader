// Made with Amplify Shader Editor v1.9.8.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Visual Engine/Helpers/Custom Texture Packing"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector] _IsVersion( "_IsVersion", Float ) = 2070
		[HideInInspector] _IsTVEShader( "_IsTVEShader", Float ) = 1
		[HideInInspector] _IsShared( "_IsShared", Float ) = 0
		[HideInInspector] _IsIdentifier( "_IsIdentifier", Float ) = 0
		[HideInInspector] _IsCollected( "_IsCollected", Float ) = 0
		[HideInInspector] _IsConverted( "_IsConverted", Float ) = 0
		[HideInInspector] _IsCustomShader( "_IsCustomShader", Float ) = 0
		[HideInInspector] _MainTex( "Legacy MainTex", 2D ) = "white" {}
		[HideInInspector] _BumpMap( "Legacy BumpMap", 2D ) = "white" {}
		[HideInInspector] _Cutoff( "Legacy Cutoff", Float ) = 0.5
		[HideInInspector] _Color( "Legacy Color", Color ) = ( 0, 0, 0, 0 )
		[StyledCategory(Render Settings, true, 0, 10)] _RenderCategory( "[ Render Category ]", Float ) = 1
		[Enum(Opaque,0,Transparent,1)] _RenderMode( "Render Mode", Float ) = 0
		[Enum(Off,0,On,1)] _RenderZWrite( "Render ZWrite", Float ) = 1
		[Enum(Both,0,Back,1,Front,2)] _RenderCull( "Render Faces", Float ) = 2
		[HideInInspector] _render_normal( "_render_normal", Vector ) = ( 1, 1, 1, 0 )
		[HideInInspector] _RenderQueue( "Render Queue", Float ) = 0
		[HideInInspector] _RenderPriority( "Render Priority", Float ) = 0
		[HideInInspector] _RenderBakeGI( "Render BakeGI", Float ) = 0
		[Enum(Off,0,On,1)] _RenderSSR( "Render SSR", Float ) = 0
		[Enum(Off,0,On,1)] _RenderDecals( "Render Decals", Float ) = 0
		[Enum(Auto,0,Off,1,On,2)] _RenderMotion( "Render Motion", Float ) = 0
		[Enum(Flip,0,Mirror,1,Same,2)] _RenderNormal( "Render Normals", Float ) = 0
		[Enum(Off,0,On,1)] _RenderSpecular( "Render Specular", Float ) = 1
		[Enum(Off,0,On,1)] _RenderShadow( "Render Shadows", Float ) = 1
		[Enum(Default,0,Point ,1,Low,2,Medium,3,High,4)] _RenderFilter( "Render Filtering", Float ) = 0
		[Enum(Off,0,On,1)] _RenderClip( "Render Clipping", Float ) = 0
		[StyledSpace(10)] _RenderEnd( "[ Render End ]", Float ) = 1
		[HideInInspector] _NoiseTex3D( "Noise Mask 3D", 3D ) = "white" {}
		[HideInInspector] _NoiseTexSS( "Noise Mask SS", 2D ) = "white" {}
		[StyledCategory(Main Settings, true, 0, 10)] _MainCategory( "[Main Category ]", Float ) = 1
		[StyledMessage(Info, Use the Multi Mask as leaves mask for Dual Colors__ Global Effects and as Subsurface Mask. The mask is stored in the Shader texture blue channel and it can be in subsurface format or thickness format by inverting the Multi Mask remap slider. , 0, 0)] _MainMultiMaskInfo( "# MainMultiMaskInfo", Float ) = 0
		[StyledMessage(Info, The Smoothness mask is stored in the Shader texture alpha channel and it can be in smoothness format or roughness format by inverting the Smoothness remap slider. , 0, 10)] _MainSmoothnessInfo( "# MainSmoothnessInfo", Float ) = 0
		[StyledTextureSingleLine] _MainAlbedoTex( "Main Albedo", 2D ) = "white" {}
		[StyledTextureSingleLine] _MainNormalTex( "Main Normal", 2D ) = "bump" {}
		[StyledTextureSingleLine] _MainShaderTex( "Main Shader", 2D ) = "white" {}
		[Enum(Main UV,0,Extra UV,1,Planar,2,Triplanar,3,Stochastic,4,Stochastic Triplanar,5)][Space(10)] _MainSampleMode( "Main Sampling", Float ) = 0
		[Enum(Tilling And Offset,0,Scale And Offset,1)] _MainCoordMode( "Main UV Mode", Float ) = 0
		[StyledVector(9)] _MainCoordValue( "Main UV Value", Vector ) = ( 1, 1, 0, 0 )
		[HideInInspector] _main_coord_value( "_main_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[Enum(Constant,0,Dual Colors,1)] _MainColorMode( "Main Color", Float ) = 0
		[HDR] _MainColor( "Main Color", Color ) = ( 1, 1, 1, 1 )
		[HDR] _MainColorTwo( "Main ColorB", Color ) = ( 1, 1, 1, 1 )
		_MainAlbedoValue( "Main Albedo", Range( 0, 1 ) ) = 1
		_MainNormalValue( "Main Normal", Range( -8, 8 ) ) = 1
		[Space(10)][StyledTextureSingleLine] _MainAlphaTex( "Main Alpha", 2D ) = "white" {}
		[Space(10)] _MainAlphaClipValue( "Main Alpha", Range( 0, 1 ) ) = 0.5
		[Enum(Default Albedo Texture A,0,Custom Texture,1)] _MainAlphaSourceMode( "Main Alpha Source", Float ) = 0
		[Enum(Custom Texture R,0,Custom Texture G,1,Custom Texture B,2,Custom Texture A,3)] _MainAlphaChannelMode( "Main Alpha Channel", Float ) = 0
		[Space(10)][StyledTextureSingleLine] _MainMetallicTex( "Main Metallic", 2D ) = "white" {}
		[Space(10)] _MainMetallicValue( "Main Metallic", Range( 0, 1 ) ) = 0
		[Enum(Default Shader Texture R,0,Custom Texture,1)] _MainMetallicSourceMode( "Main Metallic Source", Float ) = 0
		[Enum(Custom Texture R,0,Custom Texture G,1,Custom Texture B,2,Custom Texture A,3)] _MainMetallicChannelMode( "Main Metallic Channel", Float ) = 0
		[Space(10)][StyledTextureSingleLine] _MainOcclusionTex( "Main Occlusion", 2D ) = "white" {}
		[Space(10)] _MainOcclusionValue( "Main Occlusion", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _MainOcclusionRemap( "Main Occlusion", Vector ) = ( 0, 1, 0, 0 )
		[Enum(Default Shader Texture G,0,Custom Texture,1)] _MainOcclusionSourceMode( "Main Occlusion Source", Float ) = 0
		[Enum(Custom Texture R,0,Custom Texture G,1,Custom Texture B,2,Custom Texture A,3)] _MainOcclusionChannelMode( "Main Occlusion Channel", Float ) = 0
		[Space(10)][StyledTextureSingleLine] _MainMultiTex( "Main Multi Mask", 2D ) = "white" {}
		[Space(10)][StyledRemapSlider] _MainMultiRemap( "Main Multi Mask", Vector ) = ( 0, 0, 0, 0 )
		[Enum(Default Shader Texture B,0,Custom Texture,1)] _MainMultiSourceMode( "Main Multi Mask Source", Float ) = 0
		[Enum(Custom Texture R,0,Custom Texture G,1,Custom Texture B,2,Custom Texture A,3)] _MainMultiChannelMode( "Main Multi Mask Channel", Float ) = 0
		[Space(10)][StyledTextureSingleLine] _MainSmoothnessTex( "Main Smoothness", 2D ) = "white" {}
		[Space(10)] _MainSmoothnessValue( "Main Smoothness", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _MainSmoothnessRemap( "Main Smoothness", Vector ) = ( 0, 1, 0, 0 )
		[Enum(Default Shader Texture A,0,Custom Texture,1)] _MainSmoothnessSourceMode( "Main Smoothness Source", Float ) = 0
		[Enum(Custom Texture R,0,Custom Texture G,1,Custom Texture B,2,Custom Texture A,3)] _MainSmoothnessChannelMode( "Main Smoothness Channel", Float ) = 0
		[StyledSpace(10)] _MainEnd( "[Main End ]", Float ) = 1
		[HideInInspector] _render_cull( "_render_cull", Float ) = 0
		[HideInInspector] _render_src( "_render_src", Float ) = 5
		[HideInInspector] _render_dst( "_render_dst", Float ) = 10
		[HideInInspector] _render_zw( "_render_zw", Float ) = 1
		[HideInInspector] _render_coverage( "_render_coverage", Float ) = 0
		[HideInInspector] _IsGeneralShader( "_IsGeneralShader", Float ) = 1
		[HideInInspector] _IsStandardShader( "_IsStandardShader", Float ) = 1

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		//[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1.0
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4 				// DEPRECATED
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4	// DEPRECATED
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _DstBlend2("__dst2", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(UnityEngine.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("Transparent Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4 // Less equal
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4 // Less equal
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0
		[HideInInspector][ToggleUI] _PerPixelSorting("_PerPixelSorting", Float) = 0.0
		[HideInInspector][Enum(UnityEngine.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("Opaque Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector][ToggleUI] _EnableBlendModePreserveSpecularLighting("Enable Blend Mode Preserve Specular Lighting", Float) = 1
		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)

		[HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0

		[HideInInspector][ToggleUI] _AlphaToMaskInspectorValue("_AlphaToMaskInspectorValue", Float) = 0 // Property used to save the alpha to mask state in the inspector
        [HideInInspector][ToggleUI] _AlphaToMask("__alphaToMask", Float) = 0

		//_Refrac ( "Refraction Model", Float) = 0
        [HideInInspector][ToggleUI]_DepthOffsetEnable("Boolean", Float) = 1
        [HideInInspector][ToggleUI]_ConservativeDepthOffsetEnable("Boolean", Float) = 1
	}

	SubShader
	{
		LOD 0

		

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		AlphaToMask Off

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 BaseColor;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularOcclusion;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			float DiffusionProfile;
			float TransmissionMask;
			float Thickness;
			float SubsurfaceMask;
			float Anisotropy;
			float3 Tangent;
			float IridescenceMask;
			float IridescenceThickness;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
		    float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float3 Emission;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPostpass;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float3 Emission;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

        struct PickingSurfaceDescription //Picking
		{
            float3 BentNormal;
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;

			float3 ObjectSpaceNormal;
			float3 WorldSpaceNormal;
			float3 TangentSpaceNormal;
			float3 ObjectSpaceViewDirection;
			float3 WorldSpaceViewDirection;
			float3 ObjectSpacePosition;
		};

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
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

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
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
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM
            #define _ENERGY_CONSERVING_SPECULAR 1
            #define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
            #define ASE_FRAGMENT_NORMAL 0
            #pragma shader_feature_local_fragment _ _DISABLE_DECALS
            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define _MATERIAL_FEATURE_SPECULAR_COLOR 1
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _AMBIENT_OCCLUSION 1
            #define ASE_VERSION 19802
            #define ASE_SRP_VERSION 170004
            #if !defined(ASE_NEED_CULLFACE)
            #define ASE_NEED_CULLFACE 1
            #endif //ASE_NEED_CULLFACE
            #define ASE_USING_SAMPLING_MACROS 1

            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ RENDERING_LAYERS
            #pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile_fragment _ PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
            #pragma multi_compile _ USE_LEGACY_LIGHTMAPS

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _MainOcclusionRemap;
			half4 _MainCoordValue;
			half4 _Color;
			half4 _MainColor;
			half4 _MainMultiRemap;
			half4 _main_coord_value;
			half4 _MainSmoothnessRemap;
			half4 _MainColorTwo;
			half3 _render_normal;
			half _MainMetallicChannelMode;
			half _MainAlbedoValue;
			half _MainSmoothnessInfo;
			half _MainMultiMaskInfo;
			half _MainCoordMode;
			half _MainSampleMode;
			half _MainMetallicSourceMode;
			half _MainMetallicValue;
			half _MainOcclusionSourceMode;
			half _MainEnd;
			half _MainOcclusionValue;
			half _MainSmoothnessChannelMode;
			half _MainSmoothnessSourceMode;
			half _MainSmoothnessValue;
			half _MainMultiChannelMode;
			half _MainMultiSourceMode;
			half _MainColorMode;
			half _MainNormalValue;
			half _MainAlphaChannelMode;
			half _MainAlphaSourceMode;
			half _MainAlphaClipValue;
			half _MainOcclusionChannelMode;
			half _render_src;
			half _MainCategory;
			half _RenderClip;
			half _render_cull;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			half _IsGeneralShader;
			half _RenderZWrite;
			half _IsVersion;
			half _RenderCategory;
			half _RenderEnd;
			half _RenderMode;
			half _RenderCull;
			half _RenderNormal;
			half _RenderBakeGI;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMotion;
			half _Cutoff;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderFilter;
			half _RenderShadow;
			half _IsStandardShader;
			half _RenderSpecular;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_Linear_Repeat);
			SAMPLER(sampler_Linear_Repeat_Aniso8);
			SAMPLER(sampler_Point_Repeat);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MainShaderTex);
			TEXTURE2D(_MainMetallicTex);
			TEXTURE2D(_MainOcclusionTex);
			TEXTURE2D(_MainSmoothnessTex);
			TEXTURE2D(_MainMultiTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_MainAlphaTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local_fragment TVE_FILTER_DEFAULT TVE_FILTER_POINT TVE_FILTER_LOW TVE_FILTER_MEDIUM TVE_FILTER_HIGH
			#pragma shader_feature_local_fragment TVE_MAIN_SAMPLE_MAIN_UV TVE_MAIN_SAMPLE_EXTRA_UV TVE_MAIN_SAMPLE_PLANAR_2D TVE_MAIN_SAMPLE_PLANAR_3D TVE_MAIN_SAMPLE_STOCHASTIC_2D TVE_MAIN_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_vertex TVE_PIVOT_OFF TVE_PIVOT_BAKED TVE_PIVOT_PROC
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			#define TVE_GEOMETRY_SHADER
			//#pragma editor_sync_compilation
			#ifndef ASE_NEEDS_TEXTURE_COORDINATES2 //Needed for ASE 1.9.8.1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			void ComputeWorldCoords( half4 Coords, half3 WorldPosition, out half2 ZX, out half2 ZY, out half2 XY )
			{
				ZX = WorldPosition.xz * Coords.xx - Coords.zz;
				ZY = WorldPosition.yz * Coords.yx - Coords.wz; 
				XY = WorldPosition.xy * Coords.xy - Coords.zw;
			}
			
			half4 SampleMain( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SampleExtra( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			half4 SamplePlanar2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			void ComputeTriplanarWeights( half3 WorldNormal, out half T1, out half T2, out half T3 )
			{
				half3 powNormal = abs( WorldNormal.xyz );
				half3 weights = max( powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal, 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				T1 = weights.y;
				T2 = weights.x;
				T3 = weights.z;
			}
			
			half4 SamplePlanar3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				half4 tex1 = SAMPLE_TEXTURE2D( Texture, Sampler, ZX);
				half4 tex2 = SAMPLE_TEXTURE2D( Texture, Sampler, ZY);
				half4 tex3 = SAMPLE_TEXTURE2D( Texture, Sampler, XY);
				return tex1 * T1 + tex2 * T2 + tex3 * T3;
			}
			
			void ComputeStochasticCoords( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				half2 vertex1, vertex2, vertex3;
				// Scaling of the input
				half2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				half2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				half3 temp = half3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float4 SampleStochastic2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				ComputeStochasticCoords(UV, UV1, UV2, UV3, W1, W2, W3 );
				half4 tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(UV), ddy(UV));
				half4 tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(UV), ddy(UV));
				half4 tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(UV), ddy(UV));
				return tex1 * W1 + tex2 * W2 + tex3 * W3;
			}
			
			half4 SampleStochastic3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				half4 tex1, tex2, tex3;
				ComputeStochasticCoords(ZX, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZX), ddy(ZX));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZX), ddy(ZX));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZX), ddy(ZX));
				half4 texZX = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(ZY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZY), ddy(ZY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZY), ddy(ZY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZY), ddy(ZY));
				half4 texZY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(XY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(XY), ddy(XY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(XY), ddy(XY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(XY), ddy(XY));
				half4 texXY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				return texZX * T1 + texZY * T2 + texXY * T3;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

				#ifdef DECAL_NORMAL_BLENDING
					#ifndef SURFACE_GRADIENT
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
					#if !defined(SHADER_STAGE_RAY_TRACING)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						#ifdef FRAG_INPUTS_USE_TEXCOORD0
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
						#else
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
						#endif
						surfaceData.metallic = 0;
					}
					#endif
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float3 vertexToFrag73_g205214 = ase_positionWS;
				output.ase_texcoord6.xyz = vertexToFrag73_g205214;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205224 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205224 = ( localObjectPosition_UNITY_MATRIX_M14_g205224 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205224 = localObjectPosition_UNITY_MATRIX_M14_g205224;
				#endif
				float3 temp_output_340_7_g205214 = staticSwitch13_g205224;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205226 = ObjectPosition_UNITY_MATRIX_M();
				float3 _Vector0 = float3(0,0,0);
				float3 appendResult60_g205222 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 PositionOS131_g205214 = inputMesh.positionOS;
				float3 break233_g205214 = PositionOS131_g205214;
				float3 appendResult234_g205214 = (float3(break233_g205214.x , 0.0 , break233_g205214.z));
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch229_g205214 = _Vector0;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch229_g205214 = appendResult60_g205222;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch229_g205214 = appendResult234_g205214;
				#else
				float3 staticSwitch229_g205214 = _Vector0;
				#endif
				half3 PivotOS149_g205214 = staticSwitch229_g205214;
				float3 temp_output_122_0_g205226 = PivotOS149_g205214;
				float3 PivotsOnlyWS105_g205226 = mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g205226 , 0.0 ) ).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205226 = ( ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205226 = ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 );
				#endif
				float3 temp_output_341_7_g205214 = staticSwitch13_g205226;
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#else
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#endif
				float3 vertexToFrag76_g205214 = staticSwitch236_g205214;
				output.ase_texcoord7.xyz = vertexToFrag76_g205214;
				
				output.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				output.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord5.zw = 0;
				output.ase_texcoord6.w = 0;
				output.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				output.uv1 = inputMesh.uv1;
				output.uv2 = inputMesh.uv2;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];
				float4 ClipPos = TransformWorldToHClip( PositionRWS );
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float localBreakData4_g207126 = ( 0.0 );
				float localCompData3_g207090 = ( 0.0 );
				TVEVisualData Data3_g207090 = (TVEVisualData)0;
				half4 Dummy130_g207086 = ( _MainCategory + _MainEnd + ( _MainSampleMode + _MainCoordMode + _MainCoordValue ) + _MainMultiMaskInfo + _MainSmoothnessInfo );
				float In_Dummy3_g207090 = Dummy130_g207086.x;
				TEXTURE2D(Texture276_g207087) = _MainAlbedoTex;
				float localFilterTexture19_g207095 = ( 0.0 );
				SamplerState SS19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207095 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207095 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207095 = SamplerDefault19_g207095;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207095 = SamplerDefault19_g207095;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207095 = SamplerPoint19_g207095;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207095 = SamplerLow19_g207095;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207095 = SamplerMedium19_g207095;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207095 = SamplerHigh19_g207095;
				#endif
				}
				SamplerState Sampler276_g207087 = SS19_g207095;
				half4 Local_Coords180_g207086 = _main_coord_value;
				float4 temp_output_37_0_g207087 = Local_Coords180_g207086;
				half4 Coords276_g207087 = temp_output_37_0_g207087;
				half2 TexCoord276_g207087 = packedInput.ase_texcoord5.xy;
				half4 localSampleMain276_g207087 = SampleMain( Texture276_g207087 , Sampler276_g207087 , Coords276_g207087 , TexCoord276_g207087 );
				TEXTURE2D(Texture275_g207087) = _MainAlbedoTex;
				SamplerState Sampler275_g207087 = SS19_g207095;
				half4 Coords275_g207087 = temp_output_37_0_g207087;
				half2 TexCoord275_g207087 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207087 = SampleExtra( Texture275_g207087 , Sampler275_g207087 , Coords275_g207087 , TexCoord275_g207087 );
				TEXTURE2D(Texture238_g207087) = _MainAlbedoTex;
				SamplerState Sampler238_g207087 = SS19_g207095;
				half4 Coords238_g207087 = temp_output_37_0_g207087;
				TVEModelData Data16_g205219 = (TVEModelData)0;
				float In_Dummy16_g205219 = 0.0;
				float3 vertexToFrag73_g205214 = packedInput.ase_texcoord6.xyz;
				half3 PositionWS122_g205214 = vertexToFrag73_g205214;
				float3 In_PositionWS16_g205219 = PositionWS122_g205214;
				float3 vertexToFrag76_g205214 = packedInput.ase_texcoord7.xyz;
				half3 PivotWS121_g205214 = vertexToFrag76_g205214;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g205214 = ( PositionWS122_g205214 - PivotWS121_g205214 );
				#else
				float3 staticSwitch204_g205214 = PositionWS122_g205214;
				#endif
				half3 PositionWO132_g205214 = ( staticSwitch204_g205214 - TVE_WorldOrigin );
				float3 In_PositionWO16_g205219 = PositionWO132_g205214;
				float3 In_PivotWS16_g205219 = PivotWS121_g205214;
				half3 PivotWO133_g205214 = ( PivotWS121_g205214 - TVE_WorldOrigin );
				float3 In_PivotWO16_g205219 = PivotWO133_g205214;
				float3 normalizedWorldNormal = normalize( NormalWS );
				half3 Normal_WS95_g205214 = normalizedWorldNormal;
				float3 In_NormalWS16_g205219 = Normal_WS95_g205214;
				float3 normalizeResult296_g205214 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g205214 ) );
				half3 ViewDirWS169_g205214 = normalizeResult296_g205214;
				float3 In_ViewDirWS16_g205219 = ViewDirWS169_g205214;
				half4 VertexMasks171_g205214 = packedInput.ase_color;
				float4 In_VertexData16_g205219 = VertexMasks171_g205214;
				float4 In_BoundsData16_g205219 = float4( 1,1,1,1 );
				{
				Data16_g205219.Dummy = In_Dummy16_g205219;
				Data16_g205219.PositionWS = In_PositionWS16_g205219;
				Data16_g205219.PositionWO = In_PositionWO16_g205219;
				Data16_g205219.PivotWS = In_PivotWS16_g205219;
				Data16_g205219.PivotWO = In_PivotWO16_g205219;
				Data16_g205219.NormalWS = In_NormalWS16_g205219;
				Data16_g205219.ViewDirWS = In_ViewDirWS16_g205219;
				Data16_g205219.VertexData = In_VertexData16_g205219;
				Data16_g205219.BoundsData = In_BoundsData16_g205219;
				}
				TVEModelData Data15_g207089 = Data16_g205219;
				float Out_Dummy15_g207089 = 0;
				float3 Out_PositionWS15_g207089 = float3( 0,0,0 );
				float3 Out_PositionWO15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWS15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWO15_g207089 = float3( 0,0,0 );
				float3 Out_NormalWS15_g207089 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g207089 = float3( 0,0,0 );
				float4 Out_VertexData15_g207089 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g207089 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g207089 = Data15_g207089.Dummy;
				Out_PositionWS15_g207089 = Data15_g207089.PositionWS;
				Out_PositionWO15_g207089 = Data15_g207089.PositionWO;
				Out_PivotWS15_g207089 = Data15_g207089.PivotWS;
				Out_PivotWO15_g207089 = Data15_g207089.PivotWO;
				Out_NormalWS15_g207089 = Data15_g207089.NormalWS;
				Out_ViewDirWS15_g207089 = Data15_g207089.ViewDirWS;
				Out_VertexData15_g207089 = Data15_g207089.VertexData;
				Out_BoundsData15_g207089 = Data15_g207089.BoundsData;
				}
				half3 Model_PositionWO222_g207086 = Out_PositionWO15_g207089;
				float3 temp_output_279_0_g207087 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207087 = temp_output_279_0_g207087;
				half4 localSamplePlanar2D238_g207087 = SamplePlanar2D( Texture238_g207087 , Sampler238_g207087 , Coords238_g207087 , WorldPosition238_g207087 );
				TEXTURE2D(Texture246_g207087) = _MainAlbedoTex;
				SamplerState Sampler246_g207087 = SS19_g207095;
				half4 Coords246_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition246_g207087 = temp_output_279_0_g207087;
				half3 Model_NormalWS226_g207086 = Out_NormalWS15_g207089;
				float3 temp_output_280_0_g207087 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207087 = temp_output_280_0_g207087;
				half4 localSamplePlanar3D246_g207087 = SamplePlanar3D( Texture246_g207087 , Sampler246_g207087 , Coords246_g207087 , WorldPosition246_g207087 , WorldNormal246_g207087 );
				TEXTURE2D(Texture234_g207087) = _MainAlbedoTex;
				SamplerState Sampler234_g207087 = SS19_g207095;
				float4 Coords234_g207087 = temp_output_37_0_g207087;
				float3 WorldPosition234_g207087 = temp_output_279_0_g207087;
				float4 localSampleStochastic2D234_g207087 = SampleStochastic2D( Texture234_g207087 , Sampler234_g207087 , Coords234_g207087 , WorldPosition234_g207087 );
				TEXTURE2D(Texture263_g207087) = _MainAlbedoTex;
				SamplerState Sampler263_g207087 = SS19_g207095;
				half4 Coords263_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition263_g207087 = temp_output_279_0_g207087;
				half3 WorldNormal263_g207087 = temp_output_280_0_g207087;
				half4 localSampleStochastic3D263_g207087 = SampleStochastic3D( Texture263_g207087 , Sampler263_g207087 , Coords263_g207087 , WorldPosition263_g207087 , WorldNormal263_g207087 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch184_g207086 = localSampleExtra275_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch184_g207086 = localSamplePlanar2D238_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch184_g207086 = localSamplePlanar3D246_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch184_g207086 = localSampleStochastic2D234_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch184_g207086 = localSampleStochastic3D263_g207087;
				#else
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#endif
				half4 Local_AlbedoTex185_g207086 = staticSwitch184_g207086;
				float3 lerpResult53_g207086 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex185_g207086).xyz , _MainAlbedoValue);
				half3 Local_AlbedoRGB107_g207086 = lerpResult53_g207086;
				TEXTURE2D(Texture276_g207096) = _MainShaderTex;
				float localFilterTexture30_g207097 = ( 0.0 );
				SamplerState SS30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207097 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207097 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207097 = SamplerDefault30_g207097;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207097 = SamplerDefault30_g207097;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207097 = SamplerPoint30_g207097;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207097 = SamplerLow30_g207097;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207097 = SamplerMedium30_g207097;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207097 = SamplerHigh30_g207097;
				#endif
				}
				SamplerState Sampler276_g207096 = SS30_g207097;
				float4 temp_output_37_0_g207096 = Local_Coords180_g207086;
				half4 Coords276_g207096 = temp_output_37_0_g207096;
				half2 TexCoord276_g207096 = packedInput.ase_texcoord5.xy;
				half4 localSampleMain276_g207096 = SampleMain( Texture276_g207096 , Sampler276_g207096 , Coords276_g207096 , TexCoord276_g207096 );
				TEXTURE2D(Texture275_g207096) = _MainShaderTex;
				SamplerState Sampler275_g207096 = SS30_g207097;
				half4 Coords275_g207096 = temp_output_37_0_g207096;
				half2 TexCoord275_g207096 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207096 = SampleExtra( Texture275_g207096 , Sampler275_g207096 , Coords275_g207096 , TexCoord275_g207096 );
				TEXTURE2D(Texture238_g207096) = _MainShaderTex;
				SamplerState Sampler238_g207096 = SS30_g207097;
				half4 Coords238_g207096 = temp_output_37_0_g207096;
				float3 temp_output_279_0_g207096 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207096 = temp_output_279_0_g207096;
				half4 localSamplePlanar2D238_g207096 = SamplePlanar2D( Texture238_g207096 , Sampler238_g207096 , Coords238_g207096 , WorldPosition238_g207096 );
				TEXTURE2D(Texture246_g207096) = _MainShaderTex;
				SamplerState Sampler246_g207096 = SS30_g207097;
				half4 Coords246_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition246_g207096 = temp_output_279_0_g207096;
				float3 temp_output_280_0_g207096 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207096 = temp_output_280_0_g207096;
				half4 localSamplePlanar3D246_g207096 = SamplePlanar3D( Texture246_g207096 , Sampler246_g207096 , Coords246_g207096 , WorldPosition246_g207096 , WorldNormal246_g207096 );
				TEXTURE2D(Texture234_g207096) = _MainShaderTex;
				SamplerState Sampler234_g207096 = SS30_g207097;
				float4 Coords234_g207096 = temp_output_37_0_g207096;
				float3 WorldPosition234_g207096 = temp_output_279_0_g207096;
				float4 localSampleStochastic2D234_g207096 = SampleStochastic2D( Texture234_g207096 , Sampler234_g207096 , Coords234_g207096 , WorldPosition234_g207096 );
				TEXTURE2D(Texture263_g207096) = _MainShaderTex;
				SamplerState Sampler263_g207096 = SS30_g207097;
				half4 Coords263_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition263_g207096 = temp_output_279_0_g207096;
				half3 WorldNormal263_g207096 = temp_output_280_0_g207096;
				half4 localSampleStochastic3D263_g207096 = SampleStochastic3D( Texture263_g207096 , Sampler263_g207096 , Coords263_g207096 , WorldPosition263_g207096 , WorldNormal263_g207096 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch198_g207086 = localSampleExtra275_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch198_g207086 = localSamplePlanar2D238_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch198_g207086 = localSamplePlanar3D246_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch198_g207086 = localSampleStochastic2D234_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch198_g207086 = localSampleStochastic3D263_g207096;
				#else
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#endif
				half4 Local_ShaderTex199_g207086 = staticSwitch198_g207086;
				float temp_output_17_0_g207112 = _MainMetallicChannelMode;
				TEXTURE2D(Texture276_g207100) = _MainMetallicTex;
				float localFilterTexture30_g207101 = ( 0.0 );
				SamplerState SS30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207101 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207101 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207101 = SamplerDefault30_g207101;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207101 = SamplerDefault30_g207101;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207101 = SamplerPoint30_g207101;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207101 = SamplerLow30_g207101;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207101 = SamplerMedium30_g207101;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207101 = SamplerHigh30_g207101;
				#endif
				}
				SamplerState Sampler276_g207100 = SS30_g207101;
				float4 temp_output_37_0_g207100 = Local_Coords180_g207086;
				half4 Coords276_g207100 = temp_output_37_0_g207100;
				half2 TexCoord276_g207100 = packedInput.ase_texcoord5.xy;
				half4 localSampleMain276_g207100 = SampleMain( Texture276_g207100 , Sampler276_g207100 , Coords276_g207100 , TexCoord276_g207100 );
				TEXTURE2D(Texture275_g207100) = _MainMetallicTex;
				SamplerState Sampler275_g207100 = SS30_g207101;
				half4 Coords275_g207100 = temp_output_37_0_g207100;
				half2 TexCoord275_g207100 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207100 = SampleExtra( Texture275_g207100 , Sampler275_g207100 , Coords275_g207100 , TexCoord275_g207100 );
				TEXTURE2D(Texture238_g207100) = _MainMetallicTex;
				SamplerState Sampler238_g207100 = SS30_g207101;
				half4 Coords238_g207100 = temp_output_37_0_g207100;
				float3 temp_output_279_0_g207100 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207100 = temp_output_279_0_g207100;
				half4 localSamplePlanar2D238_g207100 = SamplePlanar2D( Texture238_g207100 , Sampler238_g207100 , Coords238_g207100 , WorldPosition238_g207100 );
				TEXTURE2D(Texture246_g207100) = _MainMetallicTex;
				SamplerState Sampler246_g207100 = SS30_g207101;
				half4 Coords246_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition246_g207100 = temp_output_279_0_g207100;
				float3 temp_output_280_0_g207100 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207100 = temp_output_280_0_g207100;
				half4 localSamplePlanar3D246_g207100 = SamplePlanar3D( Texture246_g207100 , Sampler246_g207100 , Coords246_g207100 , WorldPosition246_g207100 , WorldNormal246_g207100 );
				TEXTURE2D(Texture234_g207100) = _MainMetallicTex;
				SamplerState Sampler234_g207100 = SS30_g207101;
				float4 Coords234_g207100 = temp_output_37_0_g207100;
				float3 WorldPosition234_g207100 = temp_output_279_0_g207100;
				float4 localSampleStochastic2D234_g207100 = SampleStochastic2D( Texture234_g207100 , Sampler234_g207100 , Coords234_g207100 , WorldPosition234_g207100 );
				TEXTURE2D(Texture263_g207100) = _MainMetallicTex;
				SamplerState Sampler263_g207100 = SS30_g207101;
				half4 Coords263_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition263_g207100 = temp_output_279_0_g207100;
				half3 WorldNormal263_g207100 = temp_output_280_0_g207100;
				half4 localSampleStochastic3D263_g207100 = SampleStochastic3D( Texture263_g207100 , Sampler263_g207100 , Coords263_g207100 , WorldPosition263_g207100 , WorldNormal263_g207100 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch335_g207086 = localSampleExtra275_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch335_g207086 = localSamplePlanar2D238_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch335_g207086 = localSamplePlanar3D246_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch335_g207086 = localSampleStochastic2D234_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch335_g207086 = localSampleStochastic3D263_g207100;
				#else
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#endif
				half4 Local_MetallicTex341_g207086 = staticSwitch335_g207086;
				float4 break59_g207112 = Local_MetallicTex341_g207086;
				float ifLocalVar58_g207112 = 0;
				if( temp_output_17_0_g207112 == 0.0 )
				ifLocalVar58_g207112 = break59_g207112.x;
				float ifLocalVar60_g207112 = 0;
				if( temp_output_17_0_g207112 == 1.0 )
				ifLocalVar60_g207112 = break59_g207112.y;
				float ifLocalVar61_g207112 = 0;
				if( temp_output_17_0_g207112 == 2.0 )
				ifLocalVar61_g207112 = break59_g207112.z;
				float ifLocalVar62_g207112 = 0;
				if( temp_output_17_0_g207112 == 3.0 )
				ifLocalVar62_g207112 = break59_g207112.w;
				float lerpResult366_g207086 = lerp( (Local_ShaderTex199_g207086).x , ( ifLocalVar58_g207112 + ifLocalVar60_g207112 + ifLocalVar61_g207112 + ifLocalVar62_g207112 ) , _MainMetallicSourceMode);
				half Local_Metallic322_g207086 = ( lerpResult366_g207086 * _MainMetallicValue );
				float temp_output_17_0_g207113 = _MainOcclusionChannelMode;
				TEXTURE2D(Texture276_g207102) = _MainOcclusionTex;
				float localFilterTexture30_g207108 = ( 0.0 );
				SamplerState SS30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207108 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207108 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207108 = SamplerDefault30_g207108;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207108 = SamplerDefault30_g207108;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207108 = SamplerPoint30_g207108;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207108 = SamplerLow30_g207108;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207108 = SamplerMedium30_g207108;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207108 = SamplerHigh30_g207108;
				#endif
				}
				SamplerState Sampler276_g207102 = SS30_g207108;
				float4 temp_output_37_0_g207102 = Local_Coords180_g207086;
				half4 Coords276_g207102 = temp_output_37_0_g207102;
				half2 TexCoord276_g207102 = packedInput.ase_texcoord5.xy;
				half4 localSampleMain276_g207102 = SampleMain( Texture276_g207102 , Sampler276_g207102 , Coords276_g207102 , TexCoord276_g207102 );
				TEXTURE2D(Texture275_g207102) = _MainOcclusionTex;
				SamplerState Sampler275_g207102 = SS30_g207108;
				half4 Coords275_g207102 = temp_output_37_0_g207102;
				half2 TexCoord275_g207102 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207102 = SampleExtra( Texture275_g207102 , Sampler275_g207102 , Coords275_g207102 , TexCoord275_g207102 );
				TEXTURE2D(Texture238_g207102) = _MainOcclusionTex;
				SamplerState Sampler238_g207102 = SS30_g207108;
				half4 Coords238_g207102 = temp_output_37_0_g207102;
				float3 temp_output_279_0_g207102 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207102 = temp_output_279_0_g207102;
				half4 localSamplePlanar2D238_g207102 = SamplePlanar2D( Texture238_g207102 , Sampler238_g207102 , Coords238_g207102 , WorldPosition238_g207102 );
				TEXTURE2D(Texture246_g207102) = _MainOcclusionTex;
				SamplerState Sampler246_g207102 = SS30_g207108;
				half4 Coords246_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition246_g207102 = temp_output_279_0_g207102;
				float3 temp_output_280_0_g207102 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207102 = temp_output_280_0_g207102;
				half4 localSamplePlanar3D246_g207102 = SamplePlanar3D( Texture246_g207102 , Sampler246_g207102 , Coords246_g207102 , WorldPosition246_g207102 , WorldNormal246_g207102 );
				TEXTURE2D(Texture234_g207102) = _MainOcclusionTex;
				SamplerState Sampler234_g207102 = SS30_g207108;
				float4 Coords234_g207102 = temp_output_37_0_g207102;
				float3 WorldPosition234_g207102 = temp_output_279_0_g207102;
				float4 localSampleStochastic2D234_g207102 = SampleStochastic2D( Texture234_g207102 , Sampler234_g207102 , Coords234_g207102 , WorldPosition234_g207102 );
				TEXTURE2D(Texture263_g207102) = _MainOcclusionTex;
				SamplerState Sampler263_g207102 = SS30_g207108;
				half4 Coords263_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition263_g207102 = temp_output_279_0_g207102;
				half3 WorldNormal263_g207102 = temp_output_280_0_g207102;
				half4 localSampleStochastic3D263_g207102 = SampleStochastic3D( Texture263_g207102 , Sampler263_g207102 , Coords263_g207102 , WorldPosition263_g207102 , WorldNormal263_g207102 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch343_g207086 = localSampleExtra275_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch343_g207086 = localSamplePlanar2D238_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch343_g207086 = localSamplePlanar3D246_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch343_g207086 = localSampleStochastic2D234_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch343_g207086 = localSampleStochastic3D263_g207102;
				#else
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#endif
				half4 Local_OcclusionTex349_g207086 = staticSwitch343_g207086;
				float4 break59_g207113 = Local_OcclusionTex349_g207086;
				float ifLocalVar58_g207113 = 0;
				if( temp_output_17_0_g207113 == 0.0 )
				ifLocalVar58_g207113 = break59_g207113.x;
				float ifLocalVar60_g207113 = 0;
				if( temp_output_17_0_g207113 == 1.0 )
				ifLocalVar60_g207113 = break59_g207113.y;
				float ifLocalVar61_g207113 = 0;
				if( temp_output_17_0_g207113 == 2.0 )
				ifLocalVar61_g207113 = break59_g207113.z;
				float ifLocalVar62_g207113 = 0;
				if( temp_output_17_0_g207113 == 3.0 )
				ifLocalVar62_g207113 = break59_g207113.w;
				float lerpResult373_g207086 = lerp( (Local_ShaderTex199_g207086).y , ( ifLocalVar58_g207113 + ifLocalVar60_g207113 + ifLocalVar61_g207113 + ifLocalVar62_g207113 ) , _MainOcclusionSourceMode);
				float clampResult17_g207110 = clamp( lerpResult373_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207109 = _MainOcclusionRemap.x;
				float temp_output_9_0_g207109 = ( clampResult17_g207110 - temp_output_7_0_g207109 );
				float lerpResult23_g207086 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g207109 * _MainOcclusionRemap.z ) + 0.0001 ) ) , _MainOcclusionValue);
				half Local_Occlusion313_g207086 = lerpResult23_g207086;
				float temp_output_17_0_g207115 = _MainSmoothnessChannelMode;
				TEXTURE2D(Texture276_g207105) = _MainSmoothnessTex;
				float localFilterTexture30_g207106 = ( 0.0 );
				SamplerState SS30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207106 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207106 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207106 = SamplerDefault30_g207106;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207106 = SamplerDefault30_g207106;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207106 = SamplerPoint30_g207106;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207106 = SamplerLow30_g207106;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207106 = SamplerMedium30_g207106;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207106 = SamplerHigh30_g207106;
				#endif
				}
				SamplerState Sampler276_g207105 = SS30_g207106;
				float4 temp_output_37_0_g207105 = Local_Coords180_g207086;
				half4 Coords276_g207105 = temp_output_37_0_g207105;
				half2 TexCoord276_g207105 = packedInput.ase_texcoord5.xy;
				half4 localSampleMain276_g207105 = SampleMain( Texture276_g207105 , Sampler276_g207105 , Coords276_g207105 , TexCoord276_g207105 );
				TEXTURE2D(Texture275_g207105) = _MainSmoothnessTex;
				SamplerState Sampler275_g207105 = SS30_g207106;
				half4 Coords275_g207105 = temp_output_37_0_g207105;
				half2 TexCoord275_g207105 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207105 = SampleExtra( Texture275_g207105 , Sampler275_g207105 , Coords275_g207105 , TexCoord275_g207105 );
				TEXTURE2D(Texture238_g207105) = _MainSmoothnessTex;
				SamplerState Sampler238_g207105 = SS30_g207106;
				half4 Coords238_g207105 = temp_output_37_0_g207105;
				float3 temp_output_279_0_g207105 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207105 = temp_output_279_0_g207105;
				half4 localSamplePlanar2D238_g207105 = SamplePlanar2D( Texture238_g207105 , Sampler238_g207105 , Coords238_g207105 , WorldPosition238_g207105 );
				TEXTURE2D(Texture246_g207105) = _MainSmoothnessTex;
				SamplerState Sampler246_g207105 = SS30_g207106;
				half4 Coords246_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition246_g207105 = temp_output_279_0_g207105;
				float3 temp_output_280_0_g207105 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207105 = temp_output_280_0_g207105;
				half4 localSamplePlanar3D246_g207105 = SamplePlanar3D( Texture246_g207105 , Sampler246_g207105 , Coords246_g207105 , WorldPosition246_g207105 , WorldNormal246_g207105 );
				TEXTURE2D(Texture234_g207105) = _MainSmoothnessTex;
				SamplerState Sampler234_g207105 = SS30_g207106;
				float4 Coords234_g207105 = temp_output_37_0_g207105;
				float3 WorldPosition234_g207105 = temp_output_279_0_g207105;
				float4 localSampleStochastic2D234_g207105 = SampleStochastic2D( Texture234_g207105 , Sampler234_g207105 , Coords234_g207105 , WorldPosition234_g207105 );
				TEXTURE2D(Texture263_g207105) = _MainSmoothnessTex;
				SamplerState Sampler263_g207105 = SS30_g207106;
				half4 Coords263_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition263_g207105 = temp_output_279_0_g207105;
				half3 WorldNormal263_g207105 = temp_output_280_0_g207105;
				half4 localSampleStochastic3D263_g207105 = SampleStochastic3D( Texture263_g207105 , Sampler263_g207105 , Coords263_g207105 , WorldPosition263_g207105 , WorldNormal263_g207105 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch359_g207086 = localSampleExtra275_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch359_g207086 = localSamplePlanar2D238_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch359_g207086 = localSamplePlanar3D246_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch359_g207086 = localSampleStochastic2D234_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch359_g207086 = localSampleStochastic3D263_g207105;
				#else
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#endif
				half4 Local_SmoothnessTex365_g207086 = staticSwitch359_g207086;
				float4 break59_g207115 = Local_SmoothnessTex365_g207086;
				float ifLocalVar58_g207115 = 0;
				if( temp_output_17_0_g207115 == 0.0 )
				ifLocalVar58_g207115 = break59_g207115.x;
				float ifLocalVar60_g207115 = 0;
				if( temp_output_17_0_g207115 == 1.0 )
				ifLocalVar60_g207115 = break59_g207115.y;
				float ifLocalVar61_g207115 = 0;
				if( temp_output_17_0_g207115 == 2.0 )
				ifLocalVar61_g207115 = break59_g207115.z;
				float ifLocalVar62_g207115 = 0;
				if( temp_output_17_0_g207115 == 3.0 )
				ifLocalVar62_g207115 = break59_g207115.w;
				float3 temp_cast_2 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 temp_cast_3 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 linearToGamma404_g207086 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult374_g207086 = lerp( (Local_ShaderTex199_g207086).w , (linearToGamma404_g207086).x , _MainSmoothnessSourceMode);
				float clampResult17_g207119 = clamp( lerpResult374_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207118 = _MainSmoothnessRemap.x;
				float temp_output_9_0_g207118 = ( clampResult17_g207119 - temp_output_7_0_g207118 );
				half Local_Smoothness317_g207086 = ( saturate( ( ( temp_output_9_0_g207118 * _MainSmoothnessRemap.z ) + 0.0001 ) ) * _MainSmoothnessValue );
				float4 appendResult73_g207086 = (float4(Local_Metallic322_g207086 , Local_Occlusion313_g207086 , 0.0 , Local_Smoothness317_g207086));
				half4 Local_Masks109_g207086 = appendResult73_g207086;
				float temp_output_17_0_g207114 = _MainMultiChannelMode;
				TEXTURE2D(Texture276_g207103) = _MainMultiTex;
				float localFilterTexture30_g207104 = ( 0.0 );
				SamplerState SS30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207104 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207104 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207104 = SamplerDefault30_g207104;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207104 = SamplerDefault30_g207104;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207104 = SamplerPoint30_g207104;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207104 = SamplerLow30_g207104;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207104 = SamplerMedium30_g207104;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207104 = SamplerHigh30_g207104;
				#endif
				}
				SamplerState Sampler276_g207103 = SS30_g207104;
				float4 temp_output_37_0_g207103 = Local_Coords180_g207086;
				half4 Coords276_g207103 = temp_output_37_0_g207103;
				half2 TexCoord276_g207103 = packedInput.ase_texcoord5.xy;
				half4 localSampleMain276_g207103 = SampleMain( Texture276_g207103 , Sampler276_g207103 , Coords276_g207103 , TexCoord276_g207103 );
				TEXTURE2D(Texture275_g207103) = _MainMultiTex;
				SamplerState Sampler275_g207103 = SS30_g207104;
				half4 Coords275_g207103 = temp_output_37_0_g207103;
				half2 TexCoord275_g207103 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207103 = SampleExtra( Texture275_g207103 , Sampler275_g207103 , Coords275_g207103 , TexCoord275_g207103 );
				TEXTURE2D(Texture238_g207103) = _MainMultiTex;
				SamplerState Sampler238_g207103 = SS30_g207104;
				half4 Coords238_g207103 = temp_output_37_0_g207103;
				float3 temp_output_279_0_g207103 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207103 = temp_output_279_0_g207103;
				half4 localSamplePlanar2D238_g207103 = SamplePlanar2D( Texture238_g207103 , Sampler238_g207103 , Coords238_g207103 , WorldPosition238_g207103 );
				TEXTURE2D(Texture246_g207103) = _MainMultiTex;
				SamplerState Sampler246_g207103 = SS30_g207104;
				half4 Coords246_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition246_g207103 = temp_output_279_0_g207103;
				float3 temp_output_280_0_g207103 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207103 = temp_output_280_0_g207103;
				half4 localSamplePlanar3D246_g207103 = SamplePlanar3D( Texture246_g207103 , Sampler246_g207103 , Coords246_g207103 , WorldPosition246_g207103 , WorldNormal246_g207103 );
				TEXTURE2D(Texture234_g207103) = _MainMultiTex;
				SamplerState Sampler234_g207103 = SS30_g207104;
				float4 Coords234_g207103 = temp_output_37_0_g207103;
				float3 WorldPosition234_g207103 = temp_output_279_0_g207103;
				float4 localSampleStochastic2D234_g207103 = SampleStochastic2D( Texture234_g207103 , Sampler234_g207103 , Coords234_g207103 , WorldPosition234_g207103 );
				TEXTURE2D(Texture263_g207103) = _MainMultiTex;
				SamplerState Sampler263_g207103 = SS30_g207104;
				half4 Coords263_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition263_g207103 = temp_output_279_0_g207103;
				half3 WorldNormal263_g207103 = temp_output_280_0_g207103;
				half4 localSampleStochastic3D263_g207103 = SampleStochastic3D( Texture263_g207103 , Sampler263_g207103 , Coords263_g207103 , WorldPosition263_g207103 , WorldNormal263_g207103 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch351_g207086 = localSampleExtra275_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch351_g207086 = localSamplePlanar2D238_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch351_g207086 = localSamplePlanar3D246_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch351_g207086 = localSampleStochastic2D234_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch351_g207086 = localSampleStochastic3D263_g207103;
				#else
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#endif
				half4 Local_MultiTex357_g207086 = staticSwitch351_g207086;
				float4 break59_g207114 = Local_MultiTex357_g207086;
				float ifLocalVar58_g207114 = 0;
				if( temp_output_17_0_g207114 == 0.0 )
				ifLocalVar58_g207114 = break59_g207114.x;
				float ifLocalVar60_g207114 = 0;
				if( temp_output_17_0_g207114 == 1.0 )
				ifLocalVar60_g207114 = break59_g207114.y;
				float ifLocalVar61_g207114 = 0;
				if( temp_output_17_0_g207114 == 2.0 )
				ifLocalVar61_g207114 = break59_g207114.z;
				float ifLocalVar62_g207114 = 0;
				if( temp_output_17_0_g207114 == 3.0 )
				ifLocalVar62_g207114 = break59_g207114.w;
				float lerpResult378_g207086 = lerp( (Local_Masks109_g207086).z , ( ifLocalVar58_g207114 + ifLocalVar60_g207114 + ifLocalVar61_g207114 + ifLocalVar62_g207114 ) , _MainMultiSourceMode);
				float clampResult17_g207116 = clamp( lerpResult378_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207117 = _MainMultiRemap.x;
				float temp_output_9_0_g207117 = ( clampResult17_g207116 - temp_output_7_0_g207117 );
				half Local_MultiMask78_g207086 = saturate( ( ( temp_output_9_0_g207117 * _MainMultiRemap.z ) + 0.0001 ) );
				float lerpResult58_g207086 = lerp( 1.0 , Local_MultiMask78_g207086 , _MainColorMode);
				float4 lerpResult62_g207086 = lerp( _MainColorTwo , _MainColor , lerpResult58_g207086);
				half3 Local_ColorRGB93_g207086 = (lerpResult62_g207086).rgb;
				half3 Local_Albedo139_g207086 = ( Local_AlbedoRGB107_g207086 * Local_ColorRGB93_g207086 );
				float3 In_Albedo3_g207090 = Local_Albedo139_g207086;
				float3 In_AlbedoRaw3_g207090 = Local_Albedo139_g207086;
				TEXTURE2D(Texture276_g207088) = _MainNormalTex;
				float localFilterTexture29_g207094 = ( 0.0 );
				SamplerState SS29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g207094 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g207094 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g207094 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g207094 = SamplerDefault29_g207094;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g207094 = SamplerDefault29_g207094;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g207094 = SamplerPoint29_g207094;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g207094 = SamplerLow29_g207094;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g207094 = SamplerMedium29_g207094;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g207094 = SamplerHigh29_g207094;
				#endif
				}
				SamplerState Sampler276_g207088 = SS29_g207094;
				float4 temp_output_37_0_g207088 = Local_Coords180_g207086;
				half4 Coords276_g207088 = temp_output_37_0_g207088;
				half2 TexCoord276_g207088 = packedInput.ase_texcoord5.xy;
				half4 localSampleMain276_g207088 = SampleMain( Texture276_g207088 , Sampler276_g207088 , Coords276_g207088 , TexCoord276_g207088 );
				TEXTURE2D(Texture275_g207088) = _MainNormalTex;
				SamplerState Sampler275_g207088 = SS29_g207094;
				half4 Coords275_g207088 = temp_output_37_0_g207088;
				half2 TexCoord275_g207088 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207088 = SampleExtra( Texture275_g207088 , Sampler275_g207088 , Coords275_g207088 , TexCoord275_g207088 );
				TEXTURE2D(Texture238_g207088) = _MainNormalTex;
				SamplerState Sampler238_g207088 = SS29_g207094;
				half4 Coords238_g207088 = temp_output_37_0_g207088;
				float3 temp_output_279_0_g207088 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207088 = temp_output_279_0_g207088;
				half4 localSamplePlanar2D238_g207088 = SamplePlanar2D( Texture238_g207088 , Sampler238_g207088 , Coords238_g207088 , WorldPosition238_g207088 );
				TEXTURE2D(Texture246_g207088) = _MainNormalTex;
				SamplerState Sampler246_g207088 = SS29_g207094;
				half4 Coords246_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition246_g207088 = temp_output_279_0_g207088;
				float3 temp_output_280_0_g207088 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207088 = temp_output_280_0_g207088;
				half4 localSamplePlanar3D246_g207088 = SamplePlanar3D( Texture246_g207088 , Sampler246_g207088 , Coords246_g207088 , WorldPosition246_g207088 , WorldNormal246_g207088 );
				TEXTURE2D(Texture234_g207088) = _MainNormalTex;
				SamplerState Sampler234_g207088 = SS29_g207094;
				float4 Coords234_g207088 = temp_output_37_0_g207088;
				float3 WorldPosition234_g207088 = temp_output_279_0_g207088;
				float4 localSampleStochastic2D234_g207088 = SampleStochastic2D( Texture234_g207088 , Sampler234_g207088 , Coords234_g207088 , WorldPosition234_g207088 );
				TEXTURE2D(Texture263_g207088) = _MainNormalTex;
				SamplerState Sampler263_g207088 = SS29_g207094;
				half4 Coords263_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition263_g207088 = temp_output_279_0_g207088;
				half3 WorldNormal263_g207088 = temp_output_280_0_g207088;
				half4 localSampleStochastic3D263_g207088 = SampleStochastic3D( Texture263_g207088 , Sampler263_g207088 , Coords263_g207088 , WorldPosition263_g207088 , WorldNormal263_g207088 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch193_g207086 = localSampleExtra275_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch193_g207086 = localSamplePlanar2D238_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch193_g207086 = localSamplePlanar3D246_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch193_g207086 = localSampleStochastic2D234_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch193_g207086 = localSampleStochastic3D263_g207088;
				#else
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#endif
				half4 Local_NormaTex191_g207086 = staticSwitch193_g207086;
				half4 Normal_Packed45_g207091 = Local_NormaTex191_g207086;
				float2 appendResult58_g207091 = (float2(( (Normal_Packed45_g207091).x * (Normal_Packed45_g207091).w ) , (Normal_Packed45_g207091).y));
				half2 Normal_Default50_g207091 = appendResult58_g207091;
				half2 Normal_ASTC41_g207091 = (Normal_Packed45_g207091).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g207091 = Normal_ASTC41_g207091;
				#else
				float2 staticSwitch38_g207091 = Normal_Default50_g207091;
				#endif
				half2 Normal_NO_DTX544_g207091 = (Normal_Packed45_g207091).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g207091 = Normal_NO_DTX544_g207091;
				#else
				float2 staticSwitch37_g207091 = staticSwitch38_g207091;
				#endif
				float2 temp_output_26_0_g207086 = ( (staticSwitch37_g207091*2.0 + -1.0) * _MainNormalValue );
				float3x3 ase_worldToTangent = float3x3( TangentWS.xyz, BitangentWS, NormalWS );
				half2 Normal_Planar45_g207092 = temp_output_26_0_g207086;
				float2 break71_g207092 = Normal_Planar45_g207092;
				float3 appendResult72_g207092 = (float3(break71_g207092.x , 0.0 , break71_g207092.y));
				float2 temp_output_205_0_g207086 = (mul( ase_worldToTangent, appendResult72_g207092 )).xy;
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#else
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#endif
				half2 Local_NormalTS108_g207086 = staticSwitch204_g207086;
				float2 In_NormalTS3_g207090 = Local_NormalTS108_g207086;
				float3 appendResult68_g207093 = (float3(Local_NormalTS108_g207086 , 1.0));
				float3 tanToWorld0 = float3( TangentWS.xyz.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.xyz.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.xyz.z, BitangentWS.z, NormalWS.z );
				float3 tanNormal74_g207093 = appendResult68_g207093;
				float3 worldNormal74_g207093 = normalize( float3( dot( tanToWorld0, tanNormal74_g207093 ), dot( tanToWorld1, tanNormal74_g207093 ), dot( tanToWorld2, tanNormal74_g207093 ) ) );
				half3 Local_NormalWS250_g207086 = worldNormal74_g207093;
				float3 In_NormalWS3_g207090 = Local_NormalWS250_g207086;
				float4 In_Shader3_g207090 = Local_Masks109_g207086;
				float4 In_Emissive3_g207090 = half4( 1, 1, 1, 1 );
				float3 temp_output_3_0_g207107 = Local_Albedo139_g207086;
				float dotResult20_g207107 = dot( temp_output_3_0_g207107 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale110_g207086 = dotResult20_g207107;
				float In_Grayscale3_g207090 = Local_Grayscale110_g207086;
				float clampResult144_g207086 = clamp( saturate( ( Local_Grayscale110_g207086 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity145_g207086 = clampResult144_g207086;
				float In_Luminosity3_g207090 = Local_Luminosity145_g207086;
				float In_MultiMask3_g207090 = Local_MultiMask78_g207086;
				float temp_output_17_0_g207111 = _MainAlphaChannelMode;
				TEXTURE2D(Texture276_g207098) = _MainAlphaTex;
				float localFilterTexture19_g207099 = ( 0.0 );
				SamplerState SS19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207099 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207099 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207099 = SamplerDefault19_g207099;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207099 = SamplerDefault19_g207099;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207099 = SamplerPoint19_g207099;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207099 = SamplerLow19_g207099;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207099 = SamplerMedium19_g207099;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207099 = SamplerHigh19_g207099;
				#endif
				}
				SamplerState Sampler276_g207098 = SS19_g207099;
				float4 temp_output_37_0_g207098 = Local_Coords180_g207086;
				half4 Coords276_g207098 = temp_output_37_0_g207098;
				half2 TexCoord276_g207098 = packedInput.ase_texcoord5.xy;
				half4 localSampleMain276_g207098 = SampleMain( Texture276_g207098 , Sampler276_g207098 , Coords276_g207098 , TexCoord276_g207098 );
				TEXTURE2D(Texture275_g207098) = _MainAlphaTex;
				SamplerState Sampler275_g207098 = SS19_g207099;
				half4 Coords275_g207098 = temp_output_37_0_g207098;
				half2 TexCoord275_g207098 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207098 = SampleExtra( Texture275_g207098 , Sampler275_g207098 , Coords275_g207098 , TexCoord275_g207098 );
				TEXTURE2D(Texture238_g207098) = _MainAlphaTex;
				SamplerState Sampler238_g207098 = SS19_g207099;
				half4 Coords238_g207098 = temp_output_37_0_g207098;
				float3 temp_output_279_0_g207098 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207098 = temp_output_279_0_g207098;
				half4 localSamplePlanar2D238_g207098 = SamplePlanar2D( Texture238_g207098 , Sampler238_g207098 , Coords238_g207098 , WorldPosition238_g207098 );
				TEXTURE2D(Texture246_g207098) = _MainAlphaTex;
				SamplerState Sampler246_g207098 = SS19_g207099;
				half4 Coords246_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition246_g207098 = temp_output_279_0_g207098;
				float3 temp_output_280_0_g207098 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207098 = temp_output_280_0_g207098;
				half4 localSamplePlanar3D246_g207098 = SamplePlanar3D( Texture246_g207098 , Sampler246_g207098 , Coords246_g207098 , WorldPosition246_g207098 , WorldNormal246_g207098 );
				TEXTURE2D(Texture234_g207098) = _MainAlphaTex;
				SamplerState Sampler234_g207098 = SS19_g207099;
				float4 Coords234_g207098 = temp_output_37_0_g207098;
				float3 WorldPosition234_g207098 = temp_output_279_0_g207098;
				float4 localSampleStochastic2D234_g207098 = SampleStochastic2D( Texture234_g207098 , Sampler234_g207098 , Coords234_g207098 , WorldPosition234_g207098 );
				TEXTURE2D(Texture263_g207098) = _MainAlphaTex;
				SamplerState Sampler263_g207098 = SS19_g207099;
				half4 Coords263_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition263_g207098 = temp_output_279_0_g207098;
				half3 WorldNormal263_g207098 = temp_output_280_0_g207098;
				half4 localSampleStochastic3D263_g207098 = SampleStochastic3D( Texture263_g207098 , Sampler263_g207098 , Coords263_g207098 , WorldPosition263_g207098 , WorldNormal263_g207098 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch327_g207086 = localSampleExtra275_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch327_g207086 = localSamplePlanar2D238_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch327_g207086 = localSamplePlanar3D246_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch327_g207086 = localSampleStochastic2D234_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch327_g207086 = localSampleStochastic3D263_g207098;
				#else
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#endif
				half4 Local_AlphaTex330_g207086 = staticSwitch327_g207086;
				float4 break59_g207111 = Local_AlphaTex330_g207086;
				float ifLocalVar58_g207111 = 0;
				if( temp_output_17_0_g207111 == 0.0 )
				ifLocalVar58_g207111 = break59_g207111.x;
				float ifLocalVar60_g207111 = 0;
				if( temp_output_17_0_g207111 == 1.0 )
				ifLocalVar60_g207111 = break59_g207111.y;
				float ifLocalVar61_g207111 = 0;
				if( temp_output_17_0_g207111 == 2.0 )
				ifLocalVar61_g207111 = break59_g207111.z;
				float ifLocalVar62_g207111 = 0;
				if( temp_output_17_0_g207111 == 3.0 )
				ifLocalVar62_g207111 = break59_g207111.w;
				float3 temp_cast_4 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 temp_cast_5 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 linearToGamma402_g207086 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult385_g207086 = lerp( (Local_AlbedoTex185_g207086).w , (linearToGamma402_g207086).x , _MainAlphaSourceMode);
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch236_g207086 = ( lerpResult385_g207086 - _MainAlphaClipValue );
				#else
				float staticSwitch236_g207086 = lerpResult385_g207086;
				#endif
				half Local_AlphaClip111_g207086 = staticSwitch236_g207086;
				float In_AlphaClip3_g207090 = Local_AlphaClip111_g207086;
				half Local_AlphaFade246_g207086 = (lerpResult62_g207086).a;
				float In_AlphaFade3_g207090 = Local_AlphaFade246_g207086;
				float3 temp_cast_6 = (1.0).xxx;
				float3 In_Translucency3_g207090 = temp_cast_6;
				float In_Transmission3_g207090 = 1.0;
				float In_Thickness3_g207090 = 0.0;
				float In_Diffusion3_g207090 = 0.0;
				float In_Depth3_g207090 = 0.0;
				{
				Data3_g207090.Dummy = In_Dummy3_g207090;
				Data3_g207090.Albedo = In_Albedo3_g207090;
				Data3_g207090.AlbedoRaw = In_AlbedoRaw3_g207090;
				Data3_g207090.NormalTS = In_NormalTS3_g207090;
				Data3_g207090.NormalWS = In_NormalWS3_g207090;
				Data3_g207090.Shader = In_Shader3_g207090;
				Data3_g207090.Emissive= In_Emissive3_g207090;
				Data3_g207090.MultiMask = In_MultiMask3_g207090;
				Data3_g207090.Grayscale = In_Grayscale3_g207090;
				Data3_g207090.Luminosity = In_Luminosity3_g207090;
				Data3_g207090.AlphaClip = In_AlphaClip3_g207090;
				Data3_g207090.AlphaFade = In_AlphaFade3_g207090;
				Data3_g207090.Translucency = In_Translucency3_g207090;
				Data3_g207090.Transmission = In_Transmission3_g207090;
				Data3_g207090.Thickness = In_Thickness3_g207090;
				Data3_g207090.Diffusion = In_Diffusion3_g207090;
				Data3_g207090.Depth = In_Depth3_g207090;
				}
				TVEVisualData Data4_g207126 = Data3_g207090;
				float Out_Dummy4_g207126 = 0;
				float3 Out_Albedo4_g207126 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g207126 = float3( 0,0,0 );
				float2 Out_NormalTS4_g207126 = float2( 0,0 );
				float3 Out_NormalWS4_g207126 = float3( 0,0,0 );
				float4 Out_Shader4_g207126 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g207126 = float4( 0,0,0,0 );
				float Out_MultiMask4_g207126 = 0;
				float Out_Grayscale4_g207126 = 0;
				float Out_Luminosity4_g207126 = 0;
				float Out_AlphaClip4_g207126 = 0;
				float Out_AlphaFade4_g207126 = 0;
				float3 Out_Translucency4_g207126 = float3( 0,0,0 );
				float Out_Transmission4_g207126 = 0;
				float Out_Thickness4_g207126 = 0;
				float Out_Diffusion4_g207126 = 0;
				float Out_Depth4_g207126 = 0;
				{
				Out_Dummy4_g207126 = Data4_g207126.Dummy;
				Out_Albedo4_g207126 = Data4_g207126.Albedo;
				Out_AlbedoRaw4_g207126 = Data4_g207126.AlbedoRaw;
				Out_NormalTS4_g207126 = Data4_g207126.NormalTS;
				Out_NormalWS4_g207126 = Data4_g207126.NormalWS;
				Out_Shader4_g207126 = Data4_g207126.Shader;
				Out_Emissive4_g207126= Data4_g207126.Emissive;
				Out_MultiMask4_g207126 = Data4_g207126.MultiMask;
				Out_Grayscale4_g207126 = Data4_g207126.Grayscale;
				Out_Luminosity4_g207126= Data4_g207126.Luminosity;
				Out_AlphaClip4_g207126 = Data4_g207126.AlphaClip;
				Out_AlphaFade4_g207126 = Data4_g207126.AlphaFade;
				Out_Translucency4_g207126 = Data4_g207126.Translucency;
				Out_Transmission4_g207126 = Data4_g207126.Transmission;
				Out_Thickness4_g207126 = Data4_g207126.Thickness;
				Out_Diffusion4_g207126 = Data4_g207126.Diffusion;
				Out_Depth4_g207126= Data4_g207126.Depth;
				}
				half3 Input_Albedo24_g207125 = Out_Albedo4_g207126;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g207125 = half4( 0.2209163, 0.2209163, 0.2209163, 0.7790837 );
				#else
				float4 staticSwitch22_g207125 = half4( 0.04, 0.04, 0.04, 0.96 );
				#endif
				half4 ColorSpaceDielectricSpec23_g207125 = staticSwitch22_g207125;
				float4 break24_g207121 = Out_Shader4_g207126;
				half Metallic95_g207121 = break24_g207121.x;
				half Input_Metallic25_g207125 = Metallic95_g207121;
				half OneMinusReflectivity31_g207125 = ( (ColorSpaceDielectricSpec23_g207125).w - ( (ColorSpaceDielectricSpec23_g207125).w * Input_Metallic25_g207125 ) );
				
				float3 appendResult23_g207121 = (float3(Out_NormalTS4_g207126 , 1.0));
				float3 temp_output_13_0_g207124 = appendResult23_g207121;
				float3 temp_output_33_0_g207124 = ( temp_output_13_0_g207124 * _render_normal );
				float3 switchResult12_g207124 = (((IsFrontFace>0)?(temp_output_13_0_g207124):(temp_output_33_0_g207124)));
				
				float3 lerpResult28_g207125 = lerp( (ColorSpaceDielectricSpec23_g207125).xyz , Input_Albedo24_g207125 , Input_Metallic25_g207125);
				half RenderSpec102_g207121 = _RenderSpecular;
				
				float localCustomAlphaClip21_g207131 = ( 0.0 );
				float temp_output_3_0_g207131 = Out_AlphaClip4_g207126;
				float Alpha21_g207131 = temp_output_3_0_g207131;
				float temp_output_15_0_g207131 = 0.0;
				float Treshold21_g207131 = temp_output_15_0_g207131;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_CUTOUT) || defined (TVE_GLANCING) || defined (TVE_DITHER)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha21_g207131 - Treshold21_g207131);
				#endif
				#endif
				}
				

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;

				surfaceDescription.BaseColor = ( Input_Albedo24_g207125 * OneMinusReflectivity31_g207125 );
				surfaceDescription.Normal = switchResult12_g207124;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = ( lerpResult28_g207125 * RenderSpec102_g207121 );
				#endif

				surfaceDescription.Smoothness = break24_g207121.w;
				surfaceDescription.Occlusion = break24_g207121.y;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = saturate( ( Alpha21_g207131 * Out_AlphaFade4_g207126 ) );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = input.positionSS.z;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#define ASE_FRAGMENT_NORMAL 0
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 170004
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma shader_feature _ EDITOR_VISUALIZATION
			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

            #define SHADERPASS SHADERPASS_LIGHT_TRANSPORT
            #define SCENEPICKINGPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _MainOcclusionRemap;
			half4 _MainCoordValue;
			half4 _Color;
			half4 _MainColor;
			half4 _MainMultiRemap;
			half4 _main_coord_value;
			half4 _MainSmoothnessRemap;
			half4 _MainColorTwo;
			half3 _render_normal;
			half _MainMetallicChannelMode;
			half _MainAlbedoValue;
			half _MainSmoothnessInfo;
			half _MainMultiMaskInfo;
			half _MainCoordMode;
			half _MainSampleMode;
			half _MainMetallicSourceMode;
			half _MainMetallicValue;
			half _MainOcclusionSourceMode;
			half _MainEnd;
			half _MainOcclusionValue;
			half _MainSmoothnessChannelMode;
			half _MainSmoothnessSourceMode;
			half _MainSmoothnessValue;
			half _MainMultiChannelMode;
			half _MainMultiSourceMode;
			half _MainColorMode;
			half _MainNormalValue;
			half _MainAlphaChannelMode;
			half _MainAlphaSourceMode;
			half _MainAlphaClipValue;
			half _MainOcclusionChannelMode;
			half _render_src;
			half _MainCategory;
			half _RenderClip;
			half _render_cull;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			half _IsGeneralShader;
			half _RenderZWrite;
			half _IsVersion;
			half _RenderCategory;
			half _RenderEnd;
			half _RenderMode;
			half _RenderCull;
			half _RenderNormal;
			half _RenderBakeGI;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMotion;
			half _Cutoff;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderFilter;
			half _RenderShadow;
			half _IsStandardShader;
			half _RenderSpecular;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_Linear_Repeat);
			SAMPLER(sampler_Linear_Repeat_Aniso8);
			SAMPLER(sampler_Point_Repeat);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MainShaderTex);
			TEXTURE2D(_MainMetallicTex);
			TEXTURE2D(_MainOcclusionTex);
			TEXTURE2D(_MainSmoothnessTex);
			TEXTURE2D(_MainMultiTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_MainAlphaTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#if SHADERPASS == SHADERPASS_LIGHT_TRANSPORT
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local_fragment TVE_FILTER_DEFAULT TVE_FILTER_POINT TVE_FILTER_LOW TVE_FILTER_MEDIUM TVE_FILTER_HIGH
			#pragma shader_feature_local_fragment TVE_MAIN_SAMPLE_MAIN_UV TVE_MAIN_SAMPLE_EXTRA_UV TVE_MAIN_SAMPLE_PLANAR_2D TVE_MAIN_SAMPLE_PLANAR_3D TVE_MAIN_SAMPLE_STOCHASTIC_2D TVE_MAIN_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_vertex TVE_PIVOT_OFF TVE_PIVOT_BAKED TVE_PIVOT_PROC
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			#define TVE_GEOMETRY_SHADER
			//#pragma editor_sync_compilation
			#ifndef ASE_NEEDS_TEXTURE_COORDINATES2 //Needed for ASE 1.9.8.1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			void ComputeWorldCoords( half4 Coords, half3 WorldPosition, out half2 ZX, out half2 ZY, out half2 XY )
			{
				ZX = WorldPosition.xz * Coords.xx - Coords.zz;
				ZY = WorldPosition.yz * Coords.yx - Coords.wz; 
				XY = WorldPosition.xy * Coords.xy - Coords.zw;
			}
			
			half4 SampleMain( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SampleExtra( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			half4 SamplePlanar2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			void ComputeTriplanarWeights( half3 WorldNormal, out half T1, out half T2, out half T3 )
			{
				half3 powNormal = abs( WorldNormal.xyz );
				half3 weights = max( powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal, 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				T1 = weights.y;
				T2 = weights.x;
				T3 = weights.z;
			}
			
			half4 SamplePlanar3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				half4 tex1 = SAMPLE_TEXTURE2D( Texture, Sampler, ZX);
				half4 tex2 = SAMPLE_TEXTURE2D( Texture, Sampler, ZY);
				half4 tex3 = SAMPLE_TEXTURE2D( Texture, Sampler, XY);
				return tex1 * T1 + tex2 * T2 + tex3 * T3;
			}
			
			void ComputeStochasticCoords( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				half2 vertex1, vertex2, vertex3;
				// Scaling of the input
				half2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				half2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				half3 temp = half3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float4 SampleStochastic2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				ComputeStochasticCoords(UV, UV1, UV2, UV3, W1, W2, W3 );
				half4 tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(UV), ddy(UV));
				half4 tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(UV), ddy(UV));
				half4 tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(UV), ddy(UV));
				return tex1 * W1 + tex2 * W2 + tex3 * W3;
			}
			
			half4 SampleStochastic3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				half4 tex1, tex2, tex3;
				ComputeStochasticCoords(ZX, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZX), ddy(ZX));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZX), ddy(ZX));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZX), ddy(ZX));
				half4 texZX = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(ZY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZY), ddy(ZY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZY), ddy(ZY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZY), ddy(ZY));
				half4 texZY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(XY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(XY), ddy(XY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(XY), ddy(XY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(XY), ddy(XY));
				half4 texXY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				return texZX * T1 + texZY * T2 + texXY * T3;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

                #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

                #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                #endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

				#ifdef DECAL_NORMAL_BLENDING
					#ifndef SURFACE_GRADIENT
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
					#if !defined(SHADER_STAGE_RAY_TRACING)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						#ifdef FRAG_INPUTS_USE_TEXCOORD0
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
						#else
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
						#endif
						surfaceData.metallic = 0;
					}
					#endif
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS output;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);

				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float3 vertexToFrag73_g205214 = ase_positionWS;
				output.ase_texcoord3.xyz = vertexToFrag73_g205214;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205224 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205224 = ( localObjectPosition_UNITY_MATRIX_M14_g205224 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205224 = localObjectPosition_UNITY_MATRIX_M14_g205224;
				#endif
				float3 temp_output_340_7_g205214 = staticSwitch13_g205224;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205226 = ObjectPosition_UNITY_MATRIX_M();
				float3 _Vector0 = float3(0,0,0);
				float3 appendResult60_g205222 = (float3(inputMesh.uv3.x , inputMesh.uv3.z , inputMesh.uv3.y));
				half3 PositionOS131_g205214 = inputMesh.positionOS;
				float3 break233_g205214 = PositionOS131_g205214;
				float3 appendResult234_g205214 = (float3(break233_g205214.x , 0.0 , break233_g205214.z));
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch229_g205214 = _Vector0;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch229_g205214 = appendResult60_g205222;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch229_g205214 = appendResult234_g205214;
				#else
				float3 staticSwitch229_g205214 = _Vector0;
				#endif
				half3 PivotOS149_g205214 = staticSwitch229_g205214;
				float3 temp_output_122_0_g205226 = PivotOS149_g205214;
				float3 PivotsOnlyWS105_g205226 = mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g205226 , 0.0 ) ).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205226 = ( ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205226 = ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 );
				#endif
				float3 temp_output_341_7_g205214 = staticSwitch13_g205226;
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#else
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#endif
				float3 vertexToFrag76_g205214 = staticSwitch236_g205214;
				output.ase_texcoord4.xyz = vertexToFrag76_g205214;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				output.ase_texcoord5.xyz = ase_normalWS;
				float3 ase_tangentWS = TransformObjectToWorldDir( inputMesh.tangentOS.xyz );
				output.ase_texcoord6.xyz = ase_tangentWS;
				float ase_tangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord7.xyz = ase_bitangentWS;
				
				output.ase_texcoord2.xy = inputMesh.uv0.xy;
				output.ase_texcoord2.zw = inputMesh.uv2.xy;
				output.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;
				output.ase_texcoord6.w = 0;
				output.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				output.positionCS = UnityMetaVertexPosition(inputMesh.positionOS, inputMesh.uv1.xy, inputMesh.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);

				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);

					output.VizUV.xy = vizUV;
					output.LightCoord = lightCoord;
				#endif

				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half isFrontFace = input.isFrontFace;

				float3 V = float3(1.0, 1.0, 1.0);

				float localBreakData4_g207126 = ( 0.0 );
				float localCompData3_g207090 = ( 0.0 );
				TVEVisualData Data3_g207090 = (TVEVisualData)0;
				half4 Dummy130_g207086 = ( _MainCategory + _MainEnd + ( _MainSampleMode + _MainCoordMode + _MainCoordValue ) + _MainMultiMaskInfo + _MainSmoothnessInfo );
				float In_Dummy3_g207090 = Dummy130_g207086.x;
				TEXTURE2D(Texture276_g207087) = _MainAlbedoTex;
				float localFilterTexture19_g207095 = ( 0.0 );
				SamplerState SS19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207095 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207095 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207095 = SamplerDefault19_g207095;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207095 = SamplerDefault19_g207095;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207095 = SamplerPoint19_g207095;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207095 = SamplerLow19_g207095;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207095 = SamplerMedium19_g207095;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207095 = SamplerHigh19_g207095;
				#endif
				}
				SamplerState Sampler276_g207087 = SS19_g207095;
				half4 Local_Coords180_g207086 = _main_coord_value;
				float4 temp_output_37_0_g207087 = Local_Coords180_g207086;
				half4 Coords276_g207087 = temp_output_37_0_g207087;
				half2 TexCoord276_g207087 = packedInput.ase_texcoord2.xy;
				half4 localSampleMain276_g207087 = SampleMain( Texture276_g207087 , Sampler276_g207087 , Coords276_g207087 , TexCoord276_g207087 );
				TEXTURE2D(Texture275_g207087) = _MainAlbedoTex;
				SamplerState Sampler275_g207087 = SS19_g207095;
				half4 Coords275_g207087 = temp_output_37_0_g207087;
				half2 TexCoord275_g207087 = packedInput.ase_texcoord2.zw;
				half4 localSampleExtra275_g207087 = SampleExtra( Texture275_g207087 , Sampler275_g207087 , Coords275_g207087 , TexCoord275_g207087 );
				TEXTURE2D(Texture238_g207087) = _MainAlbedoTex;
				SamplerState Sampler238_g207087 = SS19_g207095;
				half4 Coords238_g207087 = temp_output_37_0_g207087;
				TVEModelData Data16_g205219 = (TVEModelData)0;
				float In_Dummy16_g205219 = 0.0;
				float3 vertexToFrag73_g205214 = packedInput.ase_texcoord3.xyz;
				half3 PositionWS122_g205214 = vertexToFrag73_g205214;
				float3 In_PositionWS16_g205219 = PositionWS122_g205214;
				float3 vertexToFrag76_g205214 = packedInput.ase_texcoord4.xyz;
				half3 PivotWS121_g205214 = vertexToFrag76_g205214;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g205214 = ( PositionWS122_g205214 - PivotWS121_g205214 );
				#else
				float3 staticSwitch204_g205214 = PositionWS122_g205214;
				#endif
				half3 PositionWO132_g205214 = ( staticSwitch204_g205214 - TVE_WorldOrigin );
				float3 In_PositionWO16_g205219 = PositionWO132_g205214;
				float3 In_PivotWS16_g205219 = PivotWS121_g205214;
				half3 PivotWO133_g205214 = ( PivotWS121_g205214 - TVE_WorldOrigin );
				float3 In_PivotWO16_g205219 = PivotWO133_g205214;
				float3 ase_normalWS = packedInput.ase_texcoord5.xyz;
				float3 normalizedWorldNormal = normalize( ase_normalWS );
				half3 Normal_WS95_g205214 = normalizedWorldNormal;
				float3 In_NormalWS16_g205219 = Normal_WS95_g205214;
				float3 normalizeResult296_g205214 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g205214 ) );
				half3 ViewDirWS169_g205214 = normalizeResult296_g205214;
				float3 In_ViewDirWS16_g205219 = ViewDirWS169_g205214;
				half4 VertexMasks171_g205214 = packedInput.ase_color;
				float4 In_VertexData16_g205219 = VertexMasks171_g205214;
				float4 In_BoundsData16_g205219 = float4( 1,1,1,1 );
				{
				Data16_g205219.Dummy = In_Dummy16_g205219;
				Data16_g205219.PositionWS = In_PositionWS16_g205219;
				Data16_g205219.PositionWO = In_PositionWO16_g205219;
				Data16_g205219.PivotWS = In_PivotWS16_g205219;
				Data16_g205219.PivotWO = In_PivotWO16_g205219;
				Data16_g205219.NormalWS = In_NormalWS16_g205219;
				Data16_g205219.ViewDirWS = In_ViewDirWS16_g205219;
				Data16_g205219.VertexData = In_VertexData16_g205219;
				Data16_g205219.BoundsData = In_BoundsData16_g205219;
				}
				TVEModelData Data15_g207089 = Data16_g205219;
				float Out_Dummy15_g207089 = 0;
				float3 Out_PositionWS15_g207089 = float3( 0,0,0 );
				float3 Out_PositionWO15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWS15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWO15_g207089 = float3( 0,0,0 );
				float3 Out_NormalWS15_g207089 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g207089 = float3( 0,0,0 );
				float4 Out_VertexData15_g207089 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g207089 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g207089 = Data15_g207089.Dummy;
				Out_PositionWS15_g207089 = Data15_g207089.PositionWS;
				Out_PositionWO15_g207089 = Data15_g207089.PositionWO;
				Out_PivotWS15_g207089 = Data15_g207089.PivotWS;
				Out_PivotWO15_g207089 = Data15_g207089.PivotWO;
				Out_NormalWS15_g207089 = Data15_g207089.NormalWS;
				Out_ViewDirWS15_g207089 = Data15_g207089.ViewDirWS;
				Out_VertexData15_g207089 = Data15_g207089.VertexData;
				Out_BoundsData15_g207089 = Data15_g207089.BoundsData;
				}
				half3 Model_PositionWO222_g207086 = Out_PositionWO15_g207089;
				float3 temp_output_279_0_g207087 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207087 = temp_output_279_0_g207087;
				half4 localSamplePlanar2D238_g207087 = SamplePlanar2D( Texture238_g207087 , Sampler238_g207087 , Coords238_g207087 , WorldPosition238_g207087 );
				TEXTURE2D(Texture246_g207087) = _MainAlbedoTex;
				SamplerState Sampler246_g207087 = SS19_g207095;
				half4 Coords246_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition246_g207087 = temp_output_279_0_g207087;
				half3 Model_NormalWS226_g207086 = Out_NormalWS15_g207089;
				float3 temp_output_280_0_g207087 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207087 = temp_output_280_0_g207087;
				half4 localSamplePlanar3D246_g207087 = SamplePlanar3D( Texture246_g207087 , Sampler246_g207087 , Coords246_g207087 , WorldPosition246_g207087 , WorldNormal246_g207087 );
				TEXTURE2D(Texture234_g207087) = _MainAlbedoTex;
				SamplerState Sampler234_g207087 = SS19_g207095;
				float4 Coords234_g207087 = temp_output_37_0_g207087;
				float3 WorldPosition234_g207087 = temp_output_279_0_g207087;
				float4 localSampleStochastic2D234_g207087 = SampleStochastic2D( Texture234_g207087 , Sampler234_g207087 , Coords234_g207087 , WorldPosition234_g207087 );
				TEXTURE2D(Texture263_g207087) = _MainAlbedoTex;
				SamplerState Sampler263_g207087 = SS19_g207095;
				half4 Coords263_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition263_g207087 = temp_output_279_0_g207087;
				half3 WorldNormal263_g207087 = temp_output_280_0_g207087;
				half4 localSampleStochastic3D263_g207087 = SampleStochastic3D( Texture263_g207087 , Sampler263_g207087 , Coords263_g207087 , WorldPosition263_g207087 , WorldNormal263_g207087 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch184_g207086 = localSampleExtra275_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch184_g207086 = localSamplePlanar2D238_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch184_g207086 = localSamplePlanar3D246_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch184_g207086 = localSampleStochastic2D234_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch184_g207086 = localSampleStochastic3D263_g207087;
				#else
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#endif
				half4 Local_AlbedoTex185_g207086 = staticSwitch184_g207086;
				float3 lerpResult53_g207086 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex185_g207086).xyz , _MainAlbedoValue);
				half3 Local_AlbedoRGB107_g207086 = lerpResult53_g207086;
				TEXTURE2D(Texture276_g207096) = _MainShaderTex;
				float localFilterTexture30_g207097 = ( 0.0 );
				SamplerState SS30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207097 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207097 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207097 = SamplerDefault30_g207097;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207097 = SamplerDefault30_g207097;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207097 = SamplerPoint30_g207097;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207097 = SamplerLow30_g207097;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207097 = SamplerMedium30_g207097;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207097 = SamplerHigh30_g207097;
				#endif
				}
				SamplerState Sampler276_g207096 = SS30_g207097;
				float4 temp_output_37_0_g207096 = Local_Coords180_g207086;
				half4 Coords276_g207096 = temp_output_37_0_g207096;
				half2 TexCoord276_g207096 = packedInput.ase_texcoord2.xy;
				half4 localSampleMain276_g207096 = SampleMain( Texture276_g207096 , Sampler276_g207096 , Coords276_g207096 , TexCoord276_g207096 );
				TEXTURE2D(Texture275_g207096) = _MainShaderTex;
				SamplerState Sampler275_g207096 = SS30_g207097;
				half4 Coords275_g207096 = temp_output_37_0_g207096;
				half2 TexCoord275_g207096 = packedInput.ase_texcoord2.zw;
				half4 localSampleExtra275_g207096 = SampleExtra( Texture275_g207096 , Sampler275_g207096 , Coords275_g207096 , TexCoord275_g207096 );
				TEXTURE2D(Texture238_g207096) = _MainShaderTex;
				SamplerState Sampler238_g207096 = SS30_g207097;
				half4 Coords238_g207096 = temp_output_37_0_g207096;
				float3 temp_output_279_0_g207096 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207096 = temp_output_279_0_g207096;
				half4 localSamplePlanar2D238_g207096 = SamplePlanar2D( Texture238_g207096 , Sampler238_g207096 , Coords238_g207096 , WorldPosition238_g207096 );
				TEXTURE2D(Texture246_g207096) = _MainShaderTex;
				SamplerState Sampler246_g207096 = SS30_g207097;
				half4 Coords246_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition246_g207096 = temp_output_279_0_g207096;
				float3 temp_output_280_0_g207096 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207096 = temp_output_280_0_g207096;
				half4 localSamplePlanar3D246_g207096 = SamplePlanar3D( Texture246_g207096 , Sampler246_g207096 , Coords246_g207096 , WorldPosition246_g207096 , WorldNormal246_g207096 );
				TEXTURE2D(Texture234_g207096) = _MainShaderTex;
				SamplerState Sampler234_g207096 = SS30_g207097;
				float4 Coords234_g207096 = temp_output_37_0_g207096;
				float3 WorldPosition234_g207096 = temp_output_279_0_g207096;
				float4 localSampleStochastic2D234_g207096 = SampleStochastic2D( Texture234_g207096 , Sampler234_g207096 , Coords234_g207096 , WorldPosition234_g207096 );
				TEXTURE2D(Texture263_g207096) = _MainShaderTex;
				SamplerState Sampler263_g207096 = SS30_g207097;
				half4 Coords263_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition263_g207096 = temp_output_279_0_g207096;
				half3 WorldNormal263_g207096 = temp_output_280_0_g207096;
				half4 localSampleStochastic3D263_g207096 = SampleStochastic3D( Texture263_g207096 , Sampler263_g207096 , Coords263_g207096 , WorldPosition263_g207096 , WorldNormal263_g207096 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch198_g207086 = localSampleExtra275_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch198_g207086 = localSamplePlanar2D238_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch198_g207086 = localSamplePlanar3D246_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch198_g207086 = localSampleStochastic2D234_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch198_g207086 = localSampleStochastic3D263_g207096;
				#else
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#endif
				half4 Local_ShaderTex199_g207086 = staticSwitch198_g207086;
				float temp_output_17_0_g207112 = _MainMetallicChannelMode;
				TEXTURE2D(Texture276_g207100) = _MainMetallicTex;
				float localFilterTexture30_g207101 = ( 0.0 );
				SamplerState SS30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207101 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207101 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207101 = SamplerDefault30_g207101;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207101 = SamplerDefault30_g207101;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207101 = SamplerPoint30_g207101;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207101 = SamplerLow30_g207101;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207101 = SamplerMedium30_g207101;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207101 = SamplerHigh30_g207101;
				#endif
				}
				SamplerState Sampler276_g207100 = SS30_g207101;
				float4 temp_output_37_0_g207100 = Local_Coords180_g207086;
				half4 Coords276_g207100 = temp_output_37_0_g207100;
				half2 TexCoord276_g207100 = packedInput.ase_texcoord2.xy;
				half4 localSampleMain276_g207100 = SampleMain( Texture276_g207100 , Sampler276_g207100 , Coords276_g207100 , TexCoord276_g207100 );
				TEXTURE2D(Texture275_g207100) = _MainMetallicTex;
				SamplerState Sampler275_g207100 = SS30_g207101;
				half4 Coords275_g207100 = temp_output_37_0_g207100;
				half2 TexCoord275_g207100 = packedInput.ase_texcoord2.zw;
				half4 localSampleExtra275_g207100 = SampleExtra( Texture275_g207100 , Sampler275_g207100 , Coords275_g207100 , TexCoord275_g207100 );
				TEXTURE2D(Texture238_g207100) = _MainMetallicTex;
				SamplerState Sampler238_g207100 = SS30_g207101;
				half4 Coords238_g207100 = temp_output_37_0_g207100;
				float3 temp_output_279_0_g207100 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207100 = temp_output_279_0_g207100;
				half4 localSamplePlanar2D238_g207100 = SamplePlanar2D( Texture238_g207100 , Sampler238_g207100 , Coords238_g207100 , WorldPosition238_g207100 );
				TEXTURE2D(Texture246_g207100) = _MainMetallicTex;
				SamplerState Sampler246_g207100 = SS30_g207101;
				half4 Coords246_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition246_g207100 = temp_output_279_0_g207100;
				float3 temp_output_280_0_g207100 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207100 = temp_output_280_0_g207100;
				half4 localSamplePlanar3D246_g207100 = SamplePlanar3D( Texture246_g207100 , Sampler246_g207100 , Coords246_g207100 , WorldPosition246_g207100 , WorldNormal246_g207100 );
				TEXTURE2D(Texture234_g207100) = _MainMetallicTex;
				SamplerState Sampler234_g207100 = SS30_g207101;
				float4 Coords234_g207100 = temp_output_37_0_g207100;
				float3 WorldPosition234_g207100 = temp_output_279_0_g207100;
				float4 localSampleStochastic2D234_g207100 = SampleStochastic2D( Texture234_g207100 , Sampler234_g207100 , Coords234_g207100 , WorldPosition234_g207100 );
				TEXTURE2D(Texture263_g207100) = _MainMetallicTex;
				SamplerState Sampler263_g207100 = SS30_g207101;
				half4 Coords263_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition263_g207100 = temp_output_279_0_g207100;
				half3 WorldNormal263_g207100 = temp_output_280_0_g207100;
				half4 localSampleStochastic3D263_g207100 = SampleStochastic3D( Texture263_g207100 , Sampler263_g207100 , Coords263_g207100 , WorldPosition263_g207100 , WorldNormal263_g207100 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch335_g207086 = localSampleExtra275_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch335_g207086 = localSamplePlanar2D238_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch335_g207086 = localSamplePlanar3D246_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch335_g207086 = localSampleStochastic2D234_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch335_g207086 = localSampleStochastic3D263_g207100;
				#else
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#endif
				half4 Local_MetallicTex341_g207086 = staticSwitch335_g207086;
				float4 break59_g207112 = Local_MetallicTex341_g207086;
				float ifLocalVar58_g207112 = 0;
				if( temp_output_17_0_g207112 == 0.0 )
				ifLocalVar58_g207112 = break59_g207112.x;
				float ifLocalVar60_g207112 = 0;
				if( temp_output_17_0_g207112 == 1.0 )
				ifLocalVar60_g207112 = break59_g207112.y;
				float ifLocalVar61_g207112 = 0;
				if( temp_output_17_0_g207112 == 2.0 )
				ifLocalVar61_g207112 = break59_g207112.z;
				float ifLocalVar62_g207112 = 0;
				if( temp_output_17_0_g207112 == 3.0 )
				ifLocalVar62_g207112 = break59_g207112.w;
				float lerpResult366_g207086 = lerp( (Local_ShaderTex199_g207086).x , ( ifLocalVar58_g207112 + ifLocalVar60_g207112 + ifLocalVar61_g207112 + ifLocalVar62_g207112 ) , _MainMetallicSourceMode);
				half Local_Metallic322_g207086 = ( lerpResult366_g207086 * _MainMetallicValue );
				float temp_output_17_0_g207113 = _MainOcclusionChannelMode;
				TEXTURE2D(Texture276_g207102) = _MainOcclusionTex;
				float localFilterTexture30_g207108 = ( 0.0 );
				SamplerState SS30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207108 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207108 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207108 = SamplerDefault30_g207108;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207108 = SamplerDefault30_g207108;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207108 = SamplerPoint30_g207108;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207108 = SamplerLow30_g207108;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207108 = SamplerMedium30_g207108;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207108 = SamplerHigh30_g207108;
				#endif
				}
				SamplerState Sampler276_g207102 = SS30_g207108;
				float4 temp_output_37_0_g207102 = Local_Coords180_g207086;
				half4 Coords276_g207102 = temp_output_37_0_g207102;
				half2 TexCoord276_g207102 = packedInput.ase_texcoord2.xy;
				half4 localSampleMain276_g207102 = SampleMain( Texture276_g207102 , Sampler276_g207102 , Coords276_g207102 , TexCoord276_g207102 );
				TEXTURE2D(Texture275_g207102) = _MainOcclusionTex;
				SamplerState Sampler275_g207102 = SS30_g207108;
				half4 Coords275_g207102 = temp_output_37_0_g207102;
				half2 TexCoord275_g207102 = packedInput.ase_texcoord2.zw;
				half4 localSampleExtra275_g207102 = SampleExtra( Texture275_g207102 , Sampler275_g207102 , Coords275_g207102 , TexCoord275_g207102 );
				TEXTURE2D(Texture238_g207102) = _MainOcclusionTex;
				SamplerState Sampler238_g207102 = SS30_g207108;
				half4 Coords238_g207102 = temp_output_37_0_g207102;
				float3 temp_output_279_0_g207102 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207102 = temp_output_279_0_g207102;
				half4 localSamplePlanar2D238_g207102 = SamplePlanar2D( Texture238_g207102 , Sampler238_g207102 , Coords238_g207102 , WorldPosition238_g207102 );
				TEXTURE2D(Texture246_g207102) = _MainOcclusionTex;
				SamplerState Sampler246_g207102 = SS30_g207108;
				half4 Coords246_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition246_g207102 = temp_output_279_0_g207102;
				float3 temp_output_280_0_g207102 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207102 = temp_output_280_0_g207102;
				half4 localSamplePlanar3D246_g207102 = SamplePlanar3D( Texture246_g207102 , Sampler246_g207102 , Coords246_g207102 , WorldPosition246_g207102 , WorldNormal246_g207102 );
				TEXTURE2D(Texture234_g207102) = _MainOcclusionTex;
				SamplerState Sampler234_g207102 = SS30_g207108;
				float4 Coords234_g207102 = temp_output_37_0_g207102;
				float3 WorldPosition234_g207102 = temp_output_279_0_g207102;
				float4 localSampleStochastic2D234_g207102 = SampleStochastic2D( Texture234_g207102 , Sampler234_g207102 , Coords234_g207102 , WorldPosition234_g207102 );
				TEXTURE2D(Texture263_g207102) = _MainOcclusionTex;
				SamplerState Sampler263_g207102 = SS30_g207108;
				half4 Coords263_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition263_g207102 = temp_output_279_0_g207102;
				half3 WorldNormal263_g207102 = temp_output_280_0_g207102;
				half4 localSampleStochastic3D263_g207102 = SampleStochastic3D( Texture263_g207102 , Sampler263_g207102 , Coords263_g207102 , WorldPosition263_g207102 , WorldNormal263_g207102 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch343_g207086 = localSampleExtra275_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch343_g207086 = localSamplePlanar2D238_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch343_g207086 = localSamplePlanar3D246_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch343_g207086 = localSampleStochastic2D234_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch343_g207086 = localSampleStochastic3D263_g207102;
				#else
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#endif
				half4 Local_OcclusionTex349_g207086 = staticSwitch343_g207086;
				float4 break59_g207113 = Local_OcclusionTex349_g207086;
				float ifLocalVar58_g207113 = 0;
				if( temp_output_17_0_g207113 == 0.0 )
				ifLocalVar58_g207113 = break59_g207113.x;
				float ifLocalVar60_g207113 = 0;
				if( temp_output_17_0_g207113 == 1.0 )
				ifLocalVar60_g207113 = break59_g207113.y;
				float ifLocalVar61_g207113 = 0;
				if( temp_output_17_0_g207113 == 2.0 )
				ifLocalVar61_g207113 = break59_g207113.z;
				float ifLocalVar62_g207113 = 0;
				if( temp_output_17_0_g207113 == 3.0 )
				ifLocalVar62_g207113 = break59_g207113.w;
				float lerpResult373_g207086 = lerp( (Local_ShaderTex199_g207086).y , ( ifLocalVar58_g207113 + ifLocalVar60_g207113 + ifLocalVar61_g207113 + ifLocalVar62_g207113 ) , _MainOcclusionSourceMode);
				float clampResult17_g207110 = clamp( lerpResult373_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207109 = _MainOcclusionRemap.x;
				float temp_output_9_0_g207109 = ( clampResult17_g207110 - temp_output_7_0_g207109 );
				float lerpResult23_g207086 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g207109 * _MainOcclusionRemap.z ) + 0.0001 ) ) , _MainOcclusionValue);
				half Local_Occlusion313_g207086 = lerpResult23_g207086;
				float temp_output_17_0_g207115 = _MainSmoothnessChannelMode;
				TEXTURE2D(Texture276_g207105) = _MainSmoothnessTex;
				float localFilterTexture30_g207106 = ( 0.0 );
				SamplerState SS30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207106 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207106 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207106 = SamplerDefault30_g207106;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207106 = SamplerDefault30_g207106;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207106 = SamplerPoint30_g207106;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207106 = SamplerLow30_g207106;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207106 = SamplerMedium30_g207106;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207106 = SamplerHigh30_g207106;
				#endif
				}
				SamplerState Sampler276_g207105 = SS30_g207106;
				float4 temp_output_37_0_g207105 = Local_Coords180_g207086;
				half4 Coords276_g207105 = temp_output_37_0_g207105;
				half2 TexCoord276_g207105 = packedInput.ase_texcoord2.xy;
				half4 localSampleMain276_g207105 = SampleMain( Texture276_g207105 , Sampler276_g207105 , Coords276_g207105 , TexCoord276_g207105 );
				TEXTURE2D(Texture275_g207105) = _MainSmoothnessTex;
				SamplerState Sampler275_g207105 = SS30_g207106;
				half4 Coords275_g207105 = temp_output_37_0_g207105;
				half2 TexCoord275_g207105 = packedInput.ase_texcoord2.zw;
				half4 localSampleExtra275_g207105 = SampleExtra( Texture275_g207105 , Sampler275_g207105 , Coords275_g207105 , TexCoord275_g207105 );
				TEXTURE2D(Texture238_g207105) = _MainSmoothnessTex;
				SamplerState Sampler238_g207105 = SS30_g207106;
				half4 Coords238_g207105 = temp_output_37_0_g207105;
				float3 temp_output_279_0_g207105 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207105 = temp_output_279_0_g207105;
				half4 localSamplePlanar2D238_g207105 = SamplePlanar2D( Texture238_g207105 , Sampler238_g207105 , Coords238_g207105 , WorldPosition238_g207105 );
				TEXTURE2D(Texture246_g207105) = _MainSmoothnessTex;
				SamplerState Sampler246_g207105 = SS30_g207106;
				half4 Coords246_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition246_g207105 = temp_output_279_0_g207105;
				float3 temp_output_280_0_g207105 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207105 = temp_output_280_0_g207105;
				half4 localSamplePlanar3D246_g207105 = SamplePlanar3D( Texture246_g207105 , Sampler246_g207105 , Coords246_g207105 , WorldPosition246_g207105 , WorldNormal246_g207105 );
				TEXTURE2D(Texture234_g207105) = _MainSmoothnessTex;
				SamplerState Sampler234_g207105 = SS30_g207106;
				float4 Coords234_g207105 = temp_output_37_0_g207105;
				float3 WorldPosition234_g207105 = temp_output_279_0_g207105;
				float4 localSampleStochastic2D234_g207105 = SampleStochastic2D( Texture234_g207105 , Sampler234_g207105 , Coords234_g207105 , WorldPosition234_g207105 );
				TEXTURE2D(Texture263_g207105) = _MainSmoothnessTex;
				SamplerState Sampler263_g207105 = SS30_g207106;
				half4 Coords263_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition263_g207105 = temp_output_279_0_g207105;
				half3 WorldNormal263_g207105 = temp_output_280_0_g207105;
				half4 localSampleStochastic3D263_g207105 = SampleStochastic3D( Texture263_g207105 , Sampler263_g207105 , Coords263_g207105 , WorldPosition263_g207105 , WorldNormal263_g207105 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch359_g207086 = localSampleExtra275_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch359_g207086 = localSamplePlanar2D238_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch359_g207086 = localSamplePlanar3D246_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch359_g207086 = localSampleStochastic2D234_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch359_g207086 = localSampleStochastic3D263_g207105;
				#else
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#endif
				half4 Local_SmoothnessTex365_g207086 = staticSwitch359_g207086;
				float4 break59_g207115 = Local_SmoothnessTex365_g207086;
				float ifLocalVar58_g207115 = 0;
				if( temp_output_17_0_g207115 == 0.0 )
				ifLocalVar58_g207115 = break59_g207115.x;
				float ifLocalVar60_g207115 = 0;
				if( temp_output_17_0_g207115 == 1.0 )
				ifLocalVar60_g207115 = break59_g207115.y;
				float ifLocalVar61_g207115 = 0;
				if( temp_output_17_0_g207115 == 2.0 )
				ifLocalVar61_g207115 = break59_g207115.z;
				float ifLocalVar62_g207115 = 0;
				if( temp_output_17_0_g207115 == 3.0 )
				ifLocalVar62_g207115 = break59_g207115.w;
				float3 temp_cast_2 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 temp_cast_3 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 linearToGamma404_g207086 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult374_g207086 = lerp( (Local_ShaderTex199_g207086).w , (linearToGamma404_g207086).x , _MainSmoothnessSourceMode);
				float clampResult17_g207119 = clamp( lerpResult374_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207118 = _MainSmoothnessRemap.x;
				float temp_output_9_0_g207118 = ( clampResult17_g207119 - temp_output_7_0_g207118 );
				half Local_Smoothness317_g207086 = ( saturate( ( ( temp_output_9_0_g207118 * _MainSmoothnessRemap.z ) + 0.0001 ) ) * _MainSmoothnessValue );
				float4 appendResult73_g207086 = (float4(Local_Metallic322_g207086 , Local_Occlusion313_g207086 , 0.0 , Local_Smoothness317_g207086));
				half4 Local_Masks109_g207086 = appendResult73_g207086;
				float temp_output_17_0_g207114 = _MainMultiChannelMode;
				TEXTURE2D(Texture276_g207103) = _MainMultiTex;
				float localFilterTexture30_g207104 = ( 0.0 );
				SamplerState SS30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207104 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207104 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207104 = SamplerDefault30_g207104;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207104 = SamplerDefault30_g207104;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207104 = SamplerPoint30_g207104;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207104 = SamplerLow30_g207104;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207104 = SamplerMedium30_g207104;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207104 = SamplerHigh30_g207104;
				#endif
				}
				SamplerState Sampler276_g207103 = SS30_g207104;
				float4 temp_output_37_0_g207103 = Local_Coords180_g207086;
				half4 Coords276_g207103 = temp_output_37_0_g207103;
				half2 TexCoord276_g207103 = packedInput.ase_texcoord2.xy;
				half4 localSampleMain276_g207103 = SampleMain( Texture276_g207103 , Sampler276_g207103 , Coords276_g207103 , TexCoord276_g207103 );
				TEXTURE2D(Texture275_g207103) = _MainMultiTex;
				SamplerState Sampler275_g207103 = SS30_g207104;
				half4 Coords275_g207103 = temp_output_37_0_g207103;
				half2 TexCoord275_g207103 = packedInput.ase_texcoord2.zw;
				half4 localSampleExtra275_g207103 = SampleExtra( Texture275_g207103 , Sampler275_g207103 , Coords275_g207103 , TexCoord275_g207103 );
				TEXTURE2D(Texture238_g207103) = _MainMultiTex;
				SamplerState Sampler238_g207103 = SS30_g207104;
				half4 Coords238_g207103 = temp_output_37_0_g207103;
				float3 temp_output_279_0_g207103 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207103 = temp_output_279_0_g207103;
				half4 localSamplePlanar2D238_g207103 = SamplePlanar2D( Texture238_g207103 , Sampler238_g207103 , Coords238_g207103 , WorldPosition238_g207103 );
				TEXTURE2D(Texture246_g207103) = _MainMultiTex;
				SamplerState Sampler246_g207103 = SS30_g207104;
				half4 Coords246_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition246_g207103 = temp_output_279_0_g207103;
				float3 temp_output_280_0_g207103 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207103 = temp_output_280_0_g207103;
				half4 localSamplePlanar3D246_g207103 = SamplePlanar3D( Texture246_g207103 , Sampler246_g207103 , Coords246_g207103 , WorldPosition246_g207103 , WorldNormal246_g207103 );
				TEXTURE2D(Texture234_g207103) = _MainMultiTex;
				SamplerState Sampler234_g207103 = SS30_g207104;
				float4 Coords234_g207103 = temp_output_37_0_g207103;
				float3 WorldPosition234_g207103 = temp_output_279_0_g207103;
				float4 localSampleStochastic2D234_g207103 = SampleStochastic2D( Texture234_g207103 , Sampler234_g207103 , Coords234_g207103 , WorldPosition234_g207103 );
				TEXTURE2D(Texture263_g207103) = _MainMultiTex;
				SamplerState Sampler263_g207103 = SS30_g207104;
				half4 Coords263_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition263_g207103 = temp_output_279_0_g207103;
				half3 WorldNormal263_g207103 = temp_output_280_0_g207103;
				half4 localSampleStochastic3D263_g207103 = SampleStochastic3D( Texture263_g207103 , Sampler263_g207103 , Coords263_g207103 , WorldPosition263_g207103 , WorldNormal263_g207103 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch351_g207086 = localSampleExtra275_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch351_g207086 = localSamplePlanar2D238_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch351_g207086 = localSamplePlanar3D246_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch351_g207086 = localSampleStochastic2D234_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch351_g207086 = localSampleStochastic3D263_g207103;
				#else
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#endif
				half4 Local_MultiTex357_g207086 = staticSwitch351_g207086;
				float4 break59_g207114 = Local_MultiTex357_g207086;
				float ifLocalVar58_g207114 = 0;
				if( temp_output_17_0_g207114 == 0.0 )
				ifLocalVar58_g207114 = break59_g207114.x;
				float ifLocalVar60_g207114 = 0;
				if( temp_output_17_0_g207114 == 1.0 )
				ifLocalVar60_g207114 = break59_g207114.y;
				float ifLocalVar61_g207114 = 0;
				if( temp_output_17_0_g207114 == 2.0 )
				ifLocalVar61_g207114 = break59_g207114.z;
				float ifLocalVar62_g207114 = 0;
				if( temp_output_17_0_g207114 == 3.0 )
				ifLocalVar62_g207114 = break59_g207114.w;
				float lerpResult378_g207086 = lerp( (Local_Masks109_g207086).z , ( ifLocalVar58_g207114 + ifLocalVar60_g207114 + ifLocalVar61_g207114 + ifLocalVar62_g207114 ) , _MainMultiSourceMode);
				float clampResult17_g207116 = clamp( lerpResult378_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207117 = _MainMultiRemap.x;
				float temp_output_9_0_g207117 = ( clampResult17_g207116 - temp_output_7_0_g207117 );
				half Local_MultiMask78_g207086 = saturate( ( ( temp_output_9_0_g207117 * _MainMultiRemap.z ) + 0.0001 ) );
				float lerpResult58_g207086 = lerp( 1.0 , Local_MultiMask78_g207086 , _MainColorMode);
				float4 lerpResult62_g207086 = lerp( _MainColorTwo , _MainColor , lerpResult58_g207086);
				half3 Local_ColorRGB93_g207086 = (lerpResult62_g207086).rgb;
				half3 Local_Albedo139_g207086 = ( Local_AlbedoRGB107_g207086 * Local_ColorRGB93_g207086 );
				float3 In_Albedo3_g207090 = Local_Albedo139_g207086;
				float3 In_AlbedoRaw3_g207090 = Local_Albedo139_g207086;
				TEXTURE2D(Texture276_g207088) = _MainNormalTex;
				float localFilterTexture29_g207094 = ( 0.0 );
				SamplerState SS29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g207094 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g207094 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g207094 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g207094 = SamplerDefault29_g207094;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g207094 = SamplerDefault29_g207094;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g207094 = SamplerPoint29_g207094;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g207094 = SamplerLow29_g207094;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g207094 = SamplerMedium29_g207094;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g207094 = SamplerHigh29_g207094;
				#endif
				}
				SamplerState Sampler276_g207088 = SS29_g207094;
				float4 temp_output_37_0_g207088 = Local_Coords180_g207086;
				half4 Coords276_g207088 = temp_output_37_0_g207088;
				half2 TexCoord276_g207088 = packedInput.ase_texcoord2.xy;
				half4 localSampleMain276_g207088 = SampleMain( Texture276_g207088 , Sampler276_g207088 , Coords276_g207088 , TexCoord276_g207088 );
				TEXTURE2D(Texture275_g207088) = _MainNormalTex;
				SamplerState Sampler275_g207088 = SS29_g207094;
				half4 Coords275_g207088 = temp_output_37_0_g207088;
				half2 TexCoord275_g207088 = packedInput.ase_texcoord2.zw;
				half4 localSampleExtra275_g207088 = SampleExtra( Texture275_g207088 , Sampler275_g207088 , Coords275_g207088 , TexCoord275_g207088 );
				TEXTURE2D(Texture238_g207088) = _MainNormalTex;
				SamplerState Sampler238_g207088 = SS29_g207094;
				half4 Coords238_g207088 = temp_output_37_0_g207088;
				float3 temp_output_279_0_g207088 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207088 = temp_output_279_0_g207088;
				half4 localSamplePlanar2D238_g207088 = SamplePlanar2D( Texture238_g207088 , Sampler238_g207088 , Coords238_g207088 , WorldPosition238_g207088 );
				TEXTURE2D(Texture246_g207088) = _MainNormalTex;
				SamplerState Sampler246_g207088 = SS29_g207094;
				half4 Coords246_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition246_g207088 = temp_output_279_0_g207088;
				float3 temp_output_280_0_g207088 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207088 = temp_output_280_0_g207088;
				half4 localSamplePlanar3D246_g207088 = SamplePlanar3D( Texture246_g207088 , Sampler246_g207088 , Coords246_g207088 , WorldPosition246_g207088 , WorldNormal246_g207088 );
				TEXTURE2D(Texture234_g207088) = _MainNormalTex;
				SamplerState Sampler234_g207088 = SS29_g207094;
				float4 Coords234_g207088 = temp_output_37_0_g207088;
				float3 WorldPosition234_g207088 = temp_output_279_0_g207088;
				float4 localSampleStochastic2D234_g207088 = SampleStochastic2D( Texture234_g207088 , Sampler234_g207088 , Coords234_g207088 , WorldPosition234_g207088 );
				TEXTURE2D(Texture263_g207088) = _MainNormalTex;
				SamplerState Sampler263_g207088 = SS29_g207094;
				half4 Coords263_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition263_g207088 = temp_output_279_0_g207088;
				half3 WorldNormal263_g207088 = temp_output_280_0_g207088;
				half4 localSampleStochastic3D263_g207088 = SampleStochastic3D( Texture263_g207088 , Sampler263_g207088 , Coords263_g207088 , WorldPosition263_g207088 , WorldNormal263_g207088 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch193_g207086 = localSampleExtra275_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch193_g207086 = localSamplePlanar2D238_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch193_g207086 = localSamplePlanar3D246_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch193_g207086 = localSampleStochastic2D234_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch193_g207086 = localSampleStochastic3D263_g207088;
				#else
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#endif
				half4 Local_NormaTex191_g207086 = staticSwitch193_g207086;
				half4 Normal_Packed45_g207091 = Local_NormaTex191_g207086;
				float2 appendResult58_g207091 = (float2(( (Normal_Packed45_g207091).x * (Normal_Packed45_g207091).w ) , (Normal_Packed45_g207091).y));
				half2 Normal_Default50_g207091 = appendResult58_g207091;
				half2 Normal_ASTC41_g207091 = (Normal_Packed45_g207091).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g207091 = Normal_ASTC41_g207091;
				#else
				float2 staticSwitch38_g207091 = Normal_Default50_g207091;
				#endif
				half2 Normal_NO_DTX544_g207091 = (Normal_Packed45_g207091).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g207091 = Normal_NO_DTX544_g207091;
				#else
				float2 staticSwitch37_g207091 = staticSwitch38_g207091;
				#endif
				float2 temp_output_26_0_g207086 = ( (staticSwitch37_g207091*2.0 + -1.0) * _MainNormalValue );
				float3 ase_tangentWS = packedInput.ase_texcoord6.xyz;
				float3 ase_bitangentWS = packedInput.ase_texcoord7.xyz;
				float3x3 ase_worldToTangent = float3x3( ase_tangentWS, ase_bitangentWS, ase_normalWS );
				half2 Normal_Planar45_g207092 = temp_output_26_0_g207086;
				float2 break71_g207092 = Normal_Planar45_g207092;
				float3 appendResult72_g207092 = (float3(break71_g207092.x , 0.0 , break71_g207092.y));
				float2 temp_output_205_0_g207086 = (mul( ase_worldToTangent, appendResult72_g207092 )).xy;
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#else
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#endif
				half2 Local_NormalTS108_g207086 = staticSwitch204_g207086;
				float2 In_NormalTS3_g207090 = Local_NormalTS108_g207086;
				float3 appendResult68_g207093 = (float3(Local_NormalTS108_g207086 , 1.0));
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 tanNormal74_g207093 = appendResult68_g207093;
				float3 worldNormal74_g207093 = normalize( float3( dot( tanToWorld0, tanNormal74_g207093 ), dot( tanToWorld1, tanNormal74_g207093 ), dot( tanToWorld2, tanNormal74_g207093 ) ) );
				half3 Local_NormalWS250_g207086 = worldNormal74_g207093;
				float3 In_NormalWS3_g207090 = Local_NormalWS250_g207086;
				float4 In_Shader3_g207090 = Local_Masks109_g207086;
				float4 In_Emissive3_g207090 = half4( 1, 1, 1, 1 );
				float3 temp_output_3_0_g207107 = Local_Albedo139_g207086;
				float dotResult20_g207107 = dot( temp_output_3_0_g207107 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale110_g207086 = dotResult20_g207107;
				float In_Grayscale3_g207090 = Local_Grayscale110_g207086;
				float clampResult144_g207086 = clamp( saturate( ( Local_Grayscale110_g207086 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity145_g207086 = clampResult144_g207086;
				float In_Luminosity3_g207090 = Local_Luminosity145_g207086;
				float In_MultiMask3_g207090 = Local_MultiMask78_g207086;
				float temp_output_17_0_g207111 = _MainAlphaChannelMode;
				TEXTURE2D(Texture276_g207098) = _MainAlphaTex;
				float localFilterTexture19_g207099 = ( 0.0 );
				SamplerState SS19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207099 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207099 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207099 = SamplerDefault19_g207099;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207099 = SamplerDefault19_g207099;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207099 = SamplerPoint19_g207099;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207099 = SamplerLow19_g207099;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207099 = SamplerMedium19_g207099;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207099 = SamplerHigh19_g207099;
				#endif
				}
				SamplerState Sampler276_g207098 = SS19_g207099;
				float4 temp_output_37_0_g207098 = Local_Coords180_g207086;
				half4 Coords276_g207098 = temp_output_37_0_g207098;
				half2 TexCoord276_g207098 = packedInput.ase_texcoord2.xy;
				half4 localSampleMain276_g207098 = SampleMain( Texture276_g207098 , Sampler276_g207098 , Coords276_g207098 , TexCoord276_g207098 );
				TEXTURE2D(Texture275_g207098) = _MainAlphaTex;
				SamplerState Sampler275_g207098 = SS19_g207099;
				half4 Coords275_g207098 = temp_output_37_0_g207098;
				half2 TexCoord275_g207098 = packedInput.ase_texcoord2.zw;
				half4 localSampleExtra275_g207098 = SampleExtra( Texture275_g207098 , Sampler275_g207098 , Coords275_g207098 , TexCoord275_g207098 );
				TEXTURE2D(Texture238_g207098) = _MainAlphaTex;
				SamplerState Sampler238_g207098 = SS19_g207099;
				half4 Coords238_g207098 = temp_output_37_0_g207098;
				float3 temp_output_279_0_g207098 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207098 = temp_output_279_0_g207098;
				half4 localSamplePlanar2D238_g207098 = SamplePlanar2D( Texture238_g207098 , Sampler238_g207098 , Coords238_g207098 , WorldPosition238_g207098 );
				TEXTURE2D(Texture246_g207098) = _MainAlphaTex;
				SamplerState Sampler246_g207098 = SS19_g207099;
				half4 Coords246_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition246_g207098 = temp_output_279_0_g207098;
				float3 temp_output_280_0_g207098 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207098 = temp_output_280_0_g207098;
				half4 localSamplePlanar3D246_g207098 = SamplePlanar3D( Texture246_g207098 , Sampler246_g207098 , Coords246_g207098 , WorldPosition246_g207098 , WorldNormal246_g207098 );
				TEXTURE2D(Texture234_g207098) = _MainAlphaTex;
				SamplerState Sampler234_g207098 = SS19_g207099;
				float4 Coords234_g207098 = temp_output_37_0_g207098;
				float3 WorldPosition234_g207098 = temp_output_279_0_g207098;
				float4 localSampleStochastic2D234_g207098 = SampleStochastic2D( Texture234_g207098 , Sampler234_g207098 , Coords234_g207098 , WorldPosition234_g207098 );
				TEXTURE2D(Texture263_g207098) = _MainAlphaTex;
				SamplerState Sampler263_g207098 = SS19_g207099;
				half4 Coords263_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition263_g207098 = temp_output_279_0_g207098;
				half3 WorldNormal263_g207098 = temp_output_280_0_g207098;
				half4 localSampleStochastic3D263_g207098 = SampleStochastic3D( Texture263_g207098 , Sampler263_g207098 , Coords263_g207098 , WorldPosition263_g207098 , WorldNormal263_g207098 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch327_g207086 = localSampleExtra275_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch327_g207086 = localSamplePlanar2D238_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch327_g207086 = localSamplePlanar3D246_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch327_g207086 = localSampleStochastic2D234_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch327_g207086 = localSampleStochastic3D263_g207098;
				#else
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#endif
				half4 Local_AlphaTex330_g207086 = staticSwitch327_g207086;
				float4 break59_g207111 = Local_AlphaTex330_g207086;
				float ifLocalVar58_g207111 = 0;
				if( temp_output_17_0_g207111 == 0.0 )
				ifLocalVar58_g207111 = break59_g207111.x;
				float ifLocalVar60_g207111 = 0;
				if( temp_output_17_0_g207111 == 1.0 )
				ifLocalVar60_g207111 = break59_g207111.y;
				float ifLocalVar61_g207111 = 0;
				if( temp_output_17_0_g207111 == 2.0 )
				ifLocalVar61_g207111 = break59_g207111.z;
				float ifLocalVar62_g207111 = 0;
				if( temp_output_17_0_g207111 == 3.0 )
				ifLocalVar62_g207111 = break59_g207111.w;
				float3 temp_cast_4 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 temp_cast_5 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 linearToGamma402_g207086 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult385_g207086 = lerp( (Local_AlbedoTex185_g207086).w , (linearToGamma402_g207086).x , _MainAlphaSourceMode);
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch236_g207086 = ( lerpResult385_g207086 - _MainAlphaClipValue );
				#else
				float staticSwitch236_g207086 = lerpResult385_g207086;
				#endif
				half Local_AlphaClip111_g207086 = staticSwitch236_g207086;
				float In_AlphaClip3_g207090 = Local_AlphaClip111_g207086;
				half Local_AlphaFade246_g207086 = (lerpResult62_g207086).a;
				float In_AlphaFade3_g207090 = Local_AlphaFade246_g207086;
				float3 temp_cast_6 = (1.0).xxx;
				float3 In_Translucency3_g207090 = temp_cast_6;
				float In_Transmission3_g207090 = 1.0;
				float In_Thickness3_g207090 = 0.0;
				float In_Diffusion3_g207090 = 0.0;
				float In_Depth3_g207090 = 0.0;
				{
				Data3_g207090.Dummy = In_Dummy3_g207090;
				Data3_g207090.Albedo = In_Albedo3_g207090;
				Data3_g207090.AlbedoRaw = In_AlbedoRaw3_g207090;
				Data3_g207090.NormalTS = In_NormalTS3_g207090;
				Data3_g207090.NormalWS = In_NormalWS3_g207090;
				Data3_g207090.Shader = In_Shader3_g207090;
				Data3_g207090.Emissive= In_Emissive3_g207090;
				Data3_g207090.MultiMask = In_MultiMask3_g207090;
				Data3_g207090.Grayscale = In_Grayscale3_g207090;
				Data3_g207090.Luminosity = In_Luminosity3_g207090;
				Data3_g207090.AlphaClip = In_AlphaClip3_g207090;
				Data3_g207090.AlphaFade = In_AlphaFade3_g207090;
				Data3_g207090.Translucency = In_Translucency3_g207090;
				Data3_g207090.Transmission = In_Transmission3_g207090;
				Data3_g207090.Thickness = In_Thickness3_g207090;
				Data3_g207090.Diffusion = In_Diffusion3_g207090;
				Data3_g207090.Depth = In_Depth3_g207090;
				}
				TVEVisualData Data4_g207126 = Data3_g207090;
				float Out_Dummy4_g207126 = 0;
				float3 Out_Albedo4_g207126 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g207126 = float3( 0,0,0 );
				float2 Out_NormalTS4_g207126 = float2( 0,0 );
				float3 Out_NormalWS4_g207126 = float3( 0,0,0 );
				float4 Out_Shader4_g207126 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g207126 = float4( 0,0,0,0 );
				float Out_MultiMask4_g207126 = 0;
				float Out_Grayscale4_g207126 = 0;
				float Out_Luminosity4_g207126 = 0;
				float Out_AlphaClip4_g207126 = 0;
				float Out_AlphaFade4_g207126 = 0;
				float3 Out_Translucency4_g207126 = float3( 0,0,0 );
				float Out_Transmission4_g207126 = 0;
				float Out_Thickness4_g207126 = 0;
				float Out_Diffusion4_g207126 = 0;
				float Out_Depth4_g207126 = 0;
				{
				Out_Dummy4_g207126 = Data4_g207126.Dummy;
				Out_Albedo4_g207126 = Data4_g207126.Albedo;
				Out_AlbedoRaw4_g207126 = Data4_g207126.AlbedoRaw;
				Out_NormalTS4_g207126 = Data4_g207126.NormalTS;
				Out_NormalWS4_g207126 = Data4_g207126.NormalWS;
				Out_Shader4_g207126 = Data4_g207126.Shader;
				Out_Emissive4_g207126= Data4_g207126.Emissive;
				Out_MultiMask4_g207126 = Data4_g207126.MultiMask;
				Out_Grayscale4_g207126 = Data4_g207126.Grayscale;
				Out_Luminosity4_g207126= Data4_g207126.Luminosity;
				Out_AlphaClip4_g207126 = Data4_g207126.AlphaClip;
				Out_AlphaFade4_g207126 = Data4_g207126.AlphaFade;
				Out_Translucency4_g207126 = Data4_g207126.Translucency;
				Out_Transmission4_g207126 = Data4_g207126.Transmission;
				Out_Thickness4_g207126 = Data4_g207126.Thickness;
				Out_Diffusion4_g207126 = Data4_g207126.Diffusion;
				Out_Depth4_g207126= Data4_g207126.Depth;
				}
				half3 Input_Albedo24_g207125 = Out_Albedo4_g207126;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g207125 = half4( 0.2209163, 0.2209163, 0.2209163, 0.7790837 );
				#else
				float4 staticSwitch22_g207125 = half4( 0.04, 0.04, 0.04, 0.96 );
				#endif
				half4 ColorSpaceDielectricSpec23_g207125 = staticSwitch22_g207125;
				float4 break24_g207121 = Out_Shader4_g207126;
				half Metallic95_g207121 = break24_g207121.x;
				half Input_Metallic25_g207125 = Metallic95_g207121;
				half OneMinusReflectivity31_g207125 = ( (ColorSpaceDielectricSpec23_g207125).w - ( (ColorSpaceDielectricSpec23_g207125).w * Input_Metallic25_g207125 ) );
				
				float3 appendResult23_g207121 = (float3(Out_NormalTS4_g207126 , 1.0));
				float3 temp_output_13_0_g207124 = appendResult23_g207121;
				float3 temp_output_33_0_g207124 = ( temp_output_13_0_g207124 * _render_normal );
				float3 switchResult12_g207124 = (((isFrontFace>0)?(temp_output_13_0_g207124):(temp_output_33_0_g207124)));
				
				float3 lerpResult28_g207125 = lerp( (ColorSpaceDielectricSpec23_g207125).xyz , Input_Albedo24_g207125 , Input_Metallic25_g207125);
				half RenderSpec102_g207121 = _RenderSpecular;
				
				float localCustomAlphaClip21_g207131 = ( 0.0 );
				float temp_output_3_0_g207131 = Out_AlphaClip4_g207126;
				float Alpha21_g207131 = temp_output_3_0_g207131;
				float temp_output_15_0_g207131 = 0.0;
				float Treshold21_g207131 = temp_output_15_0_g207131;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_CUTOUT) || defined (TVE_GLANCING) || defined (TVE_DITHER)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha21_g207131 - Treshold21_g207131);
				#endif
				#endif
				}
				

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;

				surfaceDescription.BaseColor = ( Input_Albedo24_g207125 * OneMinusReflectivity31_g207125 );
				surfaceDescription.Normal = switchResult12_g207124;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = ( lerpResult28_g207125 * RenderSpec102_g207121 );
				#endif

				surfaceDescription.Smoothness = break24_g207121.w;
				surfaceDescription.Occlusion = break24_g207121.y;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = saturate( ( Alpha21_g207131 * Out_AlphaFade4_g207126 ) );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);
				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;

			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#define ASE_FRAGMENT_NORMAL 0
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 170004
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_SHADOWS

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _MainOcclusionRemap;
			half4 _MainCoordValue;
			half4 _Color;
			half4 _MainColor;
			half4 _MainMultiRemap;
			half4 _main_coord_value;
			half4 _MainSmoothnessRemap;
			half4 _MainColorTwo;
			half3 _render_normal;
			half _MainMetallicChannelMode;
			half _MainAlbedoValue;
			half _MainSmoothnessInfo;
			half _MainMultiMaskInfo;
			half _MainCoordMode;
			half _MainSampleMode;
			half _MainMetallicSourceMode;
			half _MainMetallicValue;
			half _MainOcclusionSourceMode;
			half _MainEnd;
			half _MainOcclusionValue;
			half _MainSmoothnessChannelMode;
			half _MainSmoothnessSourceMode;
			half _MainSmoothnessValue;
			half _MainMultiChannelMode;
			half _MainMultiSourceMode;
			half _MainColorMode;
			half _MainNormalValue;
			half _MainAlphaChannelMode;
			half _MainAlphaSourceMode;
			half _MainAlphaClipValue;
			half _MainOcclusionChannelMode;
			half _render_src;
			half _MainCategory;
			half _RenderClip;
			half _render_cull;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			half _IsGeneralShader;
			half _RenderZWrite;
			half _IsVersion;
			half _RenderCategory;
			half _RenderEnd;
			half _RenderMode;
			half _RenderCull;
			half _RenderNormal;
			half _RenderBakeGI;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMotion;
			half _Cutoff;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderFilter;
			half _RenderShadow;
			half _IsStandardShader;
			half _RenderSpecular;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_Linear_Repeat);
			SAMPLER(sampler_Linear_Repeat_Aniso8);
			SAMPLER(sampler_Point_Repeat);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MainShaderTex);
			TEXTURE2D(_MainMetallicTex);
			TEXTURE2D(_MainOcclusionTex);
			TEXTURE2D(_MainSmoothnessTex);
			TEXTURE2D(_MainMultiTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_MainAlphaTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local_fragment TVE_FILTER_DEFAULT TVE_FILTER_POINT TVE_FILTER_LOW TVE_FILTER_MEDIUM TVE_FILTER_HIGH
			#pragma shader_feature_local_fragment TVE_MAIN_SAMPLE_MAIN_UV TVE_MAIN_SAMPLE_EXTRA_UV TVE_MAIN_SAMPLE_PLANAR_2D TVE_MAIN_SAMPLE_PLANAR_3D TVE_MAIN_SAMPLE_STOCHASTIC_2D TVE_MAIN_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_vertex TVE_PIVOT_OFF TVE_PIVOT_BAKED TVE_PIVOT_PROC
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			#define TVE_GEOMETRY_SHADER
			//#pragma editor_sync_compilation
			#ifndef ASE_NEEDS_TEXTURE_COORDINATES2 //Needed for ASE 1.9.8.1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			void ComputeWorldCoords( half4 Coords, half3 WorldPosition, out half2 ZX, out half2 ZY, out half2 XY )
			{
				ZX = WorldPosition.xz * Coords.xx - Coords.zz;
				ZY = WorldPosition.yz * Coords.yx - Coords.wz; 
				XY = WorldPosition.xy * Coords.xy - Coords.zw;
			}
			
			half4 SampleMain( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SampleExtra( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			half4 SamplePlanar2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			void ComputeTriplanarWeights( half3 WorldNormal, out half T1, out half T2, out half T3 )
			{
				half3 powNormal = abs( WorldNormal.xyz );
				half3 weights = max( powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal, 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				T1 = weights.y;
				T2 = weights.x;
				T3 = weights.z;
			}
			
			half4 SamplePlanar3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				half4 tex1 = SAMPLE_TEXTURE2D( Texture, Sampler, ZX);
				half4 tex2 = SAMPLE_TEXTURE2D( Texture, Sampler, ZY);
				half4 tex3 = SAMPLE_TEXTURE2D( Texture, Sampler, XY);
				return tex1 * T1 + tex2 * T2 + tex3 * T3;
			}
			
			void ComputeStochasticCoords( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				half2 vertex1, vertex2, vertex3;
				// Scaling of the input
				half2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				half2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				half3 temp = half3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float4 SampleStochastic2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				ComputeStochasticCoords(UV, UV1, UV2, UV3, W1, W2, W3 );
				half4 tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(UV), ddy(UV));
				half4 tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(UV), ddy(UV));
				half4 tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(UV), ddy(UV));
				return tex1 * W1 + tex2 * W2 + tex3 * W3;
			}
			
			half4 SampleStochastic3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				half4 tex1, tex2, tex3;
				ComputeStochasticCoords(ZX, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZX), ddy(ZX));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZX), ddy(ZX));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZX), ddy(ZX));
				half4 texZX = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(ZY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZY), ddy(ZY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZY), ddy(ZY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZY), ddy(ZY));
				half4 texZY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(XY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(XY), ddy(XY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(XY), ddy(XY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(XY), ddy(XY));
				half4 texXY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				return texZX * T1 + texZY * T2 + texXY * T3;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				// refraction ShadowCaster
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                    #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = float3(0.0f, 0.0f, 1.0f);

				#ifdef DECAL_NORMAL_BLENDING
					#ifndef SURFACE_GRADIENT
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
					#if !defined(SHADER_STAGE_RAY_TRACING)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						#ifdef FRAG_INPUTS_USE_TEXCOORD0
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
						#else
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
						#endif
						surfaceData.metallic = 0;
					}
					#endif
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float3 vertexToFrag73_g205214 = ase_positionWS;
				output.ase_texcoord4.xyz = vertexToFrag73_g205214;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205224 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205224 = ( localObjectPosition_UNITY_MATRIX_M14_g205224 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205224 = localObjectPosition_UNITY_MATRIX_M14_g205224;
				#endif
				float3 temp_output_340_7_g205214 = staticSwitch13_g205224;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205226 = ObjectPosition_UNITY_MATRIX_M();
				float3 _Vector0 = float3(0,0,0);
				float3 appendResult60_g205222 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 PositionOS131_g205214 = inputMesh.positionOS;
				float3 break233_g205214 = PositionOS131_g205214;
				float3 appendResult234_g205214 = (float3(break233_g205214.x , 0.0 , break233_g205214.z));
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch229_g205214 = _Vector0;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch229_g205214 = appendResult60_g205222;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch229_g205214 = appendResult234_g205214;
				#else
				float3 staticSwitch229_g205214 = _Vector0;
				#endif
				half3 PivotOS149_g205214 = staticSwitch229_g205214;
				float3 temp_output_122_0_g205226 = PivotOS149_g205214;
				float3 PivotsOnlyWS105_g205226 = mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g205226 , 0.0 ) ).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205226 = ( ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205226 = ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 );
				#endif
				float3 temp_output_341_7_g205214 = staticSwitch13_g205226;
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#else
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#endif
				float3 vertexToFrag76_g205214 = staticSwitch236_g205214;
				output.ase_texcoord5.xyz = vertexToFrag76_g205214;
				
				output.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				output.ase_texcoord3.zw = inputMesh.ase_texcoord2.xy;
				output.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];
				float4 ClipPos = TransformWorldToHClip( PositionRWS );
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float localCustomAlphaClip21_g207131 = ( 0.0 );
				float localBreakData4_g207126 = ( 0.0 );
				float localCompData3_g207090 = ( 0.0 );
				TVEVisualData Data3_g207090 = (TVEVisualData)0;
				half4 Dummy130_g207086 = ( _MainCategory + _MainEnd + ( _MainSampleMode + _MainCoordMode + _MainCoordValue ) + _MainMultiMaskInfo + _MainSmoothnessInfo );
				float In_Dummy3_g207090 = Dummy130_g207086.x;
				TEXTURE2D(Texture276_g207087) = _MainAlbedoTex;
				float localFilterTexture19_g207095 = ( 0.0 );
				SamplerState SS19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207095 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207095 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207095 = SamplerDefault19_g207095;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207095 = SamplerDefault19_g207095;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207095 = SamplerPoint19_g207095;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207095 = SamplerLow19_g207095;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207095 = SamplerMedium19_g207095;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207095 = SamplerHigh19_g207095;
				#endif
				}
				SamplerState Sampler276_g207087 = SS19_g207095;
				half4 Local_Coords180_g207086 = _main_coord_value;
				float4 temp_output_37_0_g207087 = Local_Coords180_g207086;
				half4 Coords276_g207087 = temp_output_37_0_g207087;
				half2 TexCoord276_g207087 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207087 = SampleMain( Texture276_g207087 , Sampler276_g207087 , Coords276_g207087 , TexCoord276_g207087 );
				TEXTURE2D(Texture275_g207087) = _MainAlbedoTex;
				SamplerState Sampler275_g207087 = SS19_g207095;
				half4 Coords275_g207087 = temp_output_37_0_g207087;
				half2 TexCoord275_g207087 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207087 = SampleExtra( Texture275_g207087 , Sampler275_g207087 , Coords275_g207087 , TexCoord275_g207087 );
				TEXTURE2D(Texture238_g207087) = _MainAlbedoTex;
				SamplerState Sampler238_g207087 = SS19_g207095;
				half4 Coords238_g207087 = temp_output_37_0_g207087;
				TVEModelData Data16_g205219 = (TVEModelData)0;
				float In_Dummy16_g205219 = 0.0;
				float3 vertexToFrag73_g205214 = packedInput.ase_texcoord4.xyz;
				half3 PositionWS122_g205214 = vertexToFrag73_g205214;
				float3 In_PositionWS16_g205219 = PositionWS122_g205214;
				float3 vertexToFrag76_g205214 = packedInput.ase_texcoord5.xyz;
				half3 PivotWS121_g205214 = vertexToFrag76_g205214;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g205214 = ( PositionWS122_g205214 - PivotWS121_g205214 );
				#else
				float3 staticSwitch204_g205214 = PositionWS122_g205214;
				#endif
				half3 PositionWO132_g205214 = ( staticSwitch204_g205214 - TVE_WorldOrigin );
				float3 In_PositionWO16_g205219 = PositionWO132_g205214;
				float3 In_PivotWS16_g205219 = PivotWS121_g205214;
				half3 PivotWO133_g205214 = ( PivotWS121_g205214 - TVE_WorldOrigin );
				float3 In_PivotWO16_g205219 = PivotWO133_g205214;
				float3 normalizedWorldNormal = normalize( NormalWS );
				half3 Normal_WS95_g205214 = normalizedWorldNormal;
				float3 In_NormalWS16_g205219 = Normal_WS95_g205214;
				float3 normalizeResult296_g205214 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g205214 ) );
				half3 ViewDirWS169_g205214 = normalizeResult296_g205214;
				float3 In_ViewDirWS16_g205219 = ViewDirWS169_g205214;
				half4 VertexMasks171_g205214 = packedInput.ase_color;
				float4 In_VertexData16_g205219 = VertexMasks171_g205214;
				float4 In_BoundsData16_g205219 = float4( 1,1,1,1 );
				{
				Data16_g205219.Dummy = In_Dummy16_g205219;
				Data16_g205219.PositionWS = In_PositionWS16_g205219;
				Data16_g205219.PositionWO = In_PositionWO16_g205219;
				Data16_g205219.PivotWS = In_PivotWS16_g205219;
				Data16_g205219.PivotWO = In_PivotWO16_g205219;
				Data16_g205219.NormalWS = In_NormalWS16_g205219;
				Data16_g205219.ViewDirWS = In_ViewDirWS16_g205219;
				Data16_g205219.VertexData = In_VertexData16_g205219;
				Data16_g205219.BoundsData = In_BoundsData16_g205219;
				}
				TVEModelData Data15_g207089 = Data16_g205219;
				float Out_Dummy15_g207089 = 0;
				float3 Out_PositionWS15_g207089 = float3( 0,0,0 );
				float3 Out_PositionWO15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWS15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWO15_g207089 = float3( 0,0,0 );
				float3 Out_NormalWS15_g207089 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g207089 = float3( 0,0,0 );
				float4 Out_VertexData15_g207089 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g207089 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g207089 = Data15_g207089.Dummy;
				Out_PositionWS15_g207089 = Data15_g207089.PositionWS;
				Out_PositionWO15_g207089 = Data15_g207089.PositionWO;
				Out_PivotWS15_g207089 = Data15_g207089.PivotWS;
				Out_PivotWO15_g207089 = Data15_g207089.PivotWO;
				Out_NormalWS15_g207089 = Data15_g207089.NormalWS;
				Out_ViewDirWS15_g207089 = Data15_g207089.ViewDirWS;
				Out_VertexData15_g207089 = Data15_g207089.VertexData;
				Out_BoundsData15_g207089 = Data15_g207089.BoundsData;
				}
				half3 Model_PositionWO222_g207086 = Out_PositionWO15_g207089;
				float3 temp_output_279_0_g207087 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207087 = temp_output_279_0_g207087;
				half4 localSamplePlanar2D238_g207087 = SamplePlanar2D( Texture238_g207087 , Sampler238_g207087 , Coords238_g207087 , WorldPosition238_g207087 );
				TEXTURE2D(Texture246_g207087) = _MainAlbedoTex;
				SamplerState Sampler246_g207087 = SS19_g207095;
				half4 Coords246_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition246_g207087 = temp_output_279_0_g207087;
				half3 Model_NormalWS226_g207086 = Out_NormalWS15_g207089;
				float3 temp_output_280_0_g207087 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207087 = temp_output_280_0_g207087;
				half4 localSamplePlanar3D246_g207087 = SamplePlanar3D( Texture246_g207087 , Sampler246_g207087 , Coords246_g207087 , WorldPosition246_g207087 , WorldNormal246_g207087 );
				TEXTURE2D(Texture234_g207087) = _MainAlbedoTex;
				SamplerState Sampler234_g207087 = SS19_g207095;
				float4 Coords234_g207087 = temp_output_37_0_g207087;
				float3 WorldPosition234_g207087 = temp_output_279_0_g207087;
				float4 localSampleStochastic2D234_g207087 = SampleStochastic2D( Texture234_g207087 , Sampler234_g207087 , Coords234_g207087 , WorldPosition234_g207087 );
				TEXTURE2D(Texture263_g207087) = _MainAlbedoTex;
				SamplerState Sampler263_g207087 = SS19_g207095;
				half4 Coords263_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition263_g207087 = temp_output_279_0_g207087;
				half3 WorldNormal263_g207087 = temp_output_280_0_g207087;
				half4 localSampleStochastic3D263_g207087 = SampleStochastic3D( Texture263_g207087 , Sampler263_g207087 , Coords263_g207087 , WorldPosition263_g207087 , WorldNormal263_g207087 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch184_g207086 = localSampleExtra275_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch184_g207086 = localSamplePlanar2D238_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch184_g207086 = localSamplePlanar3D246_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch184_g207086 = localSampleStochastic2D234_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch184_g207086 = localSampleStochastic3D263_g207087;
				#else
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#endif
				half4 Local_AlbedoTex185_g207086 = staticSwitch184_g207086;
				float3 lerpResult53_g207086 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex185_g207086).xyz , _MainAlbedoValue);
				half3 Local_AlbedoRGB107_g207086 = lerpResult53_g207086;
				TEXTURE2D(Texture276_g207096) = _MainShaderTex;
				float localFilterTexture30_g207097 = ( 0.0 );
				SamplerState SS30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207097 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207097 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207097 = SamplerDefault30_g207097;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207097 = SamplerDefault30_g207097;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207097 = SamplerPoint30_g207097;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207097 = SamplerLow30_g207097;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207097 = SamplerMedium30_g207097;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207097 = SamplerHigh30_g207097;
				#endif
				}
				SamplerState Sampler276_g207096 = SS30_g207097;
				float4 temp_output_37_0_g207096 = Local_Coords180_g207086;
				half4 Coords276_g207096 = temp_output_37_0_g207096;
				half2 TexCoord276_g207096 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207096 = SampleMain( Texture276_g207096 , Sampler276_g207096 , Coords276_g207096 , TexCoord276_g207096 );
				TEXTURE2D(Texture275_g207096) = _MainShaderTex;
				SamplerState Sampler275_g207096 = SS30_g207097;
				half4 Coords275_g207096 = temp_output_37_0_g207096;
				half2 TexCoord275_g207096 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207096 = SampleExtra( Texture275_g207096 , Sampler275_g207096 , Coords275_g207096 , TexCoord275_g207096 );
				TEXTURE2D(Texture238_g207096) = _MainShaderTex;
				SamplerState Sampler238_g207096 = SS30_g207097;
				half4 Coords238_g207096 = temp_output_37_0_g207096;
				float3 temp_output_279_0_g207096 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207096 = temp_output_279_0_g207096;
				half4 localSamplePlanar2D238_g207096 = SamplePlanar2D( Texture238_g207096 , Sampler238_g207096 , Coords238_g207096 , WorldPosition238_g207096 );
				TEXTURE2D(Texture246_g207096) = _MainShaderTex;
				SamplerState Sampler246_g207096 = SS30_g207097;
				half4 Coords246_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition246_g207096 = temp_output_279_0_g207096;
				float3 temp_output_280_0_g207096 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207096 = temp_output_280_0_g207096;
				half4 localSamplePlanar3D246_g207096 = SamplePlanar3D( Texture246_g207096 , Sampler246_g207096 , Coords246_g207096 , WorldPosition246_g207096 , WorldNormal246_g207096 );
				TEXTURE2D(Texture234_g207096) = _MainShaderTex;
				SamplerState Sampler234_g207096 = SS30_g207097;
				float4 Coords234_g207096 = temp_output_37_0_g207096;
				float3 WorldPosition234_g207096 = temp_output_279_0_g207096;
				float4 localSampleStochastic2D234_g207096 = SampleStochastic2D( Texture234_g207096 , Sampler234_g207096 , Coords234_g207096 , WorldPosition234_g207096 );
				TEXTURE2D(Texture263_g207096) = _MainShaderTex;
				SamplerState Sampler263_g207096 = SS30_g207097;
				half4 Coords263_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition263_g207096 = temp_output_279_0_g207096;
				half3 WorldNormal263_g207096 = temp_output_280_0_g207096;
				half4 localSampleStochastic3D263_g207096 = SampleStochastic3D( Texture263_g207096 , Sampler263_g207096 , Coords263_g207096 , WorldPosition263_g207096 , WorldNormal263_g207096 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch198_g207086 = localSampleExtra275_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch198_g207086 = localSamplePlanar2D238_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch198_g207086 = localSamplePlanar3D246_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch198_g207086 = localSampleStochastic2D234_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch198_g207086 = localSampleStochastic3D263_g207096;
				#else
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#endif
				half4 Local_ShaderTex199_g207086 = staticSwitch198_g207086;
				float temp_output_17_0_g207112 = _MainMetallicChannelMode;
				TEXTURE2D(Texture276_g207100) = _MainMetallicTex;
				float localFilterTexture30_g207101 = ( 0.0 );
				SamplerState SS30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207101 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207101 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207101 = SamplerDefault30_g207101;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207101 = SamplerDefault30_g207101;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207101 = SamplerPoint30_g207101;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207101 = SamplerLow30_g207101;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207101 = SamplerMedium30_g207101;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207101 = SamplerHigh30_g207101;
				#endif
				}
				SamplerState Sampler276_g207100 = SS30_g207101;
				float4 temp_output_37_0_g207100 = Local_Coords180_g207086;
				half4 Coords276_g207100 = temp_output_37_0_g207100;
				half2 TexCoord276_g207100 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207100 = SampleMain( Texture276_g207100 , Sampler276_g207100 , Coords276_g207100 , TexCoord276_g207100 );
				TEXTURE2D(Texture275_g207100) = _MainMetallicTex;
				SamplerState Sampler275_g207100 = SS30_g207101;
				half4 Coords275_g207100 = temp_output_37_0_g207100;
				half2 TexCoord275_g207100 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207100 = SampleExtra( Texture275_g207100 , Sampler275_g207100 , Coords275_g207100 , TexCoord275_g207100 );
				TEXTURE2D(Texture238_g207100) = _MainMetallicTex;
				SamplerState Sampler238_g207100 = SS30_g207101;
				half4 Coords238_g207100 = temp_output_37_0_g207100;
				float3 temp_output_279_0_g207100 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207100 = temp_output_279_0_g207100;
				half4 localSamplePlanar2D238_g207100 = SamplePlanar2D( Texture238_g207100 , Sampler238_g207100 , Coords238_g207100 , WorldPosition238_g207100 );
				TEXTURE2D(Texture246_g207100) = _MainMetallicTex;
				SamplerState Sampler246_g207100 = SS30_g207101;
				half4 Coords246_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition246_g207100 = temp_output_279_0_g207100;
				float3 temp_output_280_0_g207100 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207100 = temp_output_280_0_g207100;
				half4 localSamplePlanar3D246_g207100 = SamplePlanar3D( Texture246_g207100 , Sampler246_g207100 , Coords246_g207100 , WorldPosition246_g207100 , WorldNormal246_g207100 );
				TEXTURE2D(Texture234_g207100) = _MainMetallicTex;
				SamplerState Sampler234_g207100 = SS30_g207101;
				float4 Coords234_g207100 = temp_output_37_0_g207100;
				float3 WorldPosition234_g207100 = temp_output_279_0_g207100;
				float4 localSampleStochastic2D234_g207100 = SampleStochastic2D( Texture234_g207100 , Sampler234_g207100 , Coords234_g207100 , WorldPosition234_g207100 );
				TEXTURE2D(Texture263_g207100) = _MainMetallicTex;
				SamplerState Sampler263_g207100 = SS30_g207101;
				half4 Coords263_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition263_g207100 = temp_output_279_0_g207100;
				half3 WorldNormal263_g207100 = temp_output_280_0_g207100;
				half4 localSampleStochastic3D263_g207100 = SampleStochastic3D( Texture263_g207100 , Sampler263_g207100 , Coords263_g207100 , WorldPosition263_g207100 , WorldNormal263_g207100 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch335_g207086 = localSampleExtra275_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch335_g207086 = localSamplePlanar2D238_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch335_g207086 = localSamplePlanar3D246_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch335_g207086 = localSampleStochastic2D234_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch335_g207086 = localSampleStochastic3D263_g207100;
				#else
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#endif
				half4 Local_MetallicTex341_g207086 = staticSwitch335_g207086;
				float4 break59_g207112 = Local_MetallicTex341_g207086;
				float ifLocalVar58_g207112 = 0;
				if( temp_output_17_0_g207112 == 0.0 )
				ifLocalVar58_g207112 = break59_g207112.x;
				float ifLocalVar60_g207112 = 0;
				if( temp_output_17_0_g207112 == 1.0 )
				ifLocalVar60_g207112 = break59_g207112.y;
				float ifLocalVar61_g207112 = 0;
				if( temp_output_17_0_g207112 == 2.0 )
				ifLocalVar61_g207112 = break59_g207112.z;
				float ifLocalVar62_g207112 = 0;
				if( temp_output_17_0_g207112 == 3.0 )
				ifLocalVar62_g207112 = break59_g207112.w;
				float lerpResult366_g207086 = lerp( (Local_ShaderTex199_g207086).x , ( ifLocalVar58_g207112 + ifLocalVar60_g207112 + ifLocalVar61_g207112 + ifLocalVar62_g207112 ) , _MainMetallicSourceMode);
				half Local_Metallic322_g207086 = ( lerpResult366_g207086 * _MainMetallicValue );
				float temp_output_17_0_g207113 = _MainOcclusionChannelMode;
				TEXTURE2D(Texture276_g207102) = _MainOcclusionTex;
				float localFilterTexture30_g207108 = ( 0.0 );
				SamplerState SS30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207108 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207108 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207108 = SamplerDefault30_g207108;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207108 = SamplerDefault30_g207108;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207108 = SamplerPoint30_g207108;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207108 = SamplerLow30_g207108;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207108 = SamplerMedium30_g207108;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207108 = SamplerHigh30_g207108;
				#endif
				}
				SamplerState Sampler276_g207102 = SS30_g207108;
				float4 temp_output_37_0_g207102 = Local_Coords180_g207086;
				half4 Coords276_g207102 = temp_output_37_0_g207102;
				half2 TexCoord276_g207102 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207102 = SampleMain( Texture276_g207102 , Sampler276_g207102 , Coords276_g207102 , TexCoord276_g207102 );
				TEXTURE2D(Texture275_g207102) = _MainOcclusionTex;
				SamplerState Sampler275_g207102 = SS30_g207108;
				half4 Coords275_g207102 = temp_output_37_0_g207102;
				half2 TexCoord275_g207102 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207102 = SampleExtra( Texture275_g207102 , Sampler275_g207102 , Coords275_g207102 , TexCoord275_g207102 );
				TEXTURE2D(Texture238_g207102) = _MainOcclusionTex;
				SamplerState Sampler238_g207102 = SS30_g207108;
				half4 Coords238_g207102 = temp_output_37_0_g207102;
				float3 temp_output_279_0_g207102 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207102 = temp_output_279_0_g207102;
				half4 localSamplePlanar2D238_g207102 = SamplePlanar2D( Texture238_g207102 , Sampler238_g207102 , Coords238_g207102 , WorldPosition238_g207102 );
				TEXTURE2D(Texture246_g207102) = _MainOcclusionTex;
				SamplerState Sampler246_g207102 = SS30_g207108;
				half4 Coords246_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition246_g207102 = temp_output_279_0_g207102;
				float3 temp_output_280_0_g207102 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207102 = temp_output_280_0_g207102;
				half4 localSamplePlanar3D246_g207102 = SamplePlanar3D( Texture246_g207102 , Sampler246_g207102 , Coords246_g207102 , WorldPosition246_g207102 , WorldNormal246_g207102 );
				TEXTURE2D(Texture234_g207102) = _MainOcclusionTex;
				SamplerState Sampler234_g207102 = SS30_g207108;
				float4 Coords234_g207102 = temp_output_37_0_g207102;
				float3 WorldPosition234_g207102 = temp_output_279_0_g207102;
				float4 localSampleStochastic2D234_g207102 = SampleStochastic2D( Texture234_g207102 , Sampler234_g207102 , Coords234_g207102 , WorldPosition234_g207102 );
				TEXTURE2D(Texture263_g207102) = _MainOcclusionTex;
				SamplerState Sampler263_g207102 = SS30_g207108;
				half4 Coords263_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition263_g207102 = temp_output_279_0_g207102;
				half3 WorldNormal263_g207102 = temp_output_280_0_g207102;
				half4 localSampleStochastic3D263_g207102 = SampleStochastic3D( Texture263_g207102 , Sampler263_g207102 , Coords263_g207102 , WorldPosition263_g207102 , WorldNormal263_g207102 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch343_g207086 = localSampleExtra275_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch343_g207086 = localSamplePlanar2D238_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch343_g207086 = localSamplePlanar3D246_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch343_g207086 = localSampleStochastic2D234_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch343_g207086 = localSampleStochastic3D263_g207102;
				#else
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#endif
				half4 Local_OcclusionTex349_g207086 = staticSwitch343_g207086;
				float4 break59_g207113 = Local_OcclusionTex349_g207086;
				float ifLocalVar58_g207113 = 0;
				if( temp_output_17_0_g207113 == 0.0 )
				ifLocalVar58_g207113 = break59_g207113.x;
				float ifLocalVar60_g207113 = 0;
				if( temp_output_17_0_g207113 == 1.0 )
				ifLocalVar60_g207113 = break59_g207113.y;
				float ifLocalVar61_g207113 = 0;
				if( temp_output_17_0_g207113 == 2.0 )
				ifLocalVar61_g207113 = break59_g207113.z;
				float ifLocalVar62_g207113 = 0;
				if( temp_output_17_0_g207113 == 3.0 )
				ifLocalVar62_g207113 = break59_g207113.w;
				float lerpResult373_g207086 = lerp( (Local_ShaderTex199_g207086).y , ( ifLocalVar58_g207113 + ifLocalVar60_g207113 + ifLocalVar61_g207113 + ifLocalVar62_g207113 ) , _MainOcclusionSourceMode);
				float clampResult17_g207110 = clamp( lerpResult373_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207109 = _MainOcclusionRemap.x;
				float temp_output_9_0_g207109 = ( clampResult17_g207110 - temp_output_7_0_g207109 );
				float lerpResult23_g207086 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g207109 * _MainOcclusionRemap.z ) + 0.0001 ) ) , _MainOcclusionValue);
				half Local_Occlusion313_g207086 = lerpResult23_g207086;
				float temp_output_17_0_g207115 = _MainSmoothnessChannelMode;
				TEXTURE2D(Texture276_g207105) = _MainSmoothnessTex;
				float localFilterTexture30_g207106 = ( 0.0 );
				SamplerState SS30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207106 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207106 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207106 = SamplerDefault30_g207106;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207106 = SamplerDefault30_g207106;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207106 = SamplerPoint30_g207106;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207106 = SamplerLow30_g207106;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207106 = SamplerMedium30_g207106;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207106 = SamplerHigh30_g207106;
				#endif
				}
				SamplerState Sampler276_g207105 = SS30_g207106;
				float4 temp_output_37_0_g207105 = Local_Coords180_g207086;
				half4 Coords276_g207105 = temp_output_37_0_g207105;
				half2 TexCoord276_g207105 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207105 = SampleMain( Texture276_g207105 , Sampler276_g207105 , Coords276_g207105 , TexCoord276_g207105 );
				TEXTURE2D(Texture275_g207105) = _MainSmoothnessTex;
				SamplerState Sampler275_g207105 = SS30_g207106;
				half4 Coords275_g207105 = temp_output_37_0_g207105;
				half2 TexCoord275_g207105 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207105 = SampleExtra( Texture275_g207105 , Sampler275_g207105 , Coords275_g207105 , TexCoord275_g207105 );
				TEXTURE2D(Texture238_g207105) = _MainSmoothnessTex;
				SamplerState Sampler238_g207105 = SS30_g207106;
				half4 Coords238_g207105 = temp_output_37_0_g207105;
				float3 temp_output_279_0_g207105 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207105 = temp_output_279_0_g207105;
				half4 localSamplePlanar2D238_g207105 = SamplePlanar2D( Texture238_g207105 , Sampler238_g207105 , Coords238_g207105 , WorldPosition238_g207105 );
				TEXTURE2D(Texture246_g207105) = _MainSmoothnessTex;
				SamplerState Sampler246_g207105 = SS30_g207106;
				half4 Coords246_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition246_g207105 = temp_output_279_0_g207105;
				float3 temp_output_280_0_g207105 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207105 = temp_output_280_0_g207105;
				half4 localSamplePlanar3D246_g207105 = SamplePlanar3D( Texture246_g207105 , Sampler246_g207105 , Coords246_g207105 , WorldPosition246_g207105 , WorldNormal246_g207105 );
				TEXTURE2D(Texture234_g207105) = _MainSmoothnessTex;
				SamplerState Sampler234_g207105 = SS30_g207106;
				float4 Coords234_g207105 = temp_output_37_0_g207105;
				float3 WorldPosition234_g207105 = temp_output_279_0_g207105;
				float4 localSampleStochastic2D234_g207105 = SampleStochastic2D( Texture234_g207105 , Sampler234_g207105 , Coords234_g207105 , WorldPosition234_g207105 );
				TEXTURE2D(Texture263_g207105) = _MainSmoothnessTex;
				SamplerState Sampler263_g207105 = SS30_g207106;
				half4 Coords263_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition263_g207105 = temp_output_279_0_g207105;
				half3 WorldNormal263_g207105 = temp_output_280_0_g207105;
				half4 localSampleStochastic3D263_g207105 = SampleStochastic3D( Texture263_g207105 , Sampler263_g207105 , Coords263_g207105 , WorldPosition263_g207105 , WorldNormal263_g207105 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch359_g207086 = localSampleExtra275_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch359_g207086 = localSamplePlanar2D238_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch359_g207086 = localSamplePlanar3D246_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch359_g207086 = localSampleStochastic2D234_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch359_g207086 = localSampleStochastic3D263_g207105;
				#else
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#endif
				half4 Local_SmoothnessTex365_g207086 = staticSwitch359_g207086;
				float4 break59_g207115 = Local_SmoothnessTex365_g207086;
				float ifLocalVar58_g207115 = 0;
				if( temp_output_17_0_g207115 == 0.0 )
				ifLocalVar58_g207115 = break59_g207115.x;
				float ifLocalVar60_g207115 = 0;
				if( temp_output_17_0_g207115 == 1.0 )
				ifLocalVar60_g207115 = break59_g207115.y;
				float ifLocalVar61_g207115 = 0;
				if( temp_output_17_0_g207115 == 2.0 )
				ifLocalVar61_g207115 = break59_g207115.z;
				float ifLocalVar62_g207115 = 0;
				if( temp_output_17_0_g207115 == 3.0 )
				ifLocalVar62_g207115 = break59_g207115.w;
				float3 temp_cast_2 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 temp_cast_3 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 linearToGamma404_g207086 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult374_g207086 = lerp( (Local_ShaderTex199_g207086).w , (linearToGamma404_g207086).x , _MainSmoothnessSourceMode);
				float clampResult17_g207119 = clamp( lerpResult374_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207118 = _MainSmoothnessRemap.x;
				float temp_output_9_0_g207118 = ( clampResult17_g207119 - temp_output_7_0_g207118 );
				half Local_Smoothness317_g207086 = ( saturate( ( ( temp_output_9_0_g207118 * _MainSmoothnessRemap.z ) + 0.0001 ) ) * _MainSmoothnessValue );
				float4 appendResult73_g207086 = (float4(Local_Metallic322_g207086 , Local_Occlusion313_g207086 , 0.0 , Local_Smoothness317_g207086));
				half4 Local_Masks109_g207086 = appendResult73_g207086;
				float temp_output_17_0_g207114 = _MainMultiChannelMode;
				TEXTURE2D(Texture276_g207103) = _MainMultiTex;
				float localFilterTexture30_g207104 = ( 0.0 );
				SamplerState SS30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207104 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207104 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207104 = SamplerDefault30_g207104;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207104 = SamplerDefault30_g207104;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207104 = SamplerPoint30_g207104;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207104 = SamplerLow30_g207104;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207104 = SamplerMedium30_g207104;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207104 = SamplerHigh30_g207104;
				#endif
				}
				SamplerState Sampler276_g207103 = SS30_g207104;
				float4 temp_output_37_0_g207103 = Local_Coords180_g207086;
				half4 Coords276_g207103 = temp_output_37_0_g207103;
				half2 TexCoord276_g207103 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207103 = SampleMain( Texture276_g207103 , Sampler276_g207103 , Coords276_g207103 , TexCoord276_g207103 );
				TEXTURE2D(Texture275_g207103) = _MainMultiTex;
				SamplerState Sampler275_g207103 = SS30_g207104;
				half4 Coords275_g207103 = temp_output_37_0_g207103;
				half2 TexCoord275_g207103 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207103 = SampleExtra( Texture275_g207103 , Sampler275_g207103 , Coords275_g207103 , TexCoord275_g207103 );
				TEXTURE2D(Texture238_g207103) = _MainMultiTex;
				SamplerState Sampler238_g207103 = SS30_g207104;
				half4 Coords238_g207103 = temp_output_37_0_g207103;
				float3 temp_output_279_0_g207103 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207103 = temp_output_279_0_g207103;
				half4 localSamplePlanar2D238_g207103 = SamplePlanar2D( Texture238_g207103 , Sampler238_g207103 , Coords238_g207103 , WorldPosition238_g207103 );
				TEXTURE2D(Texture246_g207103) = _MainMultiTex;
				SamplerState Sampler246_g207103 = SS30_g207104;
				half4 Coords246_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition246_g207103 = temp_output_279_0_g207103;
				float3 temp_output_280_0_g207103 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207103 = temp_output_280_0_g207103;
				half4 localSamplePlanar3D246_g207103 = SamplePlanar3D( Texture246_g207103 , Sampler246_g207103 , Coords246_g207103 , WorldPosition246_g207103 , WorldNormal246_g207103 );
				TEXTURE2D(Texture234_g207103) = _MainMultiTex;
				SamplerState Sampler234_g207103 = SS30_g207104;
				float4 Coords234_g207103 = temp_output_37_0_g207103;
				float3 WorldPosition234_g207103 = temp_output_279_0_g207103;
				float4 localSampleStochastic2D234_g207103 = SampleStochastic2D( Texture234_g207103 , Sampler234_g207103 , Coords234_g207103 , WorldPosition234_g207103 );
				TEXTURE2D(Texture263_g207103) = _MainMultiTex;
				SamplerState Sampler263_g207103 = SS30_g207104;
				half4 Coords263_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition263_g207103 = temp_output_279_0_g207103;
				half3 WorldNormal263_g207103 = temp_output_280_0_g207103;
				half4 localSampleStochastic3D263_g207103 = SampleStochastic3D( Texture263_g207103 , Sampler263_g207103 , Coords263_g207103 , WorldPosition263_g207103 , WorldNormal263_g207103 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch351_g207086 = localSampleExtra275_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch351_g207086 = localSamplePlanar2D238_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch351_g207086 = localSamplePlanar3D246_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch351_g207086 = localSampleStochastic2D234_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch351_g207086 = localSampleStochastic3D263_g207103;
				#else
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#endif
				half4 Local_MultiTex357_g207086 = staticSwitch351_g207086;
				float4 break59_g207114 = Local_MultiTex357_g207086;
				float ifLocalVar58_g207114 = 0;
				if( temp_output_17_0_g207114 == 0.0 )
				ifLocalVar58_g207114 = break59_g207114.x;
				float ifLocalVar60_g207114 = 0;
				if( temp_output_17_0_g207114 == 1.0 )
				ifLocalVar60_g207114 = break59_g207114.y;
				float ifLocalVar61_g207114 = 0;
				if( temp_output_17_0_g207114 == 2.0 )
				ifLocalVar61_g207114 = break59_g207114.z;
				float ifLocalVar62_g207114 = 0;
				if( temp_output_17_0_g207114 == 3.0 )
				ifLocalVar62_g207114 = break59_g207114.w;
				float lerpResult378_g207086 = lerp( (Local_Masks109_g207086).z , ( ifLocalVar58_g207114 + ifLocalVar60_g207114 + ifLocalVar61_g207114 + ifLocalVar62_g207114 ) , _MainMultiSourceMode);
				float clampResult17_g207116 = clamp( lerpResult378_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207117 = _MainMultiRemap.x;
				float temp_output_9_0_g207117 = ( clampResult17_g207116 - temp_output_7_0_g207117 );
				half Local_MultiMask78_g207086 = saturate( ( ( temp_output_9_0_g207117 * _MainMultiRemap.z ) + 0.0001 ) );
				float lerpResult58_g207086 = lerp( 1.0 , Local_MultiMask78_g207086 , _MainColorMode);
				float4 lerpResult62_g207086 = lerp( _MainColorTwo , _MainColor , lerpResult58_g207086);
				half3 Local_ColorRGB93_g207086 = (lerpResult62_g207086).rgb;
				half3 Local_Albedo139_g207086 = ( Local_AlbedoRGB107_g207086 * Local_ColorRGB93_g207086 );
				float3 In_Albedo3_g207090 = Local_Albedo139_g207086;
				float3 In_AlbedoRaw3_g207090 = Local_Albedo139_g207086;
				TEXTURE2D(Texture276_g207088) = _MainNormalTex;
				float localFilterTexture29_g207094 = ( 0.0 );
				SamplerState SS29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g207094 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g207094 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g207094 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g207094 = SamplerDefault29_g207094;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g207094 = SamplerDefault29_g207094;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g207094 = SamplerPoint29_g207094;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g207094 = SamplerLow29_g207094;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g207094 = SamplerMedium29_g207094;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g207094 = SamplerHigh29_g207094;
				#endif
				}
				SamplerState Sampler276_g207088 = SS29_g207094;
				float4 temp_output_37_0_g207088 = Local_Coords180_g207086;
				half4 Coords276_g207088 = temp_output_37_0_g207088;
				half2 TexCoord276_g207088 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207088 = SampleMain( Texture276_g207088 , Sampler276_g207088 , Coords276_g207088 , TexCoord276_g207088 );
				TEXTURE2D(Texture275_g207088) = _MainNormalTex;
				SamplerState Sampler275_g207088 = SS29_g207094;
				half4 Coords275_g207088 = temp_output_37_0_g207088;
				half2 TexCoord275_g207088 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207088 = SampleExtra( Texture275_g207088 , Sampler275_g207088 , Coords275_g207088 , TexCoord275_g207088 );
				TEXTURE2D(Texture238_g207088) = _MainNormalTex;
				SamplerState Sampler238_g207088 = SS29_g207094;
				half4 Coords238_g207088 = temp_output_37_0_g207088;
				float3 temp_output_279_0_g207088 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207088 = temp_output_279_0_g207088;
				half4 localSamplePlanar2D238_g207088 = SamplePlanar2D( Texture238_g207088 , Sampler238_g207088 , Coords238_g207088 , WorldPosition238_g207088 );
				TEXTURE2D(Texture246_g207088) = _MainNormalTex;
				SamplerState Sampler246_g207088 = SS29_g207094;
				half4 Coords246_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition246_g207088 = temp_output_279_0_g207088;
				float3 temp_output_280_0_g207088 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207088 = temp_output_280_0_g207088;
				half4 localSamplePlanar3D246_g207088 = SamplePlanar3D( Texture246_g207088 , Sampler246_g207088 , Coords246_g207088 , WorldPosition246_g207088 , WorldNormal246_g207088 );
				TEXTURE2D(Texture234_g207088) = _MainNormalTex;
				SamplerState Sampler234_g207088 = SS29_g207094;
				float4 Coords234_g207088 = temp_output_37_0_g207088;
				float3 WorldPosition234_g207088 = temp_output_279_0_g207088;
				float4 localSampleStochastic2D234_g207088 = SampleStochastic2D( Texture234_g207088 , Sampler234_g207088 , Coords234_g207088 , WorldPosition234_g207088 );
				TEXTURE2D(Texture263_g207088) = _MainNormalTex;
				SamplerState Sampler263_g207088 = SS29_g207094;
				half4 Coords263_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition263_g207088 = temp_output_279_0_g207088;
				half3 WorldNormal263_g207088 = temp_output_280_0_g207088;
				half4 localSampleStochastic3D263_g207088 = SampleStochastic3D( Texture263_g207088 , Sampler263_g207088 , Coords263_g207088 , WorldPosition263_g207088 , WorldNormal263_g207088 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch193_g207086 = localSampleExtra275_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch193_g207086 = localSamplePlanar2D238_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch193_g207086 = localSamplePlanar3D246_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch193_g207086 = localSampleStochastic2D234_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch193_g207086 = localSampleStochastic3D263_g207088;
				#else
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#endif
				half4 Local_NormaTex191_g207086 = staticSwitch193_g207086;
				half4 Normal_Packed45_g207091 = Local_NormaTex191_g207086;
				float2 appendResult58_g207091 = (float2(( (Normal_Packed45_g207091).x * (Normal_Packed45_g207091).w ) , (Normal_Packed45_g207091).y));
				half2 Normal_Default50_g207091 = appendResult58_g207091;
				half2 Normal_ASTC41_g207091 = (Normal_Packed45_g207091).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g207091 = Normal_ASTC41_g207091;
				#else
				float2 staticSwitch38_g207091 = Normal_Default50_g207091;
				#endif
				half2 Normal_NO_DTX544_g207091 = (Normal_Packed45_g207091).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g207091 = Normal_NO_DTX544_g207091;
				#else
				float2 staticSwitch37_g207091 = staticSwitch38_g207091;
				#endif
				float2 temp_output_26_0_g207086 = ( (staticSwitch37_g207091*2.0 + -1.0) * _MainNormalValue );
				float3x3 ase_worldToTangent = float3x3( TangentWS.xyz, BitangentWS, NormalWS );
				half2 Normal_Planar45_g207092 = temp_output_26_0_g207086;
				float2 break71_g207092 = Normal_Planar45_g207092;
				float3 appendResult72_g207092 = (float3(break71_g207092.x , 0.0 , break71_g207092.y));
				float2 temp_output_205_0_g207086 = (mul( ase_worldToTangent, appendResult72_g207092 )).xy;
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#else
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#endif
				half2 Local_NormalTS108_g207086 = staticSwitch204_g207086;
				float2 In_NormalTS3_g207090 = Local_NormalTS108_g207086;
				float3 appendResult68_g207093 = (float3(Local_NormalTS108_g207086 , 1.0));
				float3 tanToWorld0 = float3( TangentWS.xyz.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.xyz.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.xyz.z, BitangentWS.z, NormalWS.z );
				float3 tanNormal74_g207093 = appendResult68_g207093;
				float3 worldNormal74_g207093 = normalize( float3( dot( tanToWorld0, tanNormal74_g207093 ), dot( tanToWorld1, tanNormal74_g207093 ), dot( tanToWorld2, tanNormal74_g207093 ) ) );
				half3 Local_NormalWS250_g207086 = worldNormal74_g207093;
				float3 In_NormalWS3_g207090 = Local_NormalWS250_g207086;
				float4 In_Shader3_g207090 = Local_Masks109_g207086;
				float4 In_Emissive3_g207090 = half4( 1, 1, 1, 1 );
				float3 temp_output_3_0_g207107 = Local_Albedo139_g207086;
				float dotResult20_g207107 = dot( temp_output_3_0_g207107 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale110_g207086 = dotResult20_g207107;
				float In_Grayscale3_g207090 = Local_Grayscale110_g207086;
				float clampResult144_g207086 = clamp( saturate( ( Local_Grayscale110_g207086 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity145_g207086 = clampResult144_g207086;
				float In_Luminosity3_g207090 = Local_Luminosity145_g207086;
				float In_MultiMask3_g207090 = Local_MultiMask78_g207086;
				float temp_output_17_0_g207111 = _MainAlphaChannelMode;
				TEXTURE2D(Texture276_g207098) = _MainAlphaTex;
				float localFilterTexture19_g207099 = ( 0.0 );
				SamplerState SS19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207099 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207099 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207099 = SamplerDefault19_g207099;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207099 = SamplerDefault19_g207099;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207099 = SamplerPoint19_g207099;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207099 = SamplerLow19_g207099;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207099 = SamplerMedium19_g207099;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207099 = SamplerHigh19_g207099;
				#endif
				}
				SamplerState Sampler276_g207098 = SS19_g207099;
				float4 temp_output_37_0_g207098 = Local_Coords180_g207086;
				half4 Coords276_g207098 = temp_output_37_0_g207098;
				half2 TexCoord276_g207098 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207098 = SampleMain( Texture276_g207098 , Sampler276_g207098 , Coords276_g207098 , TexCoord276_g207098 );
				TEXTURE2D(Texture275_g207098) = _MainAlphaTex;
				SamplerState Sampler275_g207098 = SS19_g207099;
				half4 Coords275_g207098 = temp_output_37_0_g207098;
				half2 TexCoord275_g207098 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207098 = SampleExtra( Texture275_g207098 , Sampler275_g207098 , Coords275_g207098 , TexCoord275_g207098 );
				TEXTURE2D(Texture238_g207098) = _MainAlphaTex;
				SamplerState Sampler238_g207098 = SS19_g207099;
				half4 Coords238_g207098 = temp_output_37_0_g207098;
				float3 temp_output_279_0_g207098 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207098 = temp_output_279_0_g207098;
				half4 localSamplePlanar2D238_g207098 = SamplePlanar2D( Texture238_g207098 , Sampler238_g207098 , Coords238_g207098 , WorldPosition238_g207098 );
				TEXTURE2D(Texture246_g207098) = _MainAlphaTex;
				SamplerState Sampler246_g207098 = SS19_g207099;
				half4 Coords246_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition246_g207098 = temp_output_279_0_g207098;
				float3 temp_output_280_0_g207098 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207098 = temp_output_280_0_g207098;
				half4 localSamplePlanar3D246_g207098 = SamplePlanar3D( Texture246_g207098 , Sampler246_g207098 , Coords246_g207098 , WorldPosition246_g207098 , WorldNormal246_g207098 );
				TEXTURE2D(Texture234_g207098) = _MainAlphaTex;
				SamplerState Sampler234_g207098 = SS19_g207099;
				float4 Coords234_g207098 = temp_output_37_0_g207098;
				float3 WorldPosition234_g207098 = temp_output_279_0_g207098;
				float4 localSampleStochastic2D234_g207098 = SampleStochastic2D( Texture234_g207098 , Sampler234_g207098 , Coords234_g207098 , WorldPosition234_g207098 );
				TEXTURE2D(Texture263_g207098) = _MainAlphaTex;
				SamplerState Sampler263_g207098 = SS19_g207099;
				half4 Coords263_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition263_g207098 = temp_output_279_0_g207098;
				half3 WorldNormal263_g207098 = temp_output_280_0_g207098;
				half4 localSampleStochastic3D263_g207098 = SampleStochastic3D( Texture263_g207098 , Sampler263_g207098 , Coords263_g207098 , WorldPosition263_g207098 , WorldNormal263_g207098 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch327_g207086 = localSampleExtra275_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch327_g207086 = localSamplePlanar2D238_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch327_g207086 = localSamplePlanar3D246_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch327_g207086 = localSampleStochastic2D234_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch327_g207086 = localSampleStochastic3D263_g207098;
				#else
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#endif
				half4 Local_AlphaTex330_g207086 = staticSwitch327_g207086;
				float4 break59_g207111 = Local_AlphaTex330_g207086;
				float ifLocalVar58_g207111 = 0;
				if( temp_output_17_0_g207111 == 0.0 )
				ifLocalVar58_g207111 = break59_g207111.x;
				float ifLocalVar60_g207111 = 0;
				if( temp_output_17_0_g207111 == 1.0 )
				ifLocalVar60_g207111 = break59_g207111.y;
				float ifLocalVar61_g207111 = 0;
				if( temp_output_17_0_g207111 == 2.0 )
				ifLocalVar61_g207111 = break59_g207111.z;
				float ifLocalVar62_g207111 = 0;
				if( temp_output_17_0_g207111 == 3.0 )
				ifLocalVar62_g207111 = break59_g207111.w;
				float3 temp_cast_4 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 temp_cast_5 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 linearToGamma402_g207086 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult385_g207086 = lerp( (Local_AlbedoTex185_g207086).w , (linearToGamma402_g207086).x , _MainAlphaSourceMode);
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch236_g207086 = ( lerpResult385_g207086 - _MainAlphaClipValue );
				#else
				float staticSwitch236_g207086 = lerpResult385_g207086;
				#endif
				half Local_AlphaClip111_g207086 = staticSwitch236_g207086;
				float In_AlphaClip3_g207090 = Local_AlphaClip111_g207086;
				half Local_AlphaFade246_g207086 = (lerpResult62_g207086).a;
				float In_AlphaFade3_g207090 = Local_AlphaFade246_g207086;
				float3 temp_cast_6 = (1.0).xxx;
				float3 In_Translucency3_g207090 = temp_cast_6;
				float In_Transmission3_g207090 = 1.0;
				float In_Thickness3_g207090 = 0.0;
				float In_Diffusion3_g207090 = 0.0;
				float In_Depth3_g207090 = 0.0;
				{
				Data3_g207090.Dummy = In_Dummy3_g207090;
				Data3_g207090.Albedo = In_Albedo3_g207090;
				Data3_g207090.AlbedoRaw = In_AlbedoRaw3_g207090;
				Data3_g207090.NormalTS = In_NormalTS3_g207090;
				Data3_g207090.NormalWS = In_NormalWS3_g207090;
				Data3_g207090.Shader = In_Shader3_g207090;
				Data3_g207090.Emissive= In_Emissive3_g207090;
				Data3_g207090.MultiMask = In_MultiMask3_g207090;
				Data3_g207090.Grayscale = In_Grayscale3_g207090;
				Data3_g207090.Luminosity = In_Luminosity3_g207090;
				Data3_g207090.AlphaClip = In_AlphaClip3_g207090;
				Data3_g207090.AlphaFade = In_AlphaFade3_g207090;
				Data3_g207090.Translucency = In_Translucency3_g207090;
				Data3_g207090.Transmission = In_Transmission3_g207090;
				Data3_g207090.Thickness = In_Thickness3_g207090;
				Data3_g207090.Diffusion = In_Diffusion3_g207090;
				Data3_g207090.Depth = In_Depth3_g207090;
				}
				TVEVisualData Data4_g207126 = Data3_g207090;
				float Out_Dummy4_g207126 = 0;
				float3 Out_Albedo4_g207126 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g207126 = float3( 0,0,0 );
				float2 Out_NormalTS4_g207126 = float2( 0,0 );
				float3 Out_NormalWS4_g207126 = float3( 0,0,0 );
				float4 Out_Shader4_g207126 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g207126 = float4( 0,0,0,0 );
				float Out_MultiMask4_g207126 = 0;
				float Out_Grayscale4_g207126 = 0;
				float Out_Luminosity4_g207126 = 0;
				float Out_AlphaClip4_g207126 = 0;
				float Out_AlphaFade4_g207126 = 0;
				float3 Out_Translucency4_g207126 = float3( 0,0,0 );
				float Out_Transmission4_g207126 = 0;
				float Out_Thickness4_g207126 = 0;
				float Out_Diffusion4_g207126 = 0;
				float Out_Depth4_g207126 = 0;
				{
				Out_Dummy4_g207126 = Data4_g207126.Dummy;
				Out_Albedo4_g207126 = Data4_g207126.Albedo;
				Out_AlbedoRaw4_g207126 = Data4_g207126.AlbedoRaw;
				Out_NormalTS4_g207126 = Data4_g207126.NormalTS;
				Out_NormalWS4_g207126 = Data4_g207126.NormalWS;
				Out_Shader4_g207126 = Data4_g207126.Shader;
				Out_Emissive4_g207126= Data4_g207126.Emissive;
				Out_MultiMask4_g207126 = Data4_g207126.MultiMask;
				Out_Grayscale4_g207126 = Data4_g207126.Grayscale;
				Out_Luminosity4_g207126= Data4_g207126.Luminosity;
				Out_AlphaClip4_g207126 = Data4_g207126.AlphaClip;
				Out_AlphaFade4_g207126 = Data4_g207126.AlphaFade;
				Out_Translucency4_g207126 = Data4_g207126.Translucency;
				Out_Transmission4_g207126 = Data4_g207126.Transmission;
				Out_Thickness4_g207126 = Data4_g207126.Thickness;
				Out_Diffusion4_g207126 = Data4_g207126.Diffusion;
				Out_Depth4_g207126= Data4_g207126.Depth;
				}
				float temp_output_3_0_g207131 = Out_AlphaClip4_g207126;
				float Alpha21_g207131 = temp_output_3_0_g207131;
				float temp_output_15_0_g207131 = 0.0;
				float Treshold21_g207131 = temp_output_15_0_g207131;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_CUTOUT) || defined (TVE_GLANCING) || defined (TVE_DITHER)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha21_g207131 - Treshold21_g207131);
				#endif
				#endif
				}
				

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;

				surfaceDescription.Alpha = saturate( ( Alpha21_g207131 * Out_AlphaFade4_g207126 ) );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = input.positionSS.z;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
					float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
					outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.vmesh.positionCS.z;
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					#endif
					decalPrepassData.renderingLayerMask = GetMeshRenderingLayerMask();
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#define ASE_FRAGMENT_NORMAL 0
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 170004
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma editor_sync_compilation
            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
		    #define SCENESELECTIONPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _MainOcclusionRemap;
			half4 _MainCoordValue;
			half4 _Color;
			half4 _MainColor;
			half4 _MainMultiRemap;
			half4 _main_coord_value;
			half4 _MainSmoothnessRemap;
			half4 _MainColorTwo;
			half3 _render_normal;
			half _MainMetallicChannelMode;
			half _MainAlbedoValue;
			half _MainSmoothnessInfo;
			half _MainMultiMaskInfo;
			half _MainCoordMode;
			half _MainSampleMode;
			half _MainMetallicSourceMode;
			half _MainMetallicValue;
			half _MainOcclusionSourceMode;
			half _MainEnd;
			half _MainOcclusionValue;
			half _MainSmoothnessChannelMode;
			half _MainSmoothnessSourceMode;
			half _MainSmoothnessValue;
			half _MainMultiChannelMode;
			half _MainMultiSourceMode;
			half _MainColorMode;
			half _MainNormalValue;
			half _MainAlphaChannelMode;
			half _MainAlphaSourceMode;
			half _MainAlphaClipValue;
			half _MainOcclusionChannelMode;
			half _render_src;
			half _MainCategory;
			half _RenderClip;
			half _render_cull;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			half _IsGeneralShader;
			half _RenderZWrite;
			half _IsVersion;
			half _RenderCategory;
			half _RenderEnd;
			half _RenderMode;
			half _RenderCull;
			half _RenderNormal;
			half _RenderBakeGI;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMotion;
			half _Cutoff;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderFilter;
			half _RenderShadow;
			half _IsStandardShader;
			half _RenderSpecular;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_Linear_Repeat);
			SAMPLER(sampler_Linear_Repeat_Aniso8);
			SAMPLER(sampler_Point_Repeat);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MainShaderTex);
			TEXTURE2D(_MainMetallicTex);
			TEXTURE2D(_MainOcclusionTex);
			TEXTURE2D(_MainSmoothnessTex);
			TEXTURE2D(_MainMultiTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_MainAlphaTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local_fragment TVE_FILTER_DEFAULT TVE_FILTER_POINT TVE_FILTER_LOW TVE_FILTER_MEDIUM TVE_FILTER_HIGH
			#pragma shader_feature_local_fragment TVE_MAIN_SAMPLE_MAIN_UV TVE_MAIN_SAMPLE_EXTRA_UV TVE_MAIN_SAMPLE_PLANAR_2D TVE_MAIN_SAMPLE_PLANAR_3D TVE_MAIN_SAMPLE_STOCHASTIC_2D TVE_MAIN_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_vertex TVE_PIVOT_OFF TVE_PIVOT_BAKED TVE_PIVOT_PROC
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			#define TVE_GEOMETRY_SHADER
			//#pragma editor_sync_compilation
			#ifndef ASE_NEEDS_TEXTURE_COORDINATES2 //Needed for ASE 1.9.8.1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			void ComputeWorldCoords( half4 Coords, half3 WorldPosition, out half2 ZX, out half2 ZY, out half2 XY )
			{
				ZX = WorldPosition.xz * Coords.xx - Coords.zz;
				ZY = WorldPosition.yz * Coords.yx - Coords.wz; 
				XY = WorldPosition.xy * Coords.xy - Coords.zw;
			}
			
			half4 SampleMain( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SampleExtra( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			half4 SamplePlanar2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			void ComputeTriplanarWeights( half3 WorldNormal, out half T1, out half T2, out half T3 )
			{
				half3 powNormal = abs( WorldNormal.xyz );
				half3 weights = max( powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal, 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				T1 = weights.y;
				T2 = weights.x;
				T3 = weights.z;
			}
			
			half4 SamplePlanar3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				half4 tex1 = SAMPLE_TEXTURE2D( Texture, Sampler, ZX);
				half4 tex2 = SAMPLE_TEXTURE2D( Texture, Sampler, ZY);
				half4 tex3 = SAMPLE_TEXTURE2D( Texture, Sampler, XY);
				return tex1 * T1 + tex2 * T2 + tex3 * T3;
			}
			
			void ComputeStochasticCoords( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				half2 vertex1, vertex2, vertex3;
				// Scaling of the input
				half2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				half2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				half3 temp = half3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float4 SampleStochastic2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				ComputeStochasticCoords(UV, UV1, UV2, UV3, W1, W2, W3 );
				half4 tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(UV), ddy(UV));
				half4 tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(UV), ddy(UV));
				half4 tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(UV), ddy(UV));
				return tex1 * W1 + tex2 * W2 + tex3 * W3;
			}
			
			half4 SampleStochastic3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				half4 tex1, tex2, tex3;
				ComputeStochasticCoords(ZX, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZX), ddy(ZX));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZX), ddy(ZX));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZX), ddy(ZX));
				half4 texZX = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(ZY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZY), ddy(ZY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZY), ddy(ZY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZY), ddy(ZY));
				half4 texZY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(XY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(XY), ddy(XY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(XY), ddy(XY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(XY), ddy(XY));
				half4 texXY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				return texZX * T1 + texZY * T2 + texXY * T3;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				//refraction SceneSelectionPass
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = float3(0.0f, 0.0f, 1.0f);

				#ifdef DECAL_NORMAL_BLENDING
					#ifndef SURFACE_GRADIENT
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
					#if !defined(SHADER_STAGE_RAY_TRACING)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						#ifdef FRAG_INPUTS_USE_TEXCOORD0
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
						#else
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
						#endif
						surfaceData.metallic = 0;
					}
					#endif
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float3 vertexToFrag73_g205214 = ase_positionWS;
				output.ase_texcoord4.xyz = vertexToFrag73_g205214;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205224 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205224 = ( localObjectPosition_UNITY_MATRIX_M14_g205224 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205224 = localObjectPosition_UNITY_MATRIX_M14_g205224;
				#endif
				float3 temp_output_340_7_g205214 = staticSwitch13_g205224;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205226 = ObjectPosition_UNITY_MATRIX_M();
				float3 _Vector0 = float3(0,0,0);
				float3 appendResult60_g205222 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 PositionOS131_g205214 = inputMesh.positionOS;
				float3 break233_g205214 = PositionOS131_g205214;
				float3 appendResult234_g205214 = (float3(break233_g205214.x , 0.0 , break233_g205214.z));
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch229_g205214 = _Vector0;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch229_g205214 = appendResult60_g205222;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch229_g205214 = appendResult234_g205214;
				#else
				float3 staticSwitch229_g205214 = _Vector0;
				#endif
				half3 PivotOS149_g205214 = staticSwitch229_g205214;
				float3 temp_output_122_0_g205226 = PivotOS149_g205214;
				float3 PivotsOnlyWS105_g205226 = mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g205226 , 0.0 ) ).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205226 = ( ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205226 = ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 );
				#endif
				float3 temp_output_341_7_g205214 = staticSwitch13_g205226;
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#else
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#endif
				float3 vertexToFrag76_g205214 = staticSwitch236_g205214;
				output.ase_texcoord5.xyz = vertexToFrag76_g205214;
				
				output.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				output.ase_texcoord3.zw = inputMesh.ase_texcoord2.xy;
				output.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];

				float localCustomAlphaClip21_g207131 = ( 0.0 );
				float localBreakData4_g207126 = ( 0.0 );
				float localCompData3_g207090 = ( 0.0 );
				TVEVisualData Data3_g207090 = (TVEVisualData)0;
				half4 Dummy130_g207086 = ( _MainCategory + _MainEnd + ( _MainSampleMode + _MainCoordMode + _MainCoordValue ) + _MainMultiMaskInfo + _MainSmoothnessInfo );
				float In_Dummy3_g207090 = Dummy130_g207086.x;
				TEXTURE2D(Texture276_g207087) = _MainAlbedoTex;
				float localFilterTexture19_g207095 = ( 0.0 );
				SamplerState SS19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207095 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207095 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207095 = SamplerDefault19_g207095;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207095 = SamplerDefault19_g207095;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207095 = SamplerPoint19_g207095;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207095 = SamplerLow19_g207095;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207095 = SamplerMedium19_g207095;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207095 = SamplerHigh19_g207095;
				#endif
				}
				SamplerState Sampler276_g207087 = SS19_g207095;
				half4 Local_Coords180_g207086 = _main_coord_value;
				float4 temp_output_37_0_g207087 = Local_Coords180_g207086;
				half4 Coords276_g207087 = temp_output_37_0_g207087;
				half2 TexCoord276_g207087 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207087 = SampleMain( Texture276_g207087 , Sampler276_g207087 , Coords276_g207087 , TexCoord276_g207087 );
				TEXTURE2D(Texture275_g207087) = _MainAlbedoTex;
				SamplerState Sampler275_g207087 = SS19_g207095;
				half4 Coords275_g207087 = temp_output_37_0_g207087;
				half2 TexCoord275_g207087 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207087 = SampleExtra( Texture275_g207087 , Sampler275_g207087 , Coords275_g207087 , TexCoord275_g207087 );
				TEXTURE2D(Texture238_g207087) = _MainAlbedoTex;
				SamplerState Sampler238_g207087 = SS19_g207095;
				half4 Coords238_g207087 = temp_output_37_0_g207087;
				TVEModelData Data16_g205219 = (TVEModelData)0;
				float In_Dummy16_g205219 = 0.0;
				float3 vertexToFrag73_g205214 = packedInput.ase_texcoord4.xyz;
				half3 PositionWS122_g205214 = vertexToFrag73_g205214;
				float3 In_PositionWS16_g205219 = PositionWS122_g205214;
				float3 vertexToFrag76_g205214 = packedInput.ase_texcoord5.xyz;
				half3 PivotWS121_g205214 = vertexToFrag76_g205214;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g205214 = ( PositionWS122_g205214 - PivotWS121_g205214 );
				#else
				float3 staticSwitch204_g205214 = PositionWS122_g205214;
				#endif
				half3 PositionWO132_g205214 = ( staticSwitch204_g205214 - TVE_WorldOrigin );
				float3 In_PositionWO16_g205219 = PositionWO132_g205214;
				float3 In_PivotWS16_g205219 = PivotWS121_g205214;
				half3 PivotWO133_g205214 = ( PivotWS121_g205214 - TVE_WorldOrigin );
				float3 In_PivotWO16_g205219 = PivotWO133_g205214;
				float3 normalizedWorldNormal = normalize( NormalWS );
				half3 Normal_WS95_g205214 = normalizedWorldNormal;
				float3 In_NormalWS16_g205219 = Normal_WS95_g205214;
				float3 normalizeResult296_g205214 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g205214 ) );
				half3 ViewDirWS169_g205214 = normalizeResult296_g205214;
				float3 In_ViewDirWS16_g205219 = ViewDirWS169_g205214;
				half4 VertexMasks171_g205214 = packedInput.ase_color;
				float4 In_VertexData16_g205219 = VertexMasks171_g205214;
				float4 In_BoundsData16_g205219 = float4( 1,1,1,1 );
				{
				Data16_g205219.Dummy = In_Dummy16_g205219;
				Data16_g205219.PositionWS = In_PositionWS16_g205219;
				Data16_g205219.PositionWO = In_PositionWO16_g205219;
				Data16_g205219.PivotWS = In_PivotWS16_g205219;
				Data16_g205219.PivotWO = In_PivotWO16_g205219;
				Data16_g205219.NormalWS = In_NormalWS16_g205219;
				Data16_g205219.ViewDirWS = In_ViewDirWS16_g205219;
				Data16_g205219.VertexData = In_VertexData16_g205219;
				Data16_g205219.BoundsData = In_BoundsData16_g205219;
				}
				TVEModelData Data15_g207089 = Data16_g205219;
				float Out_Dummy15_g207089 = 0;
				float3 Out_PositionWS15_g207089 = float3( 0,0,0 );
				float3 Out_PositionWO15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWS15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWO15_g207089 = float3( 0,0,0 );
				float3 Out_NormalWS15_g207089 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g207089 = float3( 0,0,0 );
				float4 Out_VertexData15_g207089 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g207089 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g207089 = Data15_g207089.Dummy;
				Out_PositionWS15_g207089 = Data15_g207089.PositionWS;
				Out_PositionWO15_g207089 = Data15_g207089.PositionWO;
				Out_PivotWS15_g207089 = Data15_g207089.PivotWS;
				Out_PivotWO15_g207089 = Data15_g207089.PivotWO;
				Out_NormalWS15_g207089 = Data15_g207089.NormalWS;
				Out_ViewDirWS15_g207089 = Data15_g207089.ViewDirWS;
				Out_VertexData15_g207089 = Data15_g207089.VertexData;
				Out_BoundsData15_g207089 = Data15_g207089.BoundsData;
				}
				half3 Model_PositionWO222_g207086 = Out_PositionWO15_g207089;
				float3 temp_output_279_0_g207087 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207087 = temp_output_279_0_g207087;
				half4 localSamplePlanar2D238_g207087 = SamplePlanar2D( Texture238_g207087 , Sampler238_g207087 , Coords238_g207087 , WorldPosition238_g207087 );
				TEXTURE2D(Texture246_g207087) = _MainAlbedoTex;
				SamplerState Sampler246_g207087 = SS19_g207095;
				half4 Coords246_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition246_g207087 = temp_output_279_0_g207087;
				half3 Model_NormalWS226_g207086 = Out_NormalWS15_g207089;
				float3 temp_output_280_0_g207087 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207087 = temp_output_280_0_g207087;
				half4 localSamplePlanar3D246_g207087 = SamplePlanar3D( Texture246_g207087 , Sampler246_g207087 , Coords246_g207087 , WorldPosition246_g207087 , WorldNormal246_g207087 );
				TEXTURE2D(Texture234_g207087) = _MainAlbedoTex;
				SamplerState Sampler234_g207087 = SS19_g207095;
				float4 Coords234_g207087 = temp_output_37_0_g207087;
				float3 WorldPosition234_g207087 = temp_output_279_0_g207087;
				float4 localSampleStochastic2D234_g207087 = SampleStochastic2D( Texture234_g207087 , Sampler234_g207087 , Coords234_g207087 , WorldPosition234_g207087 );
				TEXTURE2D(Texture263_g207087) = _MainAlbedoTex;
				SamplerState Sampler263_g207087 = SS19_g207095;
				half4 Coords263_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition263_g207087 = temp_output_279_0_g207087;
				half3 WorldNormal263_g207087 = temp_output_280_0_g207087;
				half4 localSampleStochastic3D263_g207087 = SampleStochastic3D( Texture263_g207087 , Sampler263_g207087 , Coords263_g207087 , WorldPosition263_g207087 , WorldNormal263_g207087 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch184_g207086 = localSampleExtra275_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch184_g207086 = localSamplePlanar2D238_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch184_g207086 = localSamplePlanar3D246_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch184_g207086 = localSampleStochastic2D234_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch184_g207086 = localSampleStochastic3D263_g207087;
				#else
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#endif
				half4 Local_AlbedoTex185_g207086 = staticSwitch184_g207086;
				float3 lerpResult53_g207086 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex185_g207086).xyz , _MainAlbedoValue);
				half3 Local_AlbedoRGB107_g207086 = lerpResult53_g207086;
				TEXTURE2D(Texture276_g207096) = _MainShaderTex;
				float localFilterTexture30_g207097 = ( 0.0 );
				SamplerState SS30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207097 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207097 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207097 = SamplerDefault30_g207097;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207097 = SamplerDefault30_g207097;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207097 = SamplerPoint30_g207097;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207097 = SamplerLow30_g207097;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207097 = SamplerMedium30_g207097;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207097 = SamplerHigh30_g207097;
				#endif
				}
				SamplerState Sampler276_g207096 = SS30_g207097;
				float4 temp_output_37_0_g207096 = Local_Coords180_g207086;
				half4 Coords276_g207096 = temp_output_37_0_g207096;
				half2 TexCoord276_g207096 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207096 = SampleMain( Texture276_g207096 , Sampler276_g207096 , Coords276_g207096 , TexCoord276_g207096 );
				TEXTURE2D(Texture275_g207096) = _MainShaderTex;
				SamplerState Sampler275_g207096 = SS30_g207097;
				half4 Coords275_g207096 = temp_output_37_0_g207096;
				half2 TexCoord275_g207096 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207096 = SampleExtra( Texture275_g207096 , Sampler275_g207096 , Coords275_g207096 , TexCoord275_g207096 );
				TEXTURE2D(Texture238_g207096) = _MainShaderTex;
				SamplerState Sampler238_g207096 = SS30_g207097;
				half4 Coords238_g207096 = temp_output_37_0_g207096;
				float3 temp_output_279_0_g207096 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207096 = temp_output_279_0_g207096;
				half4 localSamplePlanar2D238_g207096 = SamplePlanar2D( Texture238_g207096 , Sampler238_g207096 , Coords238_g207096 , WorldPosition238_g207096 );
				TEXTURE2D(Texture246_g207096) = _MainShaderTex;
				SamplerState Sampler246_g207096 = SS30_g207097;
				half4 Coords246_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition246_g207096 = temp_output_279_0_g207096;
				float3 temp_output_280_0_g207096 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207096 = temp_output_280_0_g207096;
				half4 localSamplePlanar3D246_g207096 = SamplePlanar3D( Texture246_g207096 , Sampler246_g207096 , Coords246_g207096 , WorldPosition246_g207096 , WorldNormal246_g207096 );
				TEXTURE2D(Texture234_g207096) = _MainShaderTex;
				SamplerState Sampler234_g207096 = SS30_g207097;
				float4 Coords234_g207096 = temp_output_37_0_g207096;
				float3 WorldPosition234_g207096 = temp_output_279_0_g207096;
				float4 localSampleStochastic2D234_g207096 = SampleStochastic2D( Texture234_g207096 , Sampler234_g207096 , Coords234_g207096 , WorldPosition234_g207096 );
				TEXTURE2D(Texture263_g207096) = _MainShaderTex;
				SamplerState Sampler263_g207096 = SS30_g207097;
				half4 Coords263_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition263_g207096 = temp_output_279_0_g207096;
				half3 WorldNormal263_g207096 = temp_output_280_0_g207096;
				half4 localSampleStochastic3D263_g207096 = SampleStochastic3D( Texture263_g207096 , Sampler263_g207096 , Coords263_g207096 , WorldPosition263_g207096 , WorldNormal263_g207096 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch198_g207086 = localSampleExtra275_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch198_g207086 = localSamplePlanar2D238_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch198_g207086 = localSamplePlanar3D246_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch198_g207086 = localSampleStochastic2D234_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch198_g207086 = localSampleStochastic3D263_g207096;
				#else
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#endif
				half4 Local_ShaderTex199_g207086 = staticSwitch198_g207086;
				float temp_output_17_0_g207112 = _MainMetallicChannelMode;
				TEXTURE2D(Texture276_g207100) = _MainMetallicTex;
				float localFilterTexture30_g207101 = ( 0.0 );
				SamplerState SS30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207101 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207101 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207101 = SamplerDefault30_g207101;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207101 = SamplerDefault30_g207101;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207101 = SamplerPoint30_g207101;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207101 = SamplerLow30_g207101;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207101 = SamplerMedium30_g207101;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207101 = SamplerHigh30_g207101;
				#endif
				}
				SamplerState Sampler276_g207100 = SS30_g207101;
				float4 temp_output_37_0_g207100 = Local_Coords180_g207086;
				half4 Coords276_g207100 = temp_output_37_0_g207100;
				half2 TexCoord276_g207100 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207100 = SampleMain( Texture276_g207100 , Sampler276_g207100 , Coords276_g207100 , TexCoord276_g207100 );
				TEXTURE2D(Texture275_g207100) = _MainMetallicTex;
				SamplerState Sampler275_g207100 = SS30_g207101;
				half4 Coords275_g207100 = temp_output_37_0_g207100;
				half2 TexCoord275_g207100 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207100 = SampleExtra( Texture275_g207100 , Sampler275_g207100 , Coords275_g207100 , TexCoord275_g207100 );
				TEXTURE2D(Texture238_g207100) = _MainMetallicTex;
				SamplerState Sampler238_g207100 = SS30_g207101;
				half4 Coords238_g207100 = temp_output_37_0_g207100;
				float3 temp_output_279_0_g207100 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207100 = temp_output_279_0_g207100;
				half4 localSamplePlanar2D238_g207100 = SamplePlanar2D( Texture238_g207100 , Sampler238_g207100 , Coords238_g207100 , WorldPosition238_g207100 );
				TEXTURE2D(Texture246_g207100) = _MainMetallicTex;
				SamplerState Sampler246_g207100 = SS30_g207101;
				half4 Coords246_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition246_g207100 = temp_output_279_0_g207100;
				float3 temp_output_280_0_g207100 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207100 = temp_output_280_0_g207100;
				half4 localSamplePlanar3D246_g207100 = SamplePlanar3D( Texture246_g207100 , Sampler246_g207100 , Coords246_g207100 , WorldPosition246_g207100 , WorldNormal246_g207100 );
				TEXTURE2D(Texture234_g207100) = _MainMetallicTex;
				SamplerState Sampler234_g207100 = SS30_g207101;
				float4 Coords234_g207100 = temp_output_37_0_g207100;
				float3 WorldPosition234_g207100 = temp_output_279_0_g207100;
				float4 localSampleStochastic2D234_g207100 = SampleStochastic2D( Texture234_g207100 , Sampler234_g207100 , Coords234_g207100 , WorldPosition234_g207100 );
				TEXTURE2D(Texture263_g207100) = _MainMetallicTex;
				SamplerState Sampler263_g207100 = SS30_g207101;
				half4 Coords263_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition263_g207100 = temp_output_279_0_g207100;
				half3 WorldNormal263_g207100 = temp_output_280_0_g207100;
				half4 localSampleStochastic3D263_g207100 = SampleStochastic3D( Texture263_g207100 , Sampler263_g207100 , Coords263_g207100 , WorldPosition263_g207100 , WorldNormal263_g207100 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch335_g207086 = localSampleExtra275_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch335_g207086 = localSamplePlanar2D238_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch335_g207086 = localSamplePlanar3D246_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch335_g207086 = localSampleStochastic2D234_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch335_g207086 = localSampleStochastic3D263_g207100;
				#else
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#endif
				half4 Local_MetallicTex341_g207086 = staticSwitch335_g207086;
				float4 break59_g207112 = Local_MetallicTex341_g207086;
				float ifLocalVar58_g207112 = 0;
				if( temp_output_17_0_g207112 == 0.0 )
				ifLocalVar58_g207112 = break59_g207112.x;
				float ifLocalVar60_g207112 = 0;
				if( temp_output_17_0_g207112 == 1.0 )
				ifLocalVar60_g207112 = break59_g207112.y;
				float ifLocalVar61_g207112 = 0;
				if( temp_output_17_0_g207112 == 2.0 )
				ifLocalVar61_g207112 = break59_g207112.z;
				float ifLocalVar62_g207112 = 0;
				if( temp_output_17_0_g207112 == 3.0 )
				ifLocalVar62_g207112 = break59_g207112.w;
				float lerpResult366_g207086 = lerp( (Local_ShaderTex199_g207086).x , ( ifLocalVar58_g207112 + ifLocalVar60_g207112 + ifLocalVar61_g207112 + ifLocalVar62_g207112 ) , _MainMetallicSourceMode);
				half Local_Metallic322_g207086 = ( lerpResult366_g207086 * _MainMetallicValue );
				float temp_output_17_0_g207113 = _MainOcclusionChannelMode;
				TEXTURE2D(Texture276_g207102) = _MainOcclusionTex;
				float localFilterTexture30_g207108 = ( 0.0 );
				SamplerState SS30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207108 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207108 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207108 = SamplerDefault30_g207108;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207108 = SamplerDefault30_g207108;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207108 = SamplerPoint30_g207108;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207108 = SamplerLow30_g207108;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207108 = SamplerMedium30_g207108;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207108 = SamplerHigh30_g207108;
				#endif
				}
				SamplerState Sampler276_g207102 = SS30_g207108;
				float4 temp_output_37_0_g207102 = Local_Coords180_g207086;
				half4 Coords276_g207102 = temp_output_37_0_g207102;
				half2 TexCoord276_g207102 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207102 = SampleMain( Texture276_g207102 , Sampler276_g207102 , Coords276_g207102 , TexCoord276_g207102 );
				TEXTURE2D(Texture275_g207102) = _MainOcclusionTex;
				SamplerState Sampler275_g207102 = SS30_g207108;
				half4 Coords275_g207102 = temp_output_37_0_g207102;
				half2 TexCoord275_g207102 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207102 = SampleExtra( Texture275_g207102 , Sampler275_g207102 , Coords275_g207102 , TexCoord275_g207102 );
				TEXTURE2D(Texture238_g207102) = _MainOcclusionTex;
				SamplerState Sampler238_g207102 = SS30_g207108;
				half4 Coords238_g207102 = temp_output_37_0_g207102;
				float3 temp_output_279_0_g207102 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207102 = temp_output_279_0_g207102;
				half4 localSamplePlanar2D238_g207102 = SamplePlanar2D( Texture238_g207102 , Sampler238_g207102 , Coords238_g207102 , WorldPosition238_g207102 );
				TEXTURE2D(Texture246_g207102) = _MainOcclusionTex;
				SamplerState Sampler246_g207102 = SS30_g207108;
				half4 Coords246_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition246_g207102 = temp_output_279_0_g207102;
				float3 temp_output_280_0_g207102 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207102 = temp_output_280_0_g207102;
				half4 localSamplePlanar3D246_g207102 = SamplePlanar3D( Texture246_g207102 , Sampler246_g207102 , Coords246_g207102 , WorldPosition246_g207102 , WorldNormal246_g207102 );
				TEXTURE2D(Texture234_g207102) = _MainOcclusionTex;
				SamplerState Sampler234_g207102 = SS30_g207108;
				float4 Coords234_g207102 = temp_output_37_0_g207102;
				float3 WorldPosition234_g207102 = temp_output_279_0_g207102;
				float4 localSampleStochastic2D234_g207102 = SampleStochastic2D( Texture234_g207102 , Sampler234_g207102 , Coords234_g207102 , WorldPosition234_g207102 );
				TEXTURE2D(Texture263_g207102) = _MainOcclusionTex;
				SamplerState Sampler263_g207102 = SS30_g207108;
				half4 Coords263_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition263_g207102 = temp_output_279_0_g207102;
				half3 WorldNormal263_g207102 = temp_output_280_0_g207102;
				half4 localSampleStochastic3D263_g207102 = SampleStochastic3D( Texture263_g207102 , Sampler263_g207102 , Coords263_g207102 , WorldPosition263_g207102 , WorldNormal263_g207102 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch343_g207086 = localSampleExtra275_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch343_g207086 = localSamplePlanar2D238_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch343_g207086 = localSamplePlanar3D246_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch343_g207086 = localSampleStochastic2D234_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch343_g207086 = localSampleStochastic3D263_g207102;
				#else
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#endif
				half4 Local_OcclusionTex349_g207086 = staticSwitch343_g207086;
				float4 break59_g207113 = Local_OcclusionTex349_g207086;
				float ifLocalVar58_g207113 = 0;
				if( temp_output_17_0_g207113 == 0.0 )
				ifLocalVar58_g207113 = break59_g207113.x;
				float ifLocalVar60_g207113 = 0;
				if( temp_output_17_0_g207113 == 1.0 )
				ifLocalVar60_g207113 = break59_g207113.y;
				float ifLocalVar61_g207113 = 0;
				if( temp_output_17_0_g207113 == 2.0 )
				ifLocalVar61_g207113 = break59_g207113.z;
				float ifLocalVar62_g207113 = 0;
				if( temp_output_17_0_g207113 == 3.0 )
				ifLocalVar62_g207113 = break59_g207113.w;
				float lerpResult373_g207086 = lerp( (Local_ShaderTex199_g207086).y , ( ifLocalVar58_g207113 + ifLocalVar60_g207113 + ifLocalVar61_g207113 + ifLocalVar62_g207113 ) , _MainOcclusionSourceMode);
				float clampResult17_g207110 = clamp( lerpResult373_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207109 = _MainOcclusionRemap.x;
				float temp_output_9_0_g207109 = ( clampResult17_g207110 - temp_output_7_0_g207109 );
				float lerpResult23_g207086 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g207109 * _MainOcclusionRemap.z ) + 0.0001 ) ) , _MainOcclusionValue);
				half Local_Occlusion313_g207086 = lerpResult23_g207086;
				float temp_output_17_0_g207115 = _MainSmoothnessChannelMode;
				TEXTURE2D(Texture276_g207105) = _MainSmoothnessTex;
				float localFilterTexture30_g207106 = ( 0.0 );
				SamplerState SS30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207106 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207106 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207106 = SamplerDefault30_g207106;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207106 = SamplerDefault30_g207106;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207106 = SamplerPoint30_g207106;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207106 = SamplerLow30_g207106;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207106 = SamplerMedium30_g207106;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207106 = SamplerHigh30_g207106;
				#endif
				}
				SamplerState Sampler276_g207105 = SS30_g207106;
				float4 temp_output_37_0_g207105 = Local_Coords180_g207086;
				half4 Coords276_g207105 = temp_output_37_0_g207105;
				half2 TexCoord276_g207105 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207105 = SampleMain( Texture276_g207105 , Sampler276_g207105 , Coords276_g207105 , TexCoord276_g207105 );
				TEXTURE2D(Texture275_g207105) = _MainSmoothnessTex;
				SamplerState Sampler275_g207105 = SS30_g207106;
				half4 Coords275_g207105 = temp_output_37_0_g207105;
				half2 TexCoord275_g207105 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207105 = SampleExtra( Texture275_g207105 , Sampler275_g207105 , Coords275_g207105 , TexCoord275_g207105 );
				TEXTURE2D(Texture238_g207105) = _MainSmoothnessTex;
				SamplerState Sampler238_g207105 = SS30_g207106;
				half4 Coords238_g207105 = temp_output_37_0_g207105;
				float3 temp_output_279_0_g207105 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207105 = temp_output_279_0_g207105;
				half4 localSamplePlanar2D238_g207105 = SamplePlanar2D( Texture238_g207105 , Sampler238_g207105 , Coords238_g207105 , WorldPosition238_g207105 );
				TEXTURE2D(Texture246_g207105) = _MainSmoothnessTex;
				SamplerState Sampler246_g207105 = SS30_g207106;
				half4 Coords246_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition246_g207105 = temp_output_279_0_g207105;
				float3 temp_output_280_0_g207105 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207105 = temp_output_280_0_g207105;
				half4 localSamplePlanar3D246_g207105 = SamplePlanar3D( Texture246_g207105 , Sampler246_g207105 , Coords246_g207105 , WorldPosition246_g207105 , WorldNormal246_g207105 );
				TEXTURE2D(Texture234_g207105) = _MainSmoothnessTex;
				SamplerState Sampler234_g207105 = SS30_g207106;
				float4 Coords234_g207105 = temp_output_37_0_g207105;
				float3 WorldPosition234_g207105 = temp_output_279_0_g207105;
				float4 localSampleStochastic2D234_g207105 = SampleStochastic2D( Texture234_g207105 , Sampler234_g207105 , Coords234_g207105 , WorldPosition234_g207105 );
				TEXTURE2D(Texture263_g207105) = _MainSmoothnessTex;
				SamplerState Sampler263_g207105 = SS30_g207106;
				half4 Coords263_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition263_g207105 = temp_output_279_0_g207105;
				half3 WorldNormal263_g207105 = temp_output_280_0_g207105;
				half4 localSampleStochastic3D263_g207105 = SampleStochastic3D( Texture263_g207105 , Sampler263_g207105 , Coords263_g207105 , WorldPosition263_g207105 , WorldNormal263_g207105 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch359_g207086 = localSampleExtra275_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch359_g207086 = localSamplePlanar2D238_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch359_g207086 = localSamplePlanar3D246_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch359_g207086 = localSampleStochastic2D234_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch359_g207086 = localSampleStochastic3D263_g207105;
				#else
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#endif
				half4 Local_SmoothnessTex365_g207086 = staticSwitch359_g207086;
				float4 break59_g207115 = Local_SmoothnessTex365_g207086;
				float ifLocalVar58_g207115 = 0;
				if( temp_output_17_0_g207115 == 0.0 )
				ifLocalVar58_g207115 = break59_g207115.x;
				float ifLocalVar60_g207115 = 0;
				if( temp_output_17_0_g207115 == 1.0 )
				ifLocalVar60_g207115 = break59_g207115.y;
				float ifLocalVar61_g207115 = 0;
				if( temp_output_17_0_g207115 == 2.0 )
				ifLocalVar61_g207115 = break59_g207115.z;
				float ifLocalVar62_g207115 = 0;
				if( temp_output_17_0_g207115 == 3.0 )
				ifLocalVar62_g207115 = break59_g207115.w;
				float3 temp_cast_2 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 temp_cast_3 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 linearToGamma404_g207086 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult374_g207086 = lerp( (Local_ShaderTex199_g207086).w , (linearToGamma404_g207086).x , _MainSmoothnessSourceMode);
				float clampResult17_g207119 = clamp( lerpResult374_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207118 = _MainSmoothnessRemap.x;
				float temp_output_9_0_g207118 = ( clampResult17_g207119 - temp_output_7_0_g207118 );
				half Local_Smoothness317_g207086 = ( saturate( ( ( temp_output_9_0_g207118 * _MainSmoothnessRemap.z ) + 0.0001 ) ) * _MainSmoothnessValue );
				float4 appendResult73_g207086 = (float4(Local_Metallic322_g207086 , Local_Occlusion313_g207086 , 0.0 , Local_Smoothness317_g207086));
				half4 Local_Masks109_g207086 = appendResult73_g207086;
				float temp_output_17_0_g207114 = _MainMultiChannelMode;
				TEXTURE2D(Texture276_g207103) = _MainMultiTex;
				float localFilterTexture30_g207104 = ( 0.0 );
				SamplerState SS30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207104 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207104 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207104 = SamplerDefault30_g207104;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207104 = SamplerDefault30_g207104;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207104 = SamplerPoint30_g207104;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207104 = SamplerLow30_g207104;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207104 = SamplerMedium30_g207104;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207104 = SamplerHigh30_g207104;
				#endif
				}
				SamplerState Sampler276_g207103 = SS30_g207104;
				float4 temp_output_37_0_g207103 = Local_Coords180_g207086;
				half4 Coords276_g207103 = temp_output_37_0_g207103;
				half2 TexCoord276_g207103 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207103 = SampleMain( Texture276_g207103 , Sampler276_g207103 , Coords276_g207103 , TexCoord276_g207103 );
				TEXTURE2D(Texture275_g207103) = _MainMultiTex;
				SamplerState Sampler275_g207103 = SS30_g207104;
				half4 Coords275_g207103 = temp_output_37_0_g207103;
				half2 TexCoord275_g207103 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207103 = SampleExtra( Texture275_g207103 , Sampler275_g207103 , Coords275_g207103 , TexCoord275_g207103 );
				TEXTURE2D(Texture238_g207103) = _MainMultiTex;
				SamplerState Sampler238_g207103 = SS30_g207104;
				half4 Coords238_g207103 = temp_output_37_0_g207103;
				float3 temp_output_279_0_g207103 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207103 = temp_output_279_0_g207103;
				half4 localSamplePlanar2D238_g207103 = SamplePlanar2D( Texture238_g207103 , Sampler238_g207103 , Coords238_g207103 , WorldPosition238_g207103 );
				TEXTURE2D(Texture246_g207103) = _MainMultiTex;
				SamplerState Sampler246_g207103 = SS30_g207104;
				half4 Coords246_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition246_g207103 = temp_output_279_0_g207103;
				float3 temp_output_280_0_g207103 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207103 = temp_output_280_0_g207103;
				half4 localSamplePlanar3D246_g207103 = SamplePlanar3D( Texture246_g207103 , Sampler246_g207103 , Coords246_g207103 , WorldPosition246_g207103 , WorldNormal246_g207103 );
				TEXTURE2D(Texture234_g207103) = _MainMultiTex;
				SamplerState Sampler234_g207103 = SS30_g207104;
				float4 Coords234_g207103 = temp_output_37_0_g207103;
				float3 WorldPosition234_g207103 = temp_output_279_0_g207103;
				float4 localSampleStochastic2D234_g207103 = SampleStochastic2D( Texture234_g207103 , Sampler234_g207103 , Coords234_g207103 , WorldPosition234_g207103 );
				TEXTURE2D(Texture263_g207103) = _MainMultiTex;
				SamplerState Sampler263_g207103 = SS30_g207104;
				half4 Coords263_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition263_g207103 = temp_output_279_0_g207103;
				half3 WorldNormal263_g207103 = temp_output_280_0_g207103;
				half4 localSampleStochastic3D263_g207103 = SampleStochastic3D( Texture263_g207103 , Sampler263_g207103 , Coords263_g207103 , WorldPosition263_g207103 , WorldNormal263_g207103 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch351_g207086 = localSampleExtra275_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch351_g207086 = localSamplePlanar2D238_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch351_g207086 = localSamplePlanar3D246_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch351_g207086 = localSampleStochastic2D234_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch351_g207086 = localSampleStochastic3D263_g207103;
				#else
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#endif
				half4 Local_MultiTex357_g207086 = staticSwitch351_g207086;
				float4 break59_g207114 = Local_MultiTex357_g207086;
				float ifLocalVar58_g207114 = 0;
				if( temp_output_17_0_g207114 == 0.0 )
				ifLocalVar58_g207114 = break59_g207114.x;
				float ifLocalVar60_g207114 = 0;
				if( temp_output_17_0_g207114 == 1.0 )
				ifLocalVar60_g207114 = break59_g207114.y;
				float ifLocalVar61_g207114 = 0;
				if( temp_output_17_0_g207114 == 2.0 )
				ifLocalVar61_g207114 = break59_g207114.z;
				float ifLocalVar62_g207114 = 0;
				if( temp_output_17_0_g207114 == 3.0 )
				ifLocalVar62_g207114 = break59_g207114.w;
				float lerpResult378_g207086 = lerp( (Local_Masks109_g207086).z , ( ifLocalVar58_g207114 + ifLocalVar60_g207114 + ifLocalVar61_g207114 + ifLocalVar62_g207114 ) , _MainMultiSourceMode);
				float clampResult17_g207116 = clamp( lerpResult378_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207117 = _MainMultiRemap.x;
				float temp_output_9_0_g207117 = ( clampResult17_g207116 - temp_output_7_0_g207117 );
				half Local_MultiMask78_g207086 = saturate( ( ( temp_output_9_0_g207117 * _MainMultiRemap.z ) + 0.0001 ) );
				float lerpResult58_g207086 = lerp( 1.0 , Local_MultiMask78_g207086 , _MainColorMode);
				float4 lerpResult62_g207086 = lerp( _MainColorTwo , _MainColor , lerpResult58_g207086);
				half3 Local_ColorRGB93_g207086 = (lerpResult62_g207086).rgb;
				half3 Local_Albedo139_g207086 = ( Local_AlbedoRGB107_g207086 * Local_ColorRGB93_g207086 );
				float3 In_Albedo3_g207090 = Local_Albedo139_g207086;
				float3 In_AlbedoRaw3_g207090 = Local_Albedo139_g207086;
				TEXTURE2D(Texture276_g207088) = _MainNormalTex;
				float localFilterTexture29_g207094 = ( 0.0 );
				SamplerState SS29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g207094 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g207094 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g207094 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g207094 = SamplerDefault29_g207094;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g207094 = SamplerDefault29_g207094;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g207094 = SamplerPoint29_g207094;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g207094 = SamplerLow29_g207094;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g207094 = SamplerMedium29_g207094;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g207094 = SamplerHigh29_g207094;
				#endif
				}
				SamplerState Sampler276_g207088 = SS29_g207094;
				float4 temp_output_37_0_g207088 = Local_Coords180_g207086;
				half4 Coords276_g207088 = temp_output_37_0_g207088;
				half2 TexCoord276_g207088 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207088 = SampleMain( Texture276_g207088 , Sampler276_g207088 , Coords276_g207088 , TexCoord276_g207088 );
				TEXTURE2D(Texture275_g207088) = _MainNormalTex;
				SamplerState Sampler275_g207088 = SS29_g207094;
				half4 Coords275_g207088 = temp_output_37_0_g207088;
				half2 TexCoord275_g207088 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207088 = SampleExtra( Texture275_g207088 , Sampler275_g207088 , Coords275_g207088 , TexCoord275_g207088 );
				TEXTURE2D(Texture238_g207088) = _MainNormalTex;
				SamplerState Sampler238_g207088 = SS29_g207094;
				half4 Coords238_g207088 = temp_output_37_0_g207088;
				float3 temp_output_279_0_g207088 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207088 = temp_output_279_0_g207088;
				half4 localSamplePlanar2D238_g207088 = SamplePlanar2D( Texture238_g207088 , Sampler238_g207088 , Coords238_g207088 , WorldPosition238_g207088 );
				TEXTURE2D(Texture246_g207088) = _MainNormalTex;
				SamplerState Sampler246_g207088 = SS29_g207094;
				half4 Coords246_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition246_g207088 = temp_output_279_0_g207088;
				float3 temp_output_280_0_g207088 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207088 = temp_output_280_0_g207088;
				half4 localSamplePlanar3D246_g207088 = SamplePlanar3D( Texture246_g207088 , Sampler246_g207088 , Coords246_g207088 , WorldPosition246_g207088 , WorldNormal246_g207088 );
				TEXTURE2D(Texture234_g207088) = _MainNormalTex;
				SamplerState Sampler234_g207088 = SS29_g207094;
				float4 Coords234_g207088 = temp_output_37_0_g207088;
				float3 WorldPosition234_g207088 = temp_output_279_0_g207088;
				float4 localSampleStochastic2D234_g207088 = SampleStochastic2D( Texture234_g207088 , Sampler234_g207088 , Coords234_g207088 , WorldPosition234_g207088 );
				TEXTURE2D(Texture263_g207088) = _MainNormalTex;
				SamplerState Sampler263_g207088 = SS29_g207094;
				half4 Coords263_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition263_g207088 = temp_output_279_0_g207088;
				half3 WorldNormal263_g207088 = temp_output_280_0_g207088;
				half4 localSampleStochastic3D263_g207088 = SampleStochastic3D( Texture263_g207088 , Sampler263_g207088 , Coords263_g207088 , WorldPosition263_g207088 , WorldNormal263_g207088 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch193_g207086 = localSampleExtra275_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch193_g207086 = localSamplePlanar2D238_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch193_g207086 = localSamplePlanar3D246_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch193_g207086 = localSampleStochastic2D234_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch193_g207086 = localSampleStochastic3D263_g207088;
				#else
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#endif
				half4 Local_NormaTex191_g207086 = staticSwitch193_g207086;
				half4 Normal_Packed45_g207091 = Local_NormaTex191_g207086;
				float2 appendResult58_g207091 = (float2(( (Normal_Packed45_g207091).x * (Normal_Packed45_g207091).w ) , (Normal_Packed45_g207091).y));
				half2 Normal_Default50_g207091 = appendResult58_g207091;
				half2 Normal_ASTC41_g207091 = (Normal_Packed45_g207091).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g207091 = Normal_ASTC41_g207091;
				#else
				float2 staticSwitch38_g207091 = Normal_Default50_g207091;
				#endif
				half2 Normal_NO_DTX544_g207091 = (Normal_Packed45_g207091).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g207091 = Normal_NO_DTX544_g207091;
				#else
				float2 staticSwitch37_g207091 = staticSwitch38_g207091;
				#endif
				float2 temp_output_26_0_g207086 = ( (staticSwitch37_g207091*2.0 + -1.0) * _MainNormalValue );
				float3x3 ase_worldToTangent = float3x3( TangentWS.xyz, BitangentWS, NormalWS );
				half2 Normal_Planar45_g207092 = temp_output_26_0_g207086;
				float2 break71_g207092 = Normal_Planar45_g207092;
				float3 appendResult72_g207092 = (float3(break71_g207092.x , 0.0 , break71_g207092.y));
				float2 temp_output_205_0_g207086 = (mul( ase_worldToTangent, appendResult72_g207092 )).xy;
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#else
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#endif
				half2 Local_NormalTS108_g207086 = staticSwitch204_g207086;
				float2 In_NormalTS3_g207090 = Local_NormalTS108_g207086;
				float3 appendResult68_g207093 = (float3(Local_NormalTS108_g207086 , 1.0));
				float3 tanToWorld0 = float3( TangentWS.xyz.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.xyz.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.xyz.z, BitangentWS.z, NormalWS.z );
				float3 tanNormal74_g207093 = appendResult68_g207093;
				float3 worldNormal74_g207093 = normalize( float3( dot( tanToWorld0, tanNormal74_g207093 ), dot( tanToWorld1, tanNormal74_g207093 ), dot( tanToWorld2, tanNormal74_g207093 ) ) );
				half3 Local_NormalWS250_g207086 = worldNormal74_g207093;
				float3 In_NormalWS3_g207090 = Local_NormalWS250_g207086;
				float4 In_Shader3_g207090 = Local_Masks109_g207086;
				float4 In_Emissive3_g207090 = half4( 1, 1, 1, 1 );
				float3 temp_output_3_0_g207107 = Local_Albedo139_g207086;
				float dotResult20_g207107 = dot( temp_output_3_0_g207107 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale110_g207086 = dotResult20_g207107;
				float In_Grayscale3_g207090 = Local_Grayscale110_g207086;
				float clampResult144_g207086 = clamp( saturate( ( Local_Grayscale110_g207086 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity145_g207086 = clampResult144_g207086;
				float In_Luminosity3_g207090 = Local_Luminosity145_g207086;
				float In_MultiMask3_g207090 = Local_MultiMask78_g207086;
				float temp_output_17_0_g207111 = _MainAlphaChannelMode;
				TEXTURE2D(Texture276_g207098) = _MainAlphaTex;
				float localFilterTexture19_g207099 = ( 0.0 );
				SamplerState SS19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207099 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207099 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207099 = SamplerDefault19_g207099;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207099 = SamplerDefault19_g207099;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207099 = SamplerPoint19_g207099;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207099 = SamplerLow19_g207099;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207099 = SamplerMedium19_g207099;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207099 = SamplerHigh19_g207099;
				#endif
				}
				SamplerState Sampler276_g207098 = SS19_g207099;
				float4 temp_output_37_0_g207098 = Local_Coords180_g207086;
				half4 Coords276_g207098 = temp_output_37_0_g207098;
				half2 TexCoord276_g207098 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207098 = SampleMain( Texture276_g207098 , Sampler276_g207098 , Coords276_g207098 , TexCoord276_g207098 );
				TEXTURE2D(Texture275_g207098) = _MainAlphaTex;
				SamplerState Sampler275_g207098 = SS19_g207099;
				half4 Coords275_g207098 = temp_output_37_0_g207098;
				half2 TexCoord275_g207098 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207098 = SampleExtra( Texture275_g207098 , Sampler275_g207098 , Coords275_g207098 , TexCoord275_g207098 );
				TEXTURE2D(Texture238_g207098) = _MainAlphaTex;
				SamplerState Sampler238_g207098 = SS19_g207099;
				half4 Coords238_g207098 = temp_output_37_0_g207098;
				float3 temp_output_279_0_g207098 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207098 = temp_output_279_0_g207098;
				half4 localSamplePlanar2D238_g207098 = SamplePlanar2D( Texture238_g207098 , Sampler238_g207098 , Coords238_g207098 , WorldPosition238_g207098 );
				TEXTURE2D(Texture246_g207098) = _MainAlphaTex;
				SamplerState Sampler246_g207098 = SS19_g207099;
				half4 Coords246_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition246_g207098 = temp_output_279_0_g207098;
				float3 temp_output_280_0_g207098 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207098 = temp_output_280_0_g207098;
				half4 localSamplePlanar3D246_g207098 = SamplePlanar3D( Texture246_g207098 , Sampler246_g207098 , Coords246_g207098 , WorldPosition246_g207098 , WorldNormal246_g207098 );
				TEXTURE2D(Texture234_g207098) = _MainAlphaTex;
				SamplerState Sampler234_g207098 = SS19_g207099;
				float4 Coords234_g207098 = temp_output_37_0_g207098;
				float3 WorldPosition234_g207098 = temp_output_279_0_g207098;
				float4 localSampleStochastic2D234_g207098 = SampleStochastic2D( Texture234_g207098 , Sampler234_g207098 , Coords234_g207098 , WorldPosition234_g207098 );
				TEXTURE2D(Texture263_g207098) = _MainAlphaTex;
				SamplerState Sampler263_g207098 = SS19_g207099;
				half4 Coords263_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition263_g207098 = temp_output_279_0_g207098;
				half3 WorldNormal263_g207098 = temp_output_280_0_g207098;
				half4 localSampleStochastic3D263_g207098 = SampleStochastic3D( Texture263_g207098 , Sampler263_g207098 , Coords263_g207098 , WorldPosition263_g207098 , WorldNormal263_g207098 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch327_g207086 = localSampleExtra275_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch327_g207086 = localSamplePlanar2D238_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch327_g207086 = localSamplePlanar3D246_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch327_g207086 = localSampleStochastic2D234_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch327_g207086 = localSampleStochastic3D263_g207098;
				#else
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#endif
				half4 Local_AlphaTex330_g207086 = staticSwitch327_g207086;
				float4 break59_g207111 = Local_AlphaTex330_g207086;
				float ifLocalVar58_g207111 = 0;
				if( temp_output_17_0_g207111 == 0.0 )
				ifLocalVar58_g207111 = break59_g207111.x;
				float ifLocalVar60_g207111 = 0;
				if( temp_output_17_0_g207111 == 1.0 )
				ifLocalVar60_g207111 = break59_g207111.y;
				float ifLocalVar61_g207111 = 0;
				if( temp_output_17_0_g207111 == 2.0 )
				ifLocalVar61_g207111 = break59_g207111.z;
				float ifLocalVar62_g207111 = 0;
				if( temp_output_17_0_g207111 == 3.0 )
				ifLocalVar62_g207111 = break59_g207111.w;
				float3 temp_cast_4 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 temp_cast_5 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 linearToGamma402_g207086 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult385_g207086 = lerp( (Local_AlbedoTex185_g207086).w , (linearToGamma402_g207086).x , _MainAlphaSourceMode);
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch236_g207086 = ( lerpResult385_g207086 - _MainAlphaClipValue );
				#else
				float staticSwitch236_g207086 = lerpResult385_g207086;
				#endif
				half Local_AlphaClip111_g207086 = staticSwitch236_g207086;
				float In_AlphaClip3_g207090 = Local_AlphaClip111_g207086;
				half Local_AlphaFade246_g207086 = (lerpResult62_g207086).a;
				float In_AlphaFade3_g207090 = Local_AlphaFade246_g207086;
				float3 temp_cast_6 = (1.0).xxx;
				float3 In_Translucency3_g207090 = temp_cast_6;
				float In_Transmission3_g207090 = 1.0;
				float In_Thickness3_g207090 = 0.0;
				float In_Diffusion3_g207090 = 0.0;
				float In_Depth3_g207090 = 0.0;
				{
				Data3_g207090.Dummy = In_Dummy3_g207090;
				Data3_g207090.Albedo = In_Albedo3_g207090;
				Data3_g207090.AlbedoRaw = In_AlbedoRaw3_g207090;
				Data3_g207090.NormalTS = In_NormalTS3_g207090;
				Data3_g207090.NormalWS = In_NormalWS3_g207090;
				Data3_g207090.Shader = In_Shader3_g207090;
				Data3_g207090.Emissive= In_Emissive3_g207090;
				Data3_g207090.MultiMask = In_MultiMask3_g207090;
				Data3_g207090.Grayscale = In_Grayscale3_g207090;
				Data3_g207090.Luminosity = In_Luminosity3_g207090;
				Data3_g207090.AlphaClip = In_AlphaClip3_g207090;
				Data3_g207090.AlphaFade = In_AlphaFade3_g207090;
				Data3_g207090.Translucency = In_Translucency3_g207090;
				Data3_g207090.Transmission = In_Transmission3_g207090;
				Data3_g207090.Thickness = In_Thickness3_g207090;
				Data3_g207090.Diffusion = In_Diffusion3_g207090;
				Data3_g207090.Depth = In_Depth3_g207090;
				}
				TVEVisualData Data4_g207126 = Data3_g207090;
				float Out_Dummy4_g207126 = 0;
				float3 Out_Albedo4_g207126 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g207126 = float3( 0,0,0 );
				float2 Out_NormalTS4_g207126 = float2( 0,0 );
				float3 Out_NormalWS4_g207126 = float3( 0,0,0 );
				float4 Out_Shader4_g207126 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g207126 = float4( 0,0,0,0 );
				float Out_MultiMask4_g207126 = 0;
				float Out_Grayscale4_g207126 = 0;
				float Out_Luminosity4_g207126 = 0;
				float Out_AlphaClip4_g207126 = 0;
				float Out_AlphaFade4_g207126 = 0;
				float3 Out_Translucency4_g207126 = float3( 0,0,0 );
				float Out_Transmission4_g207126 = 0;
				float Out_Thickness4_g207126 = 0;
				float Out_Diffusion4_g207126 = 0;
				float Out_Depth4_g207126 = 0;
				{
				Out_Dummy4_g207126 = Data4_g207126.Dummy;
				Out_Albedo4_g207126 = Data4_g207126.Albedo;
				Out_AlbedoRaw4_g207126 = Data4_g207126.AlbedoRaw;
				Out_NormalTS4_g207126 = Data4_g207126.NormalTS;
				Out_NormalWS4_g207126 = Data4_g207126.NormalWS;
				Out_Shader4_g207126 = Data4_g207126.Shader;
				Out_Emissive4_g207126= Data4_g207126.Emissive;
				Out_MultiMask4_g207126 = Data4_g207126.MultiMask;
				Out_Grayscale4_g207126 = Data4_g207126.Grayscale;
				Out_Luminosity4_g207126= Data4_g207126.Luminosity;
				Out_AlphaClip4_g207126 = Data4_g207126.AlphaClip;
				Out_AlphaFade4_g207126 = Data4_g207126.AlphaFade;
				Out_Translucency4_g207126 = Data4_g207126.Translucency;
				Out_Transmission4_g207126 = Data4_g207126.Transmission;
				Out_Thickness4_g207126 = Data4_g207126.Thickness;
				Out_Diffusion4_g207126 = Data4_g207126.Diffusion;
				Out_Depth4_g207126= Data4_g207126.Depth;
				}
				float temp_output_3_0_g207131 = Out_AlphaClip4_g207126;
				float Alpha21_g207131 = temp_output_3_0_g207131;
				float temp_output_15_0_g207131 = 0.0;
				float Treshold21_g207131 = temp_output_15_0_g207131;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_CUTOUT) || defined (TVE_GLANCING) || defined (TVE_DITHER)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha21_g207131 - Treshold21_g207131);
				#endif
				#endif
				}
				

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;

				surfaceDescription.Alpha = saturate( ( Alpha21_g207131 * Out_AlphaFade4_g207126 ) );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = input.positionSS.z;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]
			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#define ASE_FRAGMENT_NORMAL 0
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 170004
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
            #pragma multi_compile_fragment _ WRITE_DECAL_BUFFER WRITE_RENDERING_LAYER

			#pragma vertex Vert
			#pragma fragment Frag

            #define SHADERPASS SHADERPASS_DEPTH_ONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _MainOcclusionRemap;
			half4 _MainCoordValue;
			half4 _Color;
			half4 _MainColor;
			half4 _MainMultiRemap;
			half4 _main_coord_value;
			half4 _MainSmoothnessRemap;
			half4 _MainColorTwo;
			half3 _render_normal;
			half _MainMetallicChannelMode;
			half _MainAlbedoValue;
			half _MainSmoothnessInfo;
			half _MainMultiMaskInfo;
			half _MainCoordMode;
			half _MainSampleMode;
			half _MainMetallicSourceMode;
			half _MainMetallicValue;
			half _MainOcclusionSourceMode;
			half _MainEnd;
			half _MainOcclusionValue;
			half _MainSmoothnessChannelMode;
			half _MainSmoothnessSourceMode;
			half _MainSmoothnessValue;
			half _MainMultiChannelMode;
			half _MainMultiSourceMode;
			half _MainColorMode;
			half _MainNormalValue;
			half _MainAlphaChannelMode;
			half _MainAlphaSourceMode;
			half _MainAlphaClipValue;
			half _MainOcclusionChannelMode;
			half _render_src;
			half _MainCategory;
			half _RenderClip;
			half _render_cull;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			half _IsGeneralShader;
			half _RenderZWrite;
			half _IsVersion;
			half _RenderCategory;
			half _RenderEnd;
			half _RenderMode;
			half _RenderCull;
			half _RenderNormal;
			half _RenderBakeGI;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMotion;
			half _Cutoff;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderFilter;
			half _RenderShadow;
			half _IsStandardShader;
			half _RenderSpecular;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_Linear_Repeat);
			SAMPLER(sampler_Linear_Repeat_Aniso8);
			SAMPLER(sampler_Point_Repeat);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MainShaderTex);
			TEXTURE2D(_MainMetallicTex);
			TEXTURE2D(_MainOcclusionTex);
			TEXTURE2D(_MainSmoothnessTex);
			TEXTURE2D(_MainMultiTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_MainAlphaTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local_fragment TVE_FILTER_DEFAULT TVE_FILTER_POINT TVE_FILTER_LOW TVE_FILTER_MEDIUM TVE_FILTER_HIGH
			#pragma shader_feature_local_fragment TVE_MAIN_SAMPLE_MAIN_UV TVE_MAIN_SAMPLE_EXTRA_UV TVE_MAIN_SAMPLE_PLANAR_2D TVE_MAIN_SAMPLE_PLANAR_3D TVE_MAIN_SAMPLE_STOCHASTIC_2D TVE_MAIN_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_vertex TVE_PIVOT_OFF TVE_PIVOT_BAKED TVE_PIVOT_PROC
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			#define TVE_GEOMETRY_SHADER
			//#pragma editor_sync_compilation
			#ifndef ASE_NEEDS_TEXTURE_COORDINATES2 //Needed for ASE 1.9.8.1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			void ComputeWorldCoords( half4 Coords, half3 WorldPosition, out half2 ZX, out half2 ZY, out half2 XY )
			{
				ZX = WorldPosition.xz * Coords.xx - Coords.zz;
				ZY = WorldPosition.yz * Coords.yx - Coords.wz; 
				XY = WorldPosition.xy * Coords.xy - Coords.zw;
			}
			
			half4 SampleMain( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SampleExtra( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			half4 SamplePlanar2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			void ComputeTriplanarWeights( half3 WorldNormal, out half T1, out half T2, out half T3 )
			{
				half3 powNormal = abs( WorldNormal.xyz );
				half3 weights = max( powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal, 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				T1 = weights.y;
				T2 = weights.x;
				T3 = weights.z;
			}
			
			half4 SamplePlanar3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				half4 tex1 = SAMPLE_TEXTURE2D( Texture, Sampler, ZX);
				half4 tex2 = SAMPLE_TEXTURE2D( Texture, Sampler, ZY);
				half4 tex3 = SAMPLE_TEXTURE2D( Texture, Sampler, XY);
				return tex1 * T1 + tex2 * T2 + tex3 * T3;
			}
			
			void ComputeStochasticCoords( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				half2 vertex1, vertex2, vertex3;
				// Scaling of the input
				half2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				half2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				half3 temp = half3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float4 SampleStochastic2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				ComputeStochasticCoords(UV, UV1, UV2, UV3, W1, W2, W3 );
				half4 tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(UV), ddy(UV));
				half4 tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(UV), ddy(UV));
				half4 tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(UV), ddy(UV));
				return tex1 * W1 + tex2 * W2 + tex3 * W3;
			}
			
			half4 SampleStochastic3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				half4 tex1, tex2, tex3;
				ComputeStochasticCoords(ZX, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZX), ddy(ZX));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZX), ddy(ZX));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZX), ddy(ZX));
				half4 texZX = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(ZY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZY), ddy(ZY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZY), ddy(ZY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZY), ddy(ZY));
				half4 texZY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(XY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(XY), ddy(XY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(XY), ddy(XY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(XY), ddy(XY));
				half4 texXY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				return texZX * T1 + texZY * T2 + texXY * T3;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

				#ifdef DECAL_NORMAL_BLENDING
					#ifndef SURFACE_GRADIENT
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
					#if !defined(SHADER_STAGE_RAY_TRACING)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						#ifdef FRAG_INPUTS_USE_TEXCOORD0
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
						#else
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
						#endif
						surfaceData.metallic = 0;
					}
					#endif
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float3 vertexToFrag73_g205214 = ase_positionWS;
				output.ase_texcoord4.xyz = vertexToFrag73_g205214;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205224 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205224 = ( localObjectPosition_UNITY_MATRIX_M14_g205224 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205224 = localObjectPosition_UNITY_MATRIX_M14_g205224;
				#endif
				float3 temp_output_340_7_g205214 = staticSwitch13_g205224;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205226 = ObjectPosition_UNITY_MATRIX_M();
				float3 _Vector0 = float3(0,0,0);
				float3 appendResult60_g205222 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 PositionOS131_g205214 = inputMesh.positionOS;
				float3 break233_g205214 = PositionOS131_g205214;
				float3 appendResult234_g205214 = (float3(break233_g205214.x , 0.0 , break233_g205214.z));
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch229_g205214 = _Vector0;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch229_g205214 = appendResult60_g205222;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch229_g205214 = appendResult234_g205214;
				#else
				float3 staticSwitch229_g205214 = _Vector0;
				#endif
				half3 PivotOS149_g205214 = staticSwitch229_g205214;
				float3 temp_output_122_0_g205226 = PivotOS149_g205214;
				float3 PivotsOnlyWS105_g205226 = mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g205226 , 0.0 ) ).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205226 = ( ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205226 = ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 );
				#endif
				float3 temp_output_341_7_g205214 = staticSwitch13_g205226;
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#else
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#endif
				float3 vertexToFrag76_g205214 = staticSwitch236_g205214;
				output.ase_texcoord5.xyz = vertexToFrag76_g205214;
				
				output.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				output.ase_texcoord3.zw = inputMesh.ase_texcoord2.xy;
				output.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];
				float4 ClipPos = TransformWorldToHClip( PositionRWS );
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float localBreakData4_g207126 = ( 0.0 );
				float localCompData3_g207090 = ( 0.0 );
				TVEVisualData Data3_g207090 = (TVEVisualData)0;
				half4 Dummy130_g207086 = ( _MainCategory + _MainEnd + ( _MainSampleMode + _MainCoordMode + _MainCoordValue ) + _MainMultiMaskInfo + _MainSmoothnessInfo );
				float In_Dummy3_g207090 = Dummy130_g207086.x;
				TEXTURE2D(Texture276_g207087) = _MainAlbedoTex;
				float localFilterTexture19_g207095 = ( 0.0 );
				SamplerState SS19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207095 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207095 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207095 = SamplerDefault19_g207095;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207095 = SamplerDefault19_g207095;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207095 = SamplerPoint19_g207095;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207095 = SamplerLow19_g207095;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207095 = SamplerMedium19_g207095;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207095 = SamplerHigh19_g207095;
				#endif
				}
				SamplerState Sampler276_g207087 = SS19_g207095;
				half4 Local_Coords180_g207086 = _main_coord_value;
				float4 temp_output_37_0_g207087 = Local_Coords180_g207086;
				half4 Coords276_g207087 = temp_output_37_0_g207087;
				half2 TexCoord276_g207087 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207087 = SampleMain( Texture276_g207087 , Sampler276_g207087 , Coords276_g207087 , TexCoord276_g207087 );
				TEXTURE2D(Texture275_g207087) = _MainAlbedoTex;
				SamplerState Sampler275_g207087 = SS19_g207095;
				half4 Coords275_g207087 = temp_output_37_0_g207087;
				half2 TexCoord275_g207087 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207087 = SampleExtra( Texture275_g207087 , Sampler275_g207087 , Coords275_g207087 , TexCoord275_g207087 );
				TEXTURE2D(Texture238_g207087) = _MainAlbedoTex;
				SamplerState Sampler238_g207087 = SS19_g207095;
				half4 Coords238_g207087 = temp_output_37_0_g207087;
				TVEModelData Data16_g205219 = (TVEModelData)0;
				float In_Dummy16_g205219 = 0.0;
				float3 vertexToFrag73_g205214 = packedInput.ase_texcoord4.xyz;
				half3 PositionWS122_g205214 = vertexToFrag73_g205214;
				float3 In_PositionWS16_g205219 = PositionWS122_g205214;
				float3 vertexToFrag76_g205214 = packedInput.ase_texcoord5.xyz;
				half3 PivotWS121_g205214 = vertexToFrag76_g205214;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g205214 = ( PositionWS122_g205214 - PivotWS121_g205214 );
				#else
				float3 staticSwitch204_g205214 = PositionWS122_g205214;
				#endif
				half3 PositionWO132_g205214 = ( staticSwitch204_g205214 - TVE_WorldOrigin );
				float3 In_PositionWO16_g205219 = PositionWO132_g205214;
				float3 In_PivotWS16_g205219 = PivotWS121_g205214;
				half3 PivotWO133_g205214 = ( PivotWS121_g205214 - TVE_WorldOrigin );
				float3 In_PivotWO16_g205219 = PivotWO133_g205214;
				float3 normalizedWorldNormal = normalize( NormalWS );
				half3 Normal_WS95_g205214 = normalizedWorldNormal;
				float3 In_NormalWS16_g205219 = Normal_WS95_g205214;
				float3 normalizeResult296_g205214 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g205214 ) );
				half3 ViewDirWS169_g205214 = normalizeResult296_g205214;
				float3 In_ViewDirWS16_g205219 = ViewDirWS169_g205214;
				half4 VertexMasks171_g205214 = packedInput.ase_color;
				float4 In_VertexData16_g205219 = VertexMasks171_g205214;
				float4 In_BoundsData16_g205219 = float4( 1,1,1,1 );
				{
				Data16_g205219.Dummy = In_Dummy16_g205219;
				Data16_g205219.PositionWS = In_PositionWS16_g205219;
				Data16_g205219.PositionWO = In_PositionWO16_g205219;
				Data16_g205219.PivotWS = In_PivotWS16_g205219;
				Data16_g205219.PivotWO = In_PivotWO16_g205219;
				Data16_g205219.NormalWS = In_NormalWS16_g205219;
				Data16_g205219.ViewDirWS = In_ViewDirWS16_g205219;
				Data16_g205219.VertexData = In_VertexData16_g205219;
				Data16_g205219.BoundsData = In_BoundsData16_g205219;
				}
				TVEModelData Data15_g207089 = Data16_g205219;
				float Out_Dummy15_g207089 = 0;
				float3 Out_PositionWS15_g207089 = float3( 0,0,0 );
				float3 Out_PositionWO15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWS15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWO15_g207089 = float3( 0,0,0 );
				float3 Out_NormalWS15_g207089 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g207089 = float3( 0,0,0 );
				float4 Out_VertexData15_g207089 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g207089 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g207089 = Data15_g207089.Dummy;
				Out_PositionWS15_g207089 = Data15_g207089.PositionWS;
				Out_PositionWO15_g207089 = Data15_g207089.PositionWO;
				Out_PivotWS15_g207089 = Data15_g207089.PivotWS;
				Out_PivotWO15_g207089 = Data15_g207089.PivotWO;
				Out_NormalWS15_g207089 = Data15_g207089.NormalWS;
				Out_ViewDirWS15_g207089 = Data15_g207089.ViewDirWS;
				Out_VertexData15_g207089 = Data15_g207089.VertexData;
				Out_BoundsData15_g207089 = Data15_g207089.BoundsData;
				}
				half3 Model_PositionWO222_g207086 = Out_PositionWO15_g207089;
				float3 temp_output_279_0_g207087 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207087 = temp_output_279_0_g207087;
				half4 localSamplePlanar2D238_g207087 = SamplePlanar2D( Texture238_g207087 , Sampler238_g207087 , Coords238_g207087 , WorldPosition238_g207087 );
				TEXTURE2D(Texture246_g207087) = _MainAlbedoTex;
				SamplerState Sampler246_g207087 = SS19_g207095;
				half4 Coords246_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition246_g207087 = temp_output_279_0_g207087;
				half3 Model_NormalWS226_g207086 = Out_NormalWS15_g207089;
				float3 temp_output_280_0_g207087 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207087 = temp_output_280_0_g207087;
				half4 localSamplePlanar3D246_g207087 = SamplePlanar3D( Texture246_g207087 , Sampler246_g207087 , Coords246_g207087 , WorldPosition246_g207087 , WorldNormal246_g207087 );
				TEXTURE2D(Texture234_g207087) = _MainAlbedoTex;
				SamplerState Sampler234_g207087 = SS19_g207095;
				float4 Coords234_g207087 = temp_output_37_0_g207087;
				float3 WorldPosition234_g207087 = temp_output_279_0_g207087;
				float4 localSampleStochastic2D234_g207087 = SampleStochastic2D( Texture234_g207087 , Sampler234_g207087 , Coords234_g207087 , WorldPosition234_g207087 );
				TEXTURE2D(Texture263_g207087) = _MainAlbedoTex;
				SamplerState Sampler263_g207087 = SS19_g207095;
				half4 Coords263_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition263_g207087 = temp_output_279_0_g207087;
				half3 WorldNormal263_g207087 = temp_output_280_0_g207087;
				half4 localSampleStochastic3D263_g207087 = SampleStochastic3D( Texture263_g207087 , Sampler263_g207087 , Coords263_g207087 , WorldPosition263_g207087 , WorldNormal263_g207087 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch184_g207086 = localSampleExtra275_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch184_g207086 = localSamplePlanar2D238_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch184_g207086 = localSamplePlanar3D246_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch184_g207086 = localSampleStochastic2D234_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch184_g207086 = localSampleStochastic3D263_g207087;
				#else
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#endif
				half4 Local_AlbedoTex185_g207086 = staticSwitch184_g207086;
				float3 lerpResult53_g207086 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex185_g207086).xyz , _MainAlbedoValue);
				half3 Local_AlbedoRGB107_g207086 = lerpResult53_g207086;
				TEXTURE2D(Texture276_g207096) = _MainShaderTex;
				float localFilterTexture30_g207097 = ( 0.0 );
				SamplerState SS30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207097 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207097 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207097 = SamplerDefault30_g207097;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207097 = SamplerDefault30_g207097;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207097 = SamplerPoint30_g207097;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207097 = SamplerLow30_g207097;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207097 = SamplerMedium30_g207097;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207097 = SamplerHigh30_g207097;
				#endif
				}
				SamplerState Sampler276_g207096 = SS30_g207097;
				float4 temp_output_37_0_g207096 = Local_Coords180_g207086;
				half4 Coords276_g207096 = temp_output_37_0_g207096;
				half2 TexCoord276_g207096 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207096 = SampleMain( Texture276_g207096 , Sampler276_g207096 , Coords276_g207096 , TexCoord276_g207096 );
				TEXTURE2D(Texture275_g207096) = _MainShaderTex;
				SamplerState Sampler275_g207096 = SS30_g207097;
				half4 Coords275_g207096 = temp_output_37_0_g207096;
				half2 TexCoord275_g207096 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207096 = SampleExtra( Texture275_g207096 , Sampler275_g207096 , Coords275_g207096 , TexCoord275_g207096 );
				TEXTURE2D(Texture238_g207096) = _MainShaderTex;
				SamplerState Sampler238_g207096 = SS30_g207097;
				half4 Coords238_g207096 = temp_output_37_0_g207096;
				float3 temp_output_279_0_g207096 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207096 = temp_output_279_0_g207096;
				half4 localSamplePlanar2D238_g207096 = SamplePlanar2D( Texture238_g207096 , Sampler238_g207096 , Coords238_g207096 , WorldPosition238_g207096 );
				TEXTURE2D(Texture246_g207096) = _MainShaderTex;
				SamplerState Sampler246_g207096 = SS30_g207097;
				half4 Coords246_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition246_g207096 = temp_output_279_0_g207096;
				float3 temp_output_280_0_g207096 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207096 = temp_output_280_0_g207096;
				half4 localSamplePlanar3D246_g207096 = SamplePlanar3D( Texture246_g207096 , Sampler246_g207096 , Coords246_g207096 , WorldPosition246_g207096 , WorldNormal246_g207096 );
				TEXTURE2D(Texture234_g207096) = _MainShaderTex;
				SamplerState Sampler234_g207096 = SS30_g207097;
				float4 Coords234_g207096 = temp_output_37_0_g207096;
				float3 WorldPosition234_g207096 = temp_output_279_0_g207096;
				float4 localSampleStochastic2D234_g207096 = SampleStochastic2D( Texture234_g207096 , Sampler234_g207096 , Coords234_g207096 , WorldPosition234_g207096 );
				TEXTURE2D(Texture263_g207096) = _MainShaderTex;
				SamplerState Sampler263_g207096 = SS30_g207097;
				half4 Coords263_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition263_g207096 = temp_output_279_0_g207096;
				half3 WorldNormal263_g207096 = temp_output_280_0_g207096;
				half4 localSampleStochastic3D263_g207096 = SampleStochastic3D( Texture263_g207096 , Sampler263_g207096 , Coords263_g207096 , WorldPosition263_g207096 , WorldNormal263_g207096 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch198_g207086 = localSampleExtra275_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch198_g207086 = localSamplePlanar2D238_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch198_g207086 = localSamplePlanar3D246_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch198_g207086 = localSampleStochastic2D234_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch198_g207086 = localSampleStochastic3D263_g207096;
				#else
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#endif
				half4 Local_ShaderTex199_g207086 = staticSwitch198_g207086;
				float temp_output_17_0_g207112 = _MainMetallicChannelMode;
				TEXTURE2D(Texture276_g207100) = _MainMetallicTex;
				float localFilterTexture30_g207101 = ( 0.0 );
				SamplerState SS30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207101 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207101 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207101 = SamplerDefault30_g207101;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207101 = SamplerDefault30_g207101;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207101 = SamplerPoint30_g207101;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207101 = SamplerLow30_g207101;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207101 = SamplerMedium30_g207101;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207101 = SamplerHigh30_g207101;
				#endif
				}
				SamplerState Sampler276_g207100 = SS30_g207101;
				float4 temp_output_37_0_g207100 = Local_Coords180_g207086;
				half4 Coords276_g207100 = temp_output_37_0_g207100;
				half2 TexCoord276_g207100 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207100 = SampleMain( Texture276_g207100 , Sampler276_g207100 , Coords276_g207100 , TexCoord276_g207100 );
				TEXTURE2D(Texture275_g207100) = _MainMetallicTex;
				SamplerState Sampler275_g207100 = SS30_g207101;
				half4 Coords275_g207100 = temp_output_37_0_g207100;
				half2 TexCoord275_g207100 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207100 = SampleExtra( Texture275_g207100 , Sampler275_g207100 , Coords275_g207100 , TexCoord275_g207100 );
				TEXTURE2D(Texture238_g207100) = _MainMetallicTex;
				SamplerState Sampler238_g207100 = SS30_g207101;
				half4 Coords238_g207100 = temp_output_37_0_g207100;
				float3 temp_output_279_0_g207100 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207100 = temp_output_279_0_g207100;
				half4 localSamplePlanar2D238_g207100 = SamplePlanar2D( Texture238_g207100 , Sampler238_g207100 , Coords238_g207100 , WorldPosition238_g207100 );
				TEXTURE2D(Texture246_g207100) = _MainMetallicTex;
				SamplerState Sampler246_g207100 = SS30_g207101;
				half4 Coords246_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition246_g207100 = temp_output_279_0_g207100;
				float3 temp_output_280_0_g207100 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207100 = temp_output_280_0_g207100;
				half4 localSamplePlanar3D246_g207100 = SamplePlanar3D( Texture246_g207100 , Sampler246_g207100 , Coords246_g207100 , WorldPosition246_g207100 , WorldNormal246_g207100 );
				TEXTURE2D(Texture234_g207100) = _MainMetallicTex;
				SamplerState Sampler234_g207100 = SS30_g207101;
				float4 Coords234_g207100 = temp_output_37_0_g207100;
				float3 WorldPosition234_g207100 = temp_output_279_0_g207100;
				float4 localSampleStochastic2D234_g207100 = SampleStochastic2D( Texture234_g207100 , Sampler234_g207100 , Coords234_g207100 , WorldPosition234_g207100 );
				TEXTURE2D(Texture263_g207100) = _MainMetallicTex;
				SamplerState Sampler263_g207100 = SS30_g207101;
				half4 Coords263_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition263_g207100 = temp_output_279_0_g207100;
				half3 WorldNormal263_g207100 = temp_output_280_0_g207100;
				half4 localSampleStochastic3D263_g207100 = SampleStochastic3D( Texture263_g207100 , Sampler263_g207100 , Coords263_g207100 , WorldPosition263_g207100 , WorldNormal263_g207100 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch335_g207086 = localSampleExtra275_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch335_g207086 = localSamplePlanar2D238_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch335_g207086 = localSamplePlanar3D246_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch335_g207086 = localSampleStochastic2D234_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch335_g207086 = localSampleStochastic3D263_g207100;
				#else
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#endif
				half4 Local_MetallicTex341_g207086 = staticSwitch335_g207086;
				float4 break59_g207112 = Local_MetallicTex341_g207086;
				float ifLocalVar58_g207112 = 0;
				if( temp_output_17_0_g207112 == 0.0 )
				ifLocalVar58_g207112 = break59_g207112.x;
				float ifLocalVar60_g207112 = 0;
				if( temp_output_17_0_g207112 == 1.0 )
				ifLocalVar60_g207112 = break59_g207112.y;
				float ifLocalVar61_g207112 = 0;
				if( temp_output_17_0_g207112 == 2.0 )
				ifLocalVar61_g207112 = break59_g207112.z;
				float ifLocalVar62_g207112 = 0;
				if( temp_output_17_0_g207112 == 3.0 )
				ifLocalVar62_g207112 = break59_g207112.w;
				float lerpResult366_g207086 = lerp( (Local_ShaderTex199_g207086).x , ( ifLocalVar58_g207112 + ifLocalVar60_g207112 + ifLocalVar61_g207112 + ifLocalVar62_g207112 ) , _MainMetallicSourceMode);
				half Local_Metallic322_g207086 = ( lerpResult366_g207086 * _MainMetallicValue );
				float temp_output_17_0_g207113 = _MainOcclusionChannelMode;
				TEXTURE2D(Texture276_g207102) = _MainOcclusionTex;
				float localFilterTexture30_g207108 = ( 0.0 );
				SamplerState SS30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207108 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207108 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207108 = SamplerDefault30_g207108;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207108 = SamplerDefault30_g207108;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207108 = SamplerPoint30_g207108;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207108 = SamplerLow30_g207108;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207108 = SamplerMedium30_g207108;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207108 = SamplerHigh30_g207108;
				#endif
				}
				SamplerState Sampler276_g207102 = SS30_g207108;
				float4 temp_output_37_0_g207102 = Local_Coords180_g207086;
				half4 Coords276_g207102 = temp_output_37_0_g207102;
				half2 TexCoord276_g207102 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207102 = SampleMain( Texture276_g207102 , Sampler276_g207102 , Coords276_g207102 , TexCoord276_g207102 );
				TEXTURE2D(Texture275_g207102) = _MainOcclusionTex;
				SamplerState Sampler275_g207102 = SS30_g207108;
				half4 Coords275_g207102 = temp_output_37_0_g207102;
				half2 TexCoord275_g207102 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207102 = SampleExtra( Texture275_g207102 , Sampler275_g207102 , Coords275_g207102 , TexCoord275_g207102 );
				TEXTURE2D(Texture238_g207102) = _MainOcclusionTex;
				SamplerState Sampler238_g207102 = SS30_g207108;
				half4 Coords238_g207102 = temp_output_37_0_g207102;
				float3 temp_output_279_0_g207102 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207102 = temp_output_279_0_g207102;
				half4 localSamplePlanar2D238_g207102 = SamplePlanar2D( Texture238_g207102 , Sampler238_g207102 , Coords238_g207102 , WorldPosition238_g207102 );
				TEXTURE2D(Texture246_g207102) = _MainOcclusionTex;
				SamplerState Sampler246_g207102 = SS30_g207108;
				half4 Coords246_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition246_g207102 = temp_output_279_0_g207102;
				float3 temp_output_280_0_g207102 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207102 = temp_output_280_0_g207102;
				half4 localSamplePlanar3D246_g207102 = SamplePlanar3D( Texture246_g207102 , Sampler246_g207102 , Coords246_g207102 , WorldPosition246_g207102 , WorldNormal246_g207102 );
				TEXTURE2D(Texture234_g207102) = _MainOcclusionTex;
				SamplerState Sampler234_g207102 = SS30_g207108;
				float4 Coords234_g207102 = temp_output_37_0_g207102;
				float3 WorldPosition234_g207102 = temp_output_279_0_g207102;
				float4 localSampleStochastic2D234_g207102 = SampleStochastic2D( Texture234_g207102 , Sampler234_g207102 , Coords234_g207102 , WorldPosition234_g207102 );
				TEXTURE2D(Texture263_g207102) = _MainOcclusionTex;
				SamplerState Sampler263_g207102 = SS30_g207108;
				half4 Coords263_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition263_g207102 = temp_output_279_0_g207102;
				half3 WorldNormal263_g207102 = temp_output_280_0_g207102;
				half4 localSampleStochastic3D263_g207102 = SampleStochastic3D( Texture263_g207102 , Sampler263_g207102 , Coords263_g207102 , WorldPosition263_g207102 , WorldNormal263_g207102 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch343_g207086 = localSampleExtra275_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch343_g207086 = localSamplePlanar2D238_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch343_g207086 = localSamplePlanar3D246_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch343_g207086 = localSampleStochastic2D234_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch343_g207086 = localSampleStochastic3D263_g207102;
				#else
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#endif
				half4 Local_OcclusionTex349_g207086 = staticSwitch343_g207086;
				float4 break59_g207113 = Local_OcclusionTex349_g207086;
				float ifLocalVar58_g207113 = 0;
				if( temp_output_17_0_g207113 == 0.0 )
				ifLocalVar58_g207113 = break59_g207113.x;
				float ifLocalVar60_g207113 = 0;
				if( temp_output_17_0_g207113 == 1.0 )
				ifLocalVar60_g207113 = break59_g207113.y;
				float ifLocalVar61_g207113 = 0;
				if( temp_output_17_0_g207113 == 2.0 )
				ifLocalVar61_g207113 = break59_g207113.z;
				float ifLocalVar62_g207113 = 0;
				if( temp_output_17_0_g207113 == 3.0 )
				ifLocalVar62_g207113 = break59_g207113.w;
				float lerpResult373_g207086 = lerp( (Local_ShaderTex199_g207086).y , ( ifLocalVar58_g207113 + ifLocalVar60_g207113 + ifLocalVar61_g207113 + ifLocalVar62_g207113 ) , _MainOcclusionSourceMode);
				float clampResult17_g207110 = clamp( lerpResult373_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207109 = _MainOcclusionRemap.x;
				float temp_output_9_0_g207109 = ( clampResult17_g207110 - temp_output_7_0_g207109 );
				float lerpResult23_g207086 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g207109 * _MainOcclusionRemap.z ) + 0.0001 ) ) , _MainOcclusionValue);
				half Local_Occlusion313_g207086 = lerpResult23_g207086;
				float temp_output_17_0_g207115 = _MainSmoothnessChannelMode;
				TEXTURE2D(Texture276_g207105) = _MainSmoothnessTex;
				float localFilterTexture30_g207106 = ( 0.0 );
				SamplerState SS30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207106 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207106 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207106 = SamplerDefault30_g207106;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207106 = SamplerDefault30_g207106;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207106 = SamplerPoint30_g207106;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207106 = SamplerLow30_g207106;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207106 = SamplerMedium30_g207106;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207106 = SamplerHigh30_g207106;
				#endif
				}
				SamplerState Sampler276_g207105 = SS30_g207106;
				float4 temp_output_37_0_g207105 = Local_Coords180_g207086;
				half4 Coords276_g207105 = temp_output_37_0_g207105;
				half2 TexCoord276_g207105 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207105 = SampleMain( Texture276_g207105 , Sampler276_g207105 , Coords276_g207105 , TexCoord276_g207105 );
				TEXTURE2D(Texture275_g207105) = _MainSmoothnessTex;
				SamplerState Sampler275_g207105 = SS30_g207106;
				half4 Coords275_g207105 = temp_output_37_0_g207105;
				half2 TexCoord275_g207105 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207105 = SampleExtra( Texture275_g207105 , Sampler275_g207105 , Coords275_g207105 , TexCoord275_g207105 );
				TEXTURE2D(Texture238_g207105) = _MainSmoothnessTex;
				SamplerState Sampler238_g207105 = SS30_g207106;
				half4 Coords238_g207105 = temp_output_37_0_g207105;
				float3 temp_output_279_0_g207105 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207105 = temp_output_279_0_g207105;
				half4 localSamplePlanar2D238_g207105 = SamplePlanar2D( Texture238_g207105 , Sampler238_g207105 , Coords238_g207105 , WorldPosition238_g207105 );
				TEXTURE2D(Texture246_g207105) = _MainSmoothnessTex;
				SamplerState Sampler246_g207105 = SS30_g207106;
				half4 Coords246_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition246_g207105 = temp_output_279_0_g207105;
				float3 temp_output_280_0_g207105 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207105 = temp_output_280_0_g207105;
				half4 localSamplePlanar3D246_g207105 = SamplePlanar3D( Texture246_g207105 , Sampler246_g207105 , Coords246_g207105 , WorldPosition246_g207105 , WorldNormal246_g207105 );
				TEXTURE2D(Texture234_g207105) = _MainSmoothnessTex;
				SamplerState Sampler234_g207105 = SS30_g207106;
				float4 Coords234_g207105 = temp_output_37_0_g207105;
				float3 WorldPosition234_g207105 = temp_output_279_0_g207105;
				float4 localSampleStochastic2D234_g207105 = SampleStochastic2D( Texture234_g207105 , Sampler234_g207105 , Coords234_g207105 , WorldPosition234_g207105 );
				TEXTURE2D(Texture263_g207105) = _MainSmoothnessTex;
				SamplerState Sampler263_g207105 = SS30_g207106;
				half4 Coords263_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition263_g207105 = temp_output_279_0_g207105;
				half3 WorldNormal263_g207105 = temp_output_280_0_g207105;
				half4 localSampleStochastic3D263_g207105 = SampleStochastic3D( Texture263_g207105 , Sampler263_g207105 , Coords263_g207105 , WorldPosition263_g207105 , WorldNormal263_g207105 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch359_g207086 = localSampleExtra275_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch359_g207086 = localSamplePlanar2D238_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch359_g207086 = localSamplePlanar3D246_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch359_g207086 = localSampleStochastic2D234_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch359_g207086 = localSampleStochastic3D263_g207105;
				#else
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#endif
				half4 Local_SmoothnessTex365_g207086 = staticSwitch359_g207086;
				float4 break59_g207115 = Local_SmoothnessTex365_g207086;
				float ifLocalVar58_g207115 = 0;
				if( temp_output_17_0_g207115 == 0.0 )
				ifLocalVar58_g207115 = break59_g207115.x;
				float ifLocalVar60_g207115 = 0;
				if( temp_output_17_0_g207115 == 1.0 )
				ifLocalVar60_g207115 = break59_g207115.y;
				float ifLocalVar61_g207115 = 0;
				if( temp_output_17_0_g207115 == 2.0 )
				ifLocalVar61_g207115 = break59_g207115.z;
				float ifLocalVar62_g207115 = 0;
				if( temp_output_17_0_g207115 == 3.0 )
				ifLocalVar62_g207115 = break59_g207115.w;
				float3 temp_cast_2 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 temp_cast_3 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 linearToGamma404_g207086 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult374_g207086 = lerp( (Local_ShaderTex199_g207086).w , (linearToGamma404_g207086).x , _MainSmoothnessSourceMode);
				float clampResult17_g207119 = clamp( lerpResult374_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207118 = _MainSmoothnessRemap.x;
				float temp_output_9_0_g207118 = ( clampResult17_g207119 - temp_output_7_0_g207118 );
				half Local_Smoothness317_g207086 = ( saturate( ( ( temp_output_9_0_g207118 * _MainSmoothnessRemap.z ) + 0.0001 ) ) * _MainSmoothnessValue );
				float4 appendResult73_g207086 = (float4(Local_Metallic322_g207086 , Local_Occlusion313_g207086 , 0.0 , Local_Smoothness317_g207086));
				half4 Local_Masks109_g207086 = appendResult73_g207086;
				float temp_output_17_0_g207114 = _MainMultiChannelMode;
				TEXTURE2D(Texture276_g207103) = _MainMultiTex;
				float localFilterTexture30_g207104 = ( 0.0 );
				SamplerState SS30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207104 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207104 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207104 = SamplerDefault30_g207104;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207104 = SamplerDefault30_g207104;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207104 = SamplerPoint30_g207104;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207104 = SamplerLow30_g207104;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207104 = SamplerMedium30_g207104;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207104 = SamplerHigh30_g207104;
				#endif
				}
				SamplerState Sampler276_g207103 = SS30_g207104;
				float4 temp_output_37_0_g207103 = Local_Coords180_g207086;
				half4 Coords276_g207103 = temp_output_37_0_g207103;
				half2 TexCoord276_g207103 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207103 = SampleMain( Texture276_g207103 , Sampler276_g207103 , Coords276_g207103 , TexCoord276_g207103 );
				TEXTURE2D(Texture275_g207103) = _MainMultiTex;
				SamplerState Sampler275_g207103 = SS30_g207104;
				half4 Coords275_g207103 = temp_output_37_0_g207103;
				half2 TexCoord275_g207103 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207103 = SampleExtra( Texture275_g207103 , Sampler275_g207103 , Coords275_g207103 , TexCoord275_g207103 );
				TEXTURE2D(Texture238_g207103) = _MainMultiTex;
				SamplerState Sampler238_g207103 = SS30_g207104;
				half4 Coords238_g207103 = temp_output_37_0_g207103;
				float3 temp_output_279_0_g207103 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207103 = temp_output_279_0_g207103;
				half4 localSamplePlanar2D238_g207103 = SamplePlanar2D( Texture238_g207103 , Sampler238_g207103 , Coords238_g207103 , WorldPosition238_g207103 );
				TEXTURE2D(Texture246_g207103) = _MainMultiTex;
				SamplerState Sampler246_g207103 = SS30_g207104;
				half4 Coords246_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition246_g207103 = temp_output_279_0_g207103;
				float3 temp_output_280_0_g207103 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207103 = temp_output_280_0_g207103;
				half4 localSamplePlanar3D246_g207103 = SamplePlanar3D( Texture246_g207103 , Sampler246_g207103 , Coords246_g207103 , WorldPosition246_g207103 , WorldNormal246_g207103 );
				TEXTURE2D(Texture234_g207103) = _MainMultiTex;
				SamplerState Sampler234_g207103 = SS30_g207104;
				float4 Coords234_g207103 = temp_output_37_0_g207103;
				float3 WorldPosition234_g207103 = temp_output_279_0_g207103;
				float4 localSampleStochastic2D234_g207103 = SampleStochastic2D( Texture234_g207103 , Sampler234_g207103 , Coords234_g207103 , WorldPosition234_g207103 );
				TEXTURE2D(Texture263_g207103) = _MainMultiTex;
				SamplerState Sampler263_g207103 = SS30_g207104;
				half4 Coords263_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition263_g207103 = temp_output_279_0_g207103;
				half3 WorldNormal263_g207103 = temp_output_280_0_g207103;
				half4 localSampleStochastic3D263_g207103 = SampleStochastic3D( Texture263_g207103 , Sampler263_g207103 , Coords263_g207103 , WorldPosition263_g207103 , WorldNormal263_g207103 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch351_g207086 = localSampleExtra275_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch351_g207086 = localSamplePlanar2D238_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch351_g207086 = localSamplePlanar3D246_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch351_g207086 = localSampleStochastic2D234_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch351_g207086 = localSampleStochastic3D263_g207103;
				#else
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#endif
				half4 Local_MultiTex357_g207086 = staticSwitch351_g207086;
				float4 break59_g207114 = Local_MultiTex357_g207086;
				float ifLocalVar58_g207114 = 0;
				if( temp_output_17_0_g207114 == 0.0 )
				ifLocalVar58_g207114 = break59_g207114.x;
				float ifLocalVar60_g207114 = 0;
				if( temp_output_17_0_g207114 == 1.0 )
				ifLocalVar60_g207114 = break59_g207114.y;
				float ifLocalVar61_g207114 = 0;
				if( temp_output_17_0_g207114 == 2.0 )
				ifLocalVar61_g207114 = break59_g207114.z;
				float ifLocalVar62_g207114 = 0;
				if( temp_output_17_0_g207114 == 3.0 )
				ifLocalVar62_g207114 = break59_g207114.w;
				float lerpResult378_g207086 = lerp( (Local_Masks109_g207086).z , ( ifLocalVar58_g207114 + ifLocalVar60_g207114 + ifLocalVar61_g207114 + ifLocalVar62_g207114 ) , _MainMultiSourceMode);
				float clampResult17_g207116 = clamp( lerpResult378_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207117 = _MainMultiRemap.x;
				float temp_output_9_0_g207117 = ( clampResult17_g207116 - temp_output_7_0_g207117 );
				half Local_MultiMask78_g207086 = saturate( ( ( temp_output_9_0_g207117 * _MainMultiRemap.z ) + 0.0001 ) );
				float lerpResult58_g207086 = lerp( 1.0 , Local_MultiMask78_g207086 , _MainColorMode);
				float4 lerpResult62_g207086 = lerp( _MainColorTwo , _MainColor , lerpResult58_g207086);
				half3 Local_ColorRGB93_g207086 = (lerpResult62_g207086).rgb;
				half3 Local_Albedo139_g207086 = ( Local_AlbedoRGB107_g207086 * Local_ColorRGB93_g207086 );
				float3 In_Albedo3_g207090 = Local_Albedo139_g207086;
				float3 In_AlbedoRaw3_g207090 = Local_Albedo139_g207086;
				TEXTURE2D(Texture276_g207088) = _MainNormalTex;
				float localFilterTexture29_g207094 = ( 0.0 );
				SamplerState SS29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g207094 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g207094 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g207094 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g207094 = SamplerDefault29_g207094;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g207094 = SamplerDefault29_g207094;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g207094 = SamplerPoint29_g207094;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g207094 = SamplerLow29_g207094;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g207094 = SamplerMedium29_g207094;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g207094 = SamplerHigh29_g207094;
				#endif
				}
				SamplerState Sampler276_g207088 = SS29_g207094;
				float4 temp_output_37_0_g207088 = Local_Coords180_g207086;
				half4 Coords276_g207088 = temp_output_37_0_g207088;
				half2 TexCoord276_g207088 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207088 = SampleMain( Texture276_g207088 , Sampler276_g207088 , Coords276_g207088 , TexCoord276_g207088 );
				TEXTURE2D(Texture275_g207088) = _MainNormalTex;
				SamplerState Sampler275_g207088 = SS29_g207094;
				half4 Coords275_g207088 = temp_output_37_0_g207088;
				half2 TexCoord275_g207088 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207088 = SampleExtra( Texture275_g207088 , Sampler275_g207088 , Coords275_g207088 , TexCoord275_g207088 );
				TEXTURE2D(Texture238_g207088) = _MainNormalTex;
				SamplerState Sampler238_g207088 = SS29_g207094;
				half4 Coords238_g207088 = temp_output_37_0_g207088;
				float3 temp_output_279_0_g207088 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207088 = temp_output_279_0_g207088;
				half4 localSamplePlanar2D238_g207088 = SamplePlanar2D( Texture238_g207088 , Sampler238_g207088 , Coords238_g207088 , WorldPosition238_g207088 );
				TEXTURE2D(Texture246_g207088) = _MainNormalTex;
				SamplerState Sampler246_g207088 = SS29_g207094;
				half4 Coords246_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition246_g207088 = temp_output_279_0_g207088;
				float3 temp_output_280_0_g207088 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207088 = temp_output_280_0_g207088;
				half4 localSamplePlanar3D246_g207088 = SamplePlanar3D( Texture246_g207088 , Sampler246_g207088 , Coords246_g207088 , WorldPosition246_g207088 , WorldNormal246_g207088 );
				TEXTURE2D(Texture234_g207088) = _MainNormalTex;
				SamplerState Sampler234_g207088 = SS29_g207094;
				float4 Coords234_g207088 = temp_output_37_0_g207088;
				float3 WorldPosition234_g207088 = temp_output_279_0_g207088;
				float4 localSampleStochastic2D234_g207088 = SampleStochastic2D( Texture234_g207088 , Sampler234_g207088 , Coords234_g207088 , WorldPosition234_g207088 );
				TEXTURE2D(Texture263_g207088) = _MainNormalTex;
				SamplerState Sampler263_g207088 = SS29_g207094;
				half4 Coords263_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition263_g207088 = temp_output_279_0_g207088;
				half3 WorldNormal263_g207088 = temp_output_280_0_g207088;
				half4 localSampleStochastic3D263_g207088 = SampleStochastic3D( Texture263_g207088 , Sampler263_g207088 , Coords263_g207088 , WorldPosition263_g207088 , WorldNormal263_g207088 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch193_g207086 = localSampleExtra275_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch193_g207086 = localSamplePlanar2D238_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch193_g207086 = localSamplePlanar3D246_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch193_g207086 = localSampleStochastic2D234_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch193_g207086 = localSampleStochastic3D263_g207088;
				#else
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#endif
				half4 Local_NormaTex191_g207086 = staticSwitch193_g207086;
				half4 Normal_Packed45_g207091 = Local_NormaTex191_g207086;
				float2 appendResult58_g207091 = (float2(( (Normal_Packed45_g207091).x * (Normal_Packed45_g207091).w ) , (Normal_Packed45_g207091).y));
				half2 Normal_Default50_g207091 = appendResult58_g207091;
				half2 Normal_ASTC41_g207091 = (Normal_Packed45_g207091).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g207091 = Normal_ASTC41_g207091;
				#else
				float2 staticSwitch38_g207091 = Normal_Default50_g207091;
				#endif
				half2 Normal_NO_DTX544_g207091 = (Normal_Packed45_g207091).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g207091 = Normal_NO_DTX544_g207091;
				#else
				float2 staticSwitch37_g207091 = staticSwitch38_g207091;
				#endif
				float2 temp_output_26_0_g207086 = ( (staticSwitch37_g207091*2.0 + -1.0) * _MainNormalValue );
				float3x3 ase_worldToTangent = float3x3( TangentWS.xyz, BitangentWS, NormalWS );
				half2 Normal_Planar45_g207092 = temp_output_26_0_g207086;
				float2 break71_g207092 = Normal_Planar45_g207092;
				float3 appendResult72_g207092 = (float3(break71_g207092.x , 0.0 , break71_g207092.y));
				float2 temp_output_205_0_g207086 = (mul( ase_worldToTangent, appendResult72_g207092 )).xy;
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#else
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#endif
				half2 Local_NormalTS108_g207086 = staticSwitch204_g207086;
				float2 In_NormalTS3_g207090 = Local_NormalTS108_g207086;
				float3 appendResult68_g207093 = (float3(Local_NormalTS108_g207086 , 1.0));
				float3 tanToWorld0 = float3( TangentWS.xyz.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.xyz.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.xyz.z, BitangentWS.z, NormalWS.z );
				float3 tanNormal74_g207093 = appendResult68_g207093;
				float3 worldNormal74_g207093 = normalize( float3( dot( tanToWorld0, tanNormal74_g207093 ), dot( tanToWorld1, tanNormal74_g207093 ), dot( tanToWorld2, tanNormal74_g207093 ) ) );
				half3 Local_NormalWS250_g207086 = worldNormal74_g207093;
				float3 In_NormalWS3_g207090 = Local_NormalWS250_g207086;
				float4 In_Shader3_g207090 = Local_Masks109_g207086;
				float4 In_Emissive3_g207090 = half4( 1, 1, 1, 1 );
				float3 temp_output_3_0_g207107 = Local_Albedo139_g207086;
				float dotResult20_g207107 = dot( temp_output_3_0_g207107 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale110_g207086 = dotResult20_g207107;
				float In_Grayscale3_g207090 = Local_Grayscale110_g207086;
				float clampResult144_g207086 = clamp( saturate( ( Local_Grayscale110_g207086 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity145_g207086 = clampResult144_g207086;
				float In_Luminosity3_g207090 = Local_Luminosity145_g207086;
				float In_MultiMask3_g207090 = Local_MultiMask78_g207086;
				float temp_output_17_0_g207111 = _MainAlphaChannelMode;
				TEXTURE2D(Texture276_g207098) = _MainAlphaTex;
				float localFilterTexture19_g207099 = ( 0.0 );
				SamplerState SS19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207099 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207099 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207099 = SamplerDefault19_g207099;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207099 = SamplerDefault19_g207099;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207099 = SamplerPoint19_g207099;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207099 = SamplerLow19_g207099;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207099 = SamplerMedium19_g207099;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207099 = SamplerHigh19_g207099;
				#endif
				}
				SamplerState Sampler276_g207098 = SS19_g207099;
				float4 temp_output_37_0_g207098 = Local_Coords180_g207086;
				half4 Coords276_g207098 = temp_output_37_0_g207098;
				half2 TexCoord276_g207098 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207098 = SampleMain( Texture276_g207098 , Sampler276_g207098 , Coords276_g207098 , TexCoord276_g207098 );
				TEXTURE2D(Texture275_g207098) = _MainAlphaTex;
				SamplerState Sampler275_g207098 = SS19_g207099;
				half4 Coords275_g207098 = temp_output_37_0_g207098;
				half2 TexCoord275_g207098 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207098 = SampleExtra( Texture275_g207098 , Sampler275_g207098 , Coords275_g207098 , TexCoord275_g207098 );
				TEXTURE2D(Texture238_g207098) = _MainAlphaTex;
				SamplerState Sampler238_g207098 = SS19_g207099;
				half4 Coords238_g207098 = temp_output_37_0_g207098;
				float3 temp_output_279_0_g207098 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207098 = temp_output_279_0_g207098;
				half4 localSamplePlanar2D238_g207098 = SamplePlanar2D( Texture238_g207098 , Sampler238_g207098 , Coords238_g207098 , WorldPosition238_g207098 );
				TEXTURE2D(Texture246_g207098) = _MainAlphaTex;
				SamplerState Sampler246_g207098 = SS19_g207099;
				half4 Coords246_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition246_g207098 = temp_output_279_0_g207098;
				float3 temp_output_280_0_g207098 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207098 = temp_output_280_0_g207098;
				half4 localSamplePlanar3D246_g207098 = SamplePlanar3D( Texture246_g207098 , Sampler246_g207098 , Coords246_g207098 , WorldPosition246_g207098 , WorldNormal246_g207098 );
				TEXTURE2D(Texture234_g207098) = _MainAlphaTex;
				SamplerState Sampler234_g207098 = SS19_g207099;
				float4 Coords234_g207098 = temp_output_37_0_g207098;
				float3 WorldPosition234_g207098 = temp_output_279_0_g207098;
				float4 localSampleStochastic2D234_g207098 = SampleStochastic2D( Texture234_g207098 , Sampler234_g207098 , Coords234_g207098 , WorldPosition234_g207098 );
				TEXTURE2D(Texture263_g207098) = _MainAlphaTex;
				SamplerState Sampler263_g207098 = SS19_g207099;
				half4 Coords263_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition263_g207098 = temp_output_279_0_g207098;
				half3 WorldNormal263_g207098 = temp_output_280_0_g207098;
				half4 localSampleStochastic3D263_g207098 = SampleStochastic3D( Texture263_g207098 , Sampler263_g207098 , Coords263_g207098 , WorldPosition263_g207098 , WorldNormal263_g207098 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch327_g207086 = localSampleExtra275_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch327_g207086 = localSamplePlanar2D238_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch327_g207086 = localSamplePlanar3D246_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch327_g207086 = localSampleStochastic2D234_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch327_g207086 = localSampleStochastic3D263_g207098;
				#else
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#endif
				half4 Local_AlphaTex330_g207086 = staticSwitch327_g207086;
				float4 break59_g207111 = Local_AlphaTex330_g207086;
				float ifLocalVar58_g207111 = 0;
				if( temp_output_17_0_g207111 == 0.0 )
				ifLocalVar58_g207111 = break59_g207111.x;
				float ifLocalVar60_g207111 = 0;
				if( temp_output_17_0_g207111 == 1.0 )
				ifLocalVar60_g207111 = break59_g207111.y;
				float ifLocalVar61_g207111 = 0;
				if( temp_output_17_0_g207111 == 2.0 )
				ifLocalVar61_g207111 = break59_g207111.z;
				float ifLocalVar62_g207111 = 0;
				if( temp_output_17_0_g207111 == 3.0 )
				ifLocalVar62_g207111 = break59_g207111.w;
				float3 temp_cast_4 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 temp_cast_5 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 linearToGamma402_g207086 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult385_g207086 = lerp( (Local_AlbedoTex185_g207086).w , (linearToGamma402_g207086).x , _MainAlphaSourceMode);
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch236_g207086 = ( lerpResult385_g207086 - _MainAlphaClipValue );
				#else
				float staticSwitch236_g207086 = lerpResult385_g207086;
				#endif
				half Local_AlphaClip111_g207086 = staticSwitch236_g207086;
				float In_AlphaClip3_g207090 = Local_AlphaClip111_g207086;
				half Local_AlphaFade246_g207086 = (lerpResult62_g207086).a;
				float In_AlphaFade3_g207090 = Local_AlphaFade246_g207086;
				float3 temp_cast_6 = (1.0).xxx;
				float3 In_Translucency3_g207090 = temp_cast_6;
				float In_Transmission3_g207090 = 1.0;
				float In_Thickness3_g207090 = 0.0;
				float In_Diffusion3_g207090 = 0.0;
				float In_Depth3_g207090 = 0.0;
				{
				Data3_g207090.Dummy = In_Dummy3_g207090;
				Data3_g207090.Albedo = In_Albedo3_g207090;
				Data3_g207090.AlbedoRaw = In_AlbedoRaw3_g207090;
				Data3_g207090.NormalTS = In_NormalTS3_g207090;
				Data3_g207090.NormalWS = In_NormalWS3_g207090;
				Data3_g207090.Shader = In_Shader3_g207090;
				Data3_g207090.Emissive= In_Emissive3_g207090;
				Data3_g207090.MultiMask = In_MultiMask3_g207090;
				Data3_g207090.Grayscale = In_Grayscale3_g207090;
				Data3_g207090.Luminosity = In_Luminosity3_g207090;
				Data3_g207090.AlphaClip = In_AlphaClip3_g207090;
				Data3_g207090.AlphaFade = In_AlphaFade3_g207090;
				Data3_g207090.Translucency = In_Translucency3_g207090;
				Data3_g207090.Transmission = In_Transmission3_g207090;
				Data3_g207090.Thickness = In_Thickness3_g207090;
				Data3_g207090.Diffusion = In_Diffusion3_g207090;
				Data3_g207090.Depth = In_Depth3_g207090;
				}
				TVEVisualData Data4_g207126 = Data3_g207090;
				float Out_Dummy4_g207126 = 0;
				float3 Out_Albedo4_g207126 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g207126 = float3( 0,0,0 );
				float2 Out_NormalTS4_g207126 = float2( 0,0 );
				float3 Out_NormalWS4_g207126 = float3( 0,0,0 );
				float4 Out_Shader4_g207126 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g207126 = float4( 0,0,0,0 );
				float Out_MultiMask4_g207126 = 0;
				float Out_Grayscale4_g207126 = 0;
				float Out_Luminosity4_g207126 = 0;
				float Out_AlphaClip4_g207126 = 0;
				float Out_AlphaFade4_g207126 = 0;
				float3 Out_Translucency4_g207126 = float3( 0,0,0 );
				float Out_Transmission4_g207126 = 0;
				float Out_Thickness4_g207126 = 0;
				float Out_Diffusion4_g207126 = 0;
				float Out_Depth4_g207126 = 0;
				{
				Out_Dummy4_g207126 = Data4_g207126.Dummy;
				Out_Albedo4_g207126 = Data4_g207126.Albedo;
				Out_AlbedoRaw4_g207126 = Data4_g207126.AlbedoRaw;
				Out_NormalTS4_g207126 = Data4_g207126.NormalTS;
				Out_NormalWS4_g207126 = Data4_g207126.NormalWS;
				Out_Shader4_g207126 = Data4_g207126.Shader;
				Out_Emissive4_g207126= Data4_g207126.Emissive;
				Out_MultiMask4_g207126 = Data4_g207126.MultiMask;
				Out_Grayscale4_g207126 = Data4_g207126.Grayscale;
				Out_Luminosity4_g207126= Data4_g207126.Luminosity;
				Out_AlphaClip4_g207126 = Data4_g207126.AlphaClip;
				Out_AlphaFade4_g207126 = Data4_g207126.AlphaFade;
				Out_Translucency4_g207126 = Data4_g207126.Translucency;
				Out_Transmission4_g207126 = Data4_g207126.Transmission;
				Out_Thickness4_g207126 = Data4_g207126.Thickness;
				Out_Diffusion4_g207126 = Data4_g207126.Diffusion;
				Out_Depth4_g207126= Data4_g207126.Depth;
				}
				float3 appendResult23_g207121 = (float3(Out_NormalTS4_g207126 , 1.0));
				float3 temp_output_13_0_g207124 = appendResult23_g207121;
				float3 temp_output_33_0_g207124 = ( temp_output_13_0_g207124 * _render_normal );
				float3 switchResult12_g207124 = (((IsFrontFace>0)?(temp_output_13_0_g207124):(temp_output_33_0_g207124)));
				
				float4 break24_g207121 = Out_Shader4_g207126;
				
				float localCustomAlphaClip21_g207131 = ( 0.0 );
				float temp_output_3_0_g207131 = Out_AlphaClip4_g207126;
				float Alpha21_g207131 = temp_output_3_0_g207131;
				float temp_output_15_0_g207131 = 0.0;
				float Treshold21_g207131 = temp_output_15_0_g207131;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_CUTOUT) || defined (TVE_GLANCING) || defined (TVE_DITHER)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha21_g207131 - Treshold21_g207131);
				#endif
				#endif
				}
				

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;

				surfaceDescription.Normal = switchResult12_g207124;
				surfaceDescription.Smoothness = break24_g207121.w;
				surfaceDescription.Alpha = saturate( ( Alpha21_g207131 * Out_AlphaFade4_g207126 ) );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = input.positionSS.z;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

                #if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif

                #if SHADERPASS == SHADERPASS_SHADOWS
                float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
                outputDepth += bias;
                #endif

				#ifdef SCENESELECTIONPASS
    				outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
    				outColor = unity_SelectionID;
				#else
    				#ifdef WRITE_MSAA_DEPTH
    					depthColor = packedInput.positionCS.z;
    					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
    				#endif

    				#if defined(WRITE_NORMAL_BUFFER)
    				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
    				#endif

    				#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
    				DecalPrepassData decalPrepassData;
                    #ifdef _DISABLE_DECALS
				    ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
                    #else
    				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
                    #endif
    				decalPrepassData.renderingLayerMask = GetMeshRenderingLayerMask();
    				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
    				#endif
				#endif // SCENESELECTIONPASS
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Blend 1 One OneMinusSrcAlpha
			Blend 2 One [_DstBlend2]
			Blend 3 One [_DstBlend2]
			Blend 4 One OneMinusSrcAlpha

			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
			}


            ColorMask [_ColorMaskTransparentVelOne] 1
            ColorMask [_ColorMaskTransparentVelTwo] 2

			HLSLPROGRAM
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#define ASE_FRAGMENT_NORMAL 0
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 170004
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

            #pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
            #pragma multi_compile_fragment PUNCTUAL_SHADOW_LOW PUNCTUAL_SHADOW_MEDIUM PUNCTUAL_SHADOW_HIGH
            #pragma multi_compile_fragment DIRECTIONAL_SHADOW_LOW DIRECTIONAL_SHADOW_MEDIUM DIRECTIONAL_SHADOW_HIGH
            #pragma multi_compile_fragment AREA_SHADOW_MEDIUM AREA_SHADOW_HIGH
            #pragma multi_compile_fragment _ PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
            #pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST

            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
            #pragma multi_compile _ USE_LEGACY_LIGHTMAPS

			#ifndef SHADER_STAGE_FRAGMENT
			#define SHADOW_LOW
			#define USE_FPTL_LIGHTLIST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_FORWARD
		    #define HAS_LIGHTLOOP 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _MainOcclusionRemap;
			half4 _MainCoordValue;
			half4 _Color;
			half4 _MainColor;
			half4 _MainMultiRemap;
			half4 _main_coord_value;
			half4 _MainSmoothnessRemap;
			half4 _MainColorTwo;
			half3 _render_normal;
			half _MainMetallicChannelMode;
			half _MainAlbedoValue;
			half _MainSmoothnessInfo;
			half _MainMultiMaskInfo;
			half _MainCoordMode;
			half _MainSampleMode;
			half _MainMetallicSourceMode;
			half _MainMetallicValue;
			half _MainOcclusionSourceMode;
			half _MainEnd;
			half _MainOcclusionValue;
			half _MainSmoothnessChannelMode;
			half _MainSmoothnessSourceMode;
			half _MainSmoothnessValue;
			half _MainMultiChannelMode;
			half _MainMultiSourceMode;
			half _MainColorMode;
			half _MainNormalValue;
			half _MainAlphaChannelMode;
			half _MainAlphaSourceMode;
			half _MainAlphaClipValue;
			half _MainOcclusionChannelMode;
			half _render_src;
			half _MainCategory;
			half _RenderClip;
			half _render_cull;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			half _IsGeneralShader;
			half _RenderZWrite;
			half _IsVersion;
			half _RenderCategory;
			half _RenderEnd;
			half _RenderMode;
			half _RenderCull;
			half _RenderNormal;
			half _RenderBakeGI;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMotion;
			half _Cutoff;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderFilter;
			half _RenderShadow;
			half _IsStandardShader;
			half _RenderSpecular;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_Linear_Repeat);
			SAMPLER(sampler_Linear_Repeat_Aniso8);
			SAMPLER(sampler_Point_Repeat);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MainShaderTex);
			TEXTURE2D(_MainMetallicTex);
			TEXTURE2D(_MainOcclusionTex);
			TEXTURE2D(_MainSmoothnessTex);
			TEXTURE2D(_MainMultiTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_MainAlphaTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local_fragment TVE_FILTER_DEFAULT TVE_FILTER_POINT TVE_FILTER_LOW TVE_FILTER_MEDIUM TVE_FILTER_HIGH
			#pragma shader_feature_local_fragment TVE_MAIN_SAMPLE_MAIN_UV TVE_MAIN_SAMPLE_EXTRA_UV TVE_MAIN_SAMPLE_PLANAR_2D TVE_MAIN_SAMPLE_PLANAR_3D TVE_MAIN_SAMPLE_STOCHASTIC_2D TVE_MAIN_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_vertex TVE_PIVOT_OFF TVE_PIVOT_BAKED TVE_PIVOT_PROC
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			#define TVE_GEOMETRY_SHADER
			//#pragma editor_sync_compilation
			#ifndef ASE_NEEDS_TEXTURE_COORDINATES2 //Needed for ASE 1.9.8.1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			void ComputeWorldCoords( half4 Coords, half3 WorldPosition, out half2 ZX, out half2 ZY, out half2 XY )
			{
				ZX = WorldPosition.xz * Coords.xx - Coords.zz;
				ZY = WorldPosition.yz * Coords.yx - Coords.wz; 
				XY = WorldPosition.xy * Coords.xy - Coords.zw;
			}
			
			half4 SampleMain( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SampleExtra( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			half4 SamplePlanar2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			void ComputeTriplanarWeights( half3 WorldNormal, out half T1, out half T2, out half T3 )
			{
				half3 powNormal = abs( WorldNormal.xyz );
				half3 weights = max( powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal, 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				T1 = weights.y;
				T2 = weights.x;
				T3 = weights.z;
			}
			
			half4 SamplePlanar3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				half4 tex1 = SAMPLE_TEXTURE2D( Texture, Sampler, ZX);
				half4 tex2 = SAMPLE_TEXTURE2D( Texture, Sampler, ZY);
				half4 tex3 = SAMPLE_TEXTURE2D( Texture, Sampler, XY);
				return tex1 * T1 + tex2 * T2 + tex3 * T3;
			}
			
			void ComputeStochasticCoords( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				half2 vertex1, vertex2, vertex3;
				// Scaling of the input
				half2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				half2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				half3 temp = half3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float4 SampleStochastic2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				ComputeStochasticCoords(UV, UV1, UV2, UV3, W1, W2, W3 );
				half4 tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(UV), ddy(UV));
				half4 tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(UV), ddy(UV));
				half4 tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(UV), ddy(UV));
				return tex1 * W1 + tex2 * W2 + tex3 * W3;
			}
			
			half4 SampleStochastic3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				half4 tex1, tex2, tex3;
				ComputeStochasticCoords(ZX, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZX), ddy(ZX));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZX), ddy(ZX));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZX), ddy(ZX));
				half4 texZX = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(ZY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZY), ddy(ZY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZY), ddy(ZY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZY), ddy(ZY));
				half4 texZY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(XY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(XY), ddy(XY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(XY), ddy(XY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(XY), ddy(XY));
				half4 texXY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				return texZX * T1 + texZY * T2 + texXY * T3;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

				#ifdef DECAL_NORMAL_BLENDING
					#ifndef SURFACE_GRADIENT
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
					#if !defined(SHADER_STAGE_RAY_TRACING)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						#ifdef FRAG_INPUTS_USE_TEXCOORD0
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
						#else
							surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
						#endif
						surfaceData.metallic = 0;
					}
					#endif
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS output )
			{
				_TimeParameters.xyz = timeParameters;
				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float3 vertexToFrag73_g205214 = ase_positionWS;
				output.ase_texcoord8.xyz = vertexToFrag73_g205214;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205224 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205224 = ( localObjectPosition_UNITY_MATRIX_M14_g205224 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205224 = localObjectPosition_UNITY_MATRIX_M14_g205224;
				#endif
				float3 temp_output_340_7_g205214 = staticSwitch13_g205224;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205226 = ObjectPosition_UNITY_MATRIX_M();
				float3 _Vector0 = float3(0,0,0);
				float3 appendResult60_g205222 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 PositionOS131_g205214 = inputMesh.positionOS;
				float3 break233_g205214 = PositionOS131_g205214;
				float3 appendResult234_g205214 = (float3(break233_g205214.x , 0.0 , break233_g205214.z));
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch229_g205214 = _Vector0;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch229_g205214 = appendResult60_g205222;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch229_g205214 = appendResult234_g205214;
				#else
				float3 staticSwitch229_g205214 = _Vector0;
				#endif
				half3 PivotOS149_g205214 = staticSwitch229_g205214;
				float3 temp_output_122_0_g205226 = PivotOS149_g205214;
				float3 PivotsOnlyWS105_g205226 = mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g205226 , 0.0 ) ).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205226 = ( ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205226 = ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 );
				#endif
				float3 temp_output_341_7_g205214 = staticSwitch13_g205226;
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#else
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#endif
				float3 vertexToFrag76_g205214 = staticSwitch236_g205214;
				output.ase_texcoord9.xyz = vertexToFrag76_g205214;
				
				output.ase_texcoord7.xy = inputMesh.ase_texcoord.xy;
				output.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord7.zw = 0;
				output.ase_texcoord8.w = 0;
				output.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS output = (PackedVaryingsMeshToPS)0;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, output);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : inputMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = inputMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(inputMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				output.uv1 = inputMesh.uv1;
				output.uv2 = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					output.vpassPositionCS = float3(VPASSpositionCS.xyw);
					output.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplayMaterial.hlsl"

            #if defined(_TRANSPARENT_REFRACTIVE_SORT) || defined(_ENABLE_FOG_ON_TRANSPARENT)
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Water/Shaders/UnderWaterUtilities.hlsl"
            #endif

            #ifdef UNITY_VIRTUAL_TEXTURING
                #ifdef OUTPUT_SPLIT_LIGHTING
                   #define DIFFUSE_LIGHTING_TARGET SV_Target2
                   #define SSS_BUFFER_TARGET SV_Target3
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                   #define MOTION_VECTOR_TARGET SV_Target2
                    #ifdef _TRANSPARENT_REFRACTIVE_SORT
                        #define BEFORE_REFRACTION_TARGET SV_Target3
                        #define BEFORE_REFRACTION_ALPHA_TARGET SV_Target4
                #endif
            	#endif
            #if defined(SHADER_API_PSSL)
            	#pragma PSSL_target_output_format(target 1 FMT_32_ABGR)
            #endif
            #else
                #ifdef OUTPUT_SPLIT_LIGHTING
                #define DIFFUSE_LIGHTING_TARGET SV_Target1
                #define SSS_BUFFER_TARGET SV_Target2
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                #define MOTION_VECTOR_TARGET SV_Target1
                #ifdef _TRANSPARENT_REFRACTIVE_SORT
                     #define BEFORE_REFRACTION_TARGET SV_Target2
                     #define BEFORE_REFRACTION_ALPHA_TARGET SV_Target3
                #endif
            #endif
            #endif

			void Frag(PackedVaryingsMeshToPS packedInput
						, out float4 outColor:SV_Target0
					#ifdef UNITY_VIRTUAL_TEXTURING
						, out float4 outVTFeedback : SV_Target1
					#endif
					#ifdef OUTPUT_SPLIT_LIGHTING
						, out float4 outDiffuseLighting : DIFFUSE_LIGHTING_TARGET
						, OUTPUT_SSSBUFFER(outSSSBuffer) : SSS_BUFFER_TARGET
					#elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
						, out float4 outMotionVec : MOTION_VECTOR_TARGET
						#ifdef _TRANSPARENT_REFRACTIVE_SORT
							, out float4 outBeforeRefractionColor : BEFORE_REFRACTION_TARGET
							, out float4 outBeforeRefractionAlpha : BEFORE_REFRACTION_ALPHA_TARGET
						#endif
					#endif
					#if defined( ASE_DEPTH_WRITE_ON )
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
					#endif
					 )
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 1.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				AdjustFragInputsToOffScreenRendering(input, _OffScreenRendering > 0, _OffScreenDownsampleFactor);
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];
				float4 ClipPos = TransformWorldToHClip( PositionRWS );
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float localBreakData4_g207126 = ( 0.0 );
				float localCompData3_g207090 = ( 0.0 );
				TVEVisualData Data3_g207090 = (TVEVisualData)0;
				half4 Dummy130_g207086 = ( _MainCategory + _MainEnd + ( _MainSampleMode + _MainCoordMode + _MainCoordValue ) + _MainMultiMaskInfo + _MainSmoothnessInfo );
				float In_Dummy3_g207090 = Dummy130_g207086.x;
				TEXTURE2D(Texture276_g207087) = _MainAlbedoTex;
				float localFilterTexture19_g207095 = ( 0.0 );
				SamplerState SS19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207095 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207095 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207095 = SamplerDefault19_g207095;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207095 = SamplerDefault19_g207095;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207095 = SamplerPoint19_g207095;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207095 = SamplerLow19_g207095;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207095 = SamplerMedium19_g207095;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207095 = SamplerHigh19_g207095;
				#endif
				}
				SamplerState Sampler276_g207087 = SS19_g207095;
				half4 Local_Coords180_g207086 = _main_coord_value;
				float4 temp_output_37_0_g207087 = Local_Coords180_g207086;
				half4 Coords276_g207087 = temp_output_37_0_g207087;
				half2 TexCoord276_g207087 = packedInput.ase_texcoord7.xy;
				half4 localSampleMain276_g207087 = SampleMain( Texture276_g207087 , Sampler276_g207087 , Coords276_g207087 , TexCoord276_g207087 );
				TEXTURE2D(Texture275_g207087) = _MainAlbedoTex;
				SamplerState Sampler275_g207087 = SS19_g207095;
				half4 Coords275_g207087 = temp_output_37_0_g207087;
				half2 TexCoord275_g207087 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207087 = SampleExtra( Texture275_g207087 , Sampler275_g207087 , Coords275_g207087 , TexCoord275_g207087 );
				TEXTURE2D(Texture238_g207087) = _MainAlbedoTex;
				SamplerState Sampler238_g207087 = SS19_g207095;
				half4 Coords238_g207087 = temp_output_37_0_g207087;
				TVEModelData Data16_g205219 = (TVEModelData)0;
				float In_Dummy16_g205219 = 0.0;
				float3 vertexToFrag73_g205214 = packedInput.ase_texcoord8.xyz;
				half3 PositionWS122_g205214 = vertexToFrag73_g205214;
				float3 In_PositionWS16_g205219 = PositionWS122_g205214;
				float3 vertexToFrag76_g205214 = packedInput.ase_texcoord9.xyz;
				half3 PivotWS121_g205214 = vertexToFrag76_g205214;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g205214 = ( PositionWS122_g205214 - PivotWS121_g205214 );
				#else
				float3 staticSwitch204_g205214 = PositionWS122_g205214;
				#endif
				half3 PositionWO132_g205214 = ( staticSwitch204_g205214 - TVE_WorldOrigin );
				float3 In_PositionWO16_g205219 = PositionWO132_g205214;
				float3 In_PivotWS16_g205219 = PivotWS121_g205214;
				half3 PivotWO133_g205214 = ( PivotWS121_g205214 - TVE_WorldOrigin );
				float3 In_PivotWO16_g205219 = PivotWO133_g205214;
				float3 normalizedWorldNormal = normalize( NormalWS );
				half3 Normal_WS95_g205214 = normalizedWorldNormal;
				float3 In_NormalWS16_g205219 = Normal_WS95_g205214;
				float3 normalizeResult296_g205214 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g205214 ) );
				half3 ViewDirWS169_g205214 = normalizeResult296_g205214;
				float3 In_ViewDirWS16_g205219 = ViewDirWS169_g205214;
				half4 VertexMasks171_g205214 = packedInput.ase_color;
				float4 In_VertexData16_g205219 = VertexMasks171_g205214;
				float4 In_BoundsData16_g205219 = float4( 1,1,1,1 );
				{
				Data16_g205219.Dummy = In_Dummy16_g205219;
				Data16_g205219.PositionWS = In_PositionWS16_g205219;
				Data16_g205219.PositionWO = In_PositionWO16_g205219;
				Data16_g205219.PivotWS = In_PivotWS16_g205219;
				Data16_g205219.PivotWO = In_PivotWO16_g205219;
				Data16_g205219.NormalWS = In_NormalWS16_g205219;
				Data16_g205219.ViewDirWS = In_ViewDirWS16_g205219;
				Data16_g205219.VertexData = In_VertexData16_g205219;
				Data16_g205219.BoundsData = In_BoundsData16_g205219;
				}
				TVEModelData Data15_g207089 = Data16_g205219;
				float Out_Dummy15_g207089 = 0;
				float3 Out_PositionWS15_g207089 = float3( 0,0,0 );
				float3 Out_PositionWO15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWS15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWO15_g207089 = float3( 0,0,0 );
				float3 Out_NormalWS15_g207089 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g207089 = float3( 0,0,0 );
				float4 Out_VertexData15_g207089 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g207089 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g207089 = Data15_g207089.Dummy;
				Out_PositionWS15_g207089 = Data15_g207089.PositionWS;
				Out_PositionWO15_g207089 = Data15_g207089.PositionWO;
				Out_PivotWS15_g207089 = Data15_g207089.PivotWS;
				Out_PivotWO15_g207089 = Data15_g207089.PivotWO;
				Out_NormalWS15_g207089 = Data15_g207089.NormalWS;
				Out_ViewDirWS15_g207089 = Data15_g207089.ViewDirWS;
				Out_VertexData15_g207089 = Data15_g207089.VertexData;
				Out_BoundsData15_g207089 = Data15_g207089.BoundsData;
				}
				half3 Model_PositionWO222_g207086 = Out_PositionWO15_g207089;
				float3 temp_output_279_0_g207087 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207087 = temp_output_279_0_g207087;
				half4 localSamplePlanar2D238_g207087 = SamplePlanar2D( Texture238_g207087 , Sampler238_g207087 , Coords238_g207087 , WorldPosition238_g207087 );
				TEXTURE2D(Texture246_g207087) = _MainAlbedoTex;
				SamplerState Sampler246_g207087 = SS19_g207095;
				half4 Coords246_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition246_g207087 = temp_output_279_0_g207087;
				half3 Model_NormalWS226_g207086 = Out_NormalWS15_g207089;
				float3 temp_output_280_0_g207087 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207087 = temp_output_280_0_g207087;
				half4 localSamplePlanar3D246_g207087 = SamplePlanar3D( Texture246_g207087 , Sampler246_g207087 , Coords246_g207087 , WorldPosition246_g207087 , WorldNormal246_g207087 );
				TEXTURE2D(Texture234_g207087) = _MainAlbedoTex;
				SamplerState Sampler234_g207087 = SS19_g207095;
				float4 Coords234_g207087 = temp_output_37_0_g207087;
				float3 WorldPosition234_g207087 = temp_output_279_0_g207087;
				float4 localSampleStochastic2D234_g207087 = SampleStochastic2D( Texture234_g207087 , Sampler234_g207087 , Coords234_g207087 , WorldPosition234_g207087 );
				TEXTURE2D(Texture263_g207087) = _MainAlbedoTex;
				SamplerState Sampler263_g207087 = SS19_g207095;
				half4 Coords263_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition263_g207087 = temp_output_279_0_g207087;
				half3 WorldNormal263_g207087 = temp_output_280_0_g207087;
				half4 localSampleStochastic3D263_g207087 = SampleStochastic3D( Texture263_g207087 , Sampler263_g207087 , Coords263_g207087 , WorldPosition263_g207087 , WorldNormal263_g207087 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch184_g207086 = localSampleExtra275_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch184_g207086 = localSamplePlanar2D238_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch184_g207086 = localSamplePlanar3D246_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch184_g207086 = localSampleStochastic2D234_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch184_g207086 = localSampleStochastic3D263_g207087;
				#else
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#endif
				half4 Local_AlbedoTex185_g207086 = staticSwitch184_g207086;
				float3 lerpResult53_g207086 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex185_g207086).xyz , _MainAlbedoValue);
				half3 Local_AlbedoRGB107_g207086 = lerpResult53_g207086;
				TEXTURE2D(Texture276_g207096) = _MainShaderTex;
				float localFilterTexture30_g207097 = ( 0.0 );
				SamplerState SS30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207097 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207097 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207097 = SamplerDefault30_g207097;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207097 = SamplerDefault30_g207097;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207097 = SamplerPoint30_g207097;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207097 = SamplerLow30_g207097;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207097 = SamplerMedium30_g207097;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207097 = SamplerHigh30_g207097;
				#endif
				}
				SamplerState Sampler276_g207096 = SS30_g207097;
				float4 temp_output_37_0_g207096 = Local_Coords180_g207086;
				half4 Coords276_g207096 = temp_output_37_0_g207096;
				half2 TexCoord276_g207096 = packedInput.ase_texcoord7.xy;
				half4 localSampleMain276_g207096 = SampleMain( Texture276_g207096 , Sampler276_g207096 , Coords276_g207096 , TexCoord276_g207096 );
				TEXTURE2D(Texture275_g207096) = _MainShaderTex;
				SamplerState Sampler275_g207096 = SS30_g207097;
				half4 Coords275_g207096 = temp_output_37_0_g207096;
				half2 TexCoord275_g207096 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207096 = SampleExtra( Texture275_g207096 , Sampler275_g207096 , Coords275_g207096 , TexCoord275_g207096 );
				TEXTURE2D(Texture238_g207096) = _MainShaderTex;
				SamplerState Sampler238_g207096 = SS30_g207097;
				half4 Coords238_g207096 = temp_output_37_0_g207096;
				float3 temp_output_279_0_g207096 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207096 = temp_output_279_0_g207096;
				half4 localSamplePlanar2D238_g207096 = SamplePlanar2D( Texture238_g207096 , Sampler238_g207096 , Coords238_g207096 , WorldPosition238_g207096 );
				TEXTURE2D(Texture246_g207096) = _MainShaderTex;
				SamplerState Sampler246_g207096 = SS30_g207097;
				half4 Coords246_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition246_g207096 = temp_output_279_0_g207096;
				float3 temp_output_280_0_g207096 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207096 = temp_output_280_0_g207096;
				half4 localSamplePlanar3D246_g207096 = SamplePlanar3D( Texture246_g207096 , Sampler246_g207096 , Coords246_g207096 , WorldPosition246_g207096 , WorldNormal246_g207096 );
				TEXTURE2D(Texture234_g207096) = _MainShaderTex;
				SamplerState Sampler234_g207096 = SS30_g207097;
				float4 Coords234_g207096 = temp_output_37_0_g207096;
				float3 WorldPosition234_g207096 = temp_output_279_0_g207096;
				float4 localSampleStochastic2D234_g207096 = SampleStochastic2D( Texture234_g207096 , Sampler234_g207096 , Coords234_g207096 , WorldPosition234_g207096 );
				TEXTURE2D(Texture263_g207096) = _MainShaderTex;
				SamplerState Sampler263_g207096 = SS30_g207097;
				half4 Coords263_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition263_g207096 = temp_output_279_0_g207096;
				half3 WorldNormal263_g207096 = temp_output_280_0_g207096;
				half4 localSampleStochastic3D263_g207096 = SampleStochastic3D( Texture263_g207096 , Sampler263_g207096 , Coords263_g207096 , WorldPosition263_g207096 , WorldNormal263_g207096 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch198_g207086 = localSampleExtra275_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch198_g207086 = localSamplePlanar2D238_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch198_g207086 = localSamplePlanar3D246_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch198_g207086 = localSampleStochastic2D234_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch198_g207086 = localSampleStochastic3D263_g207096;
				#else
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#endif
				half4 Local_ShaderTex199_g207086 = staticSwitch198_g207086;
				float temp_output_17_0_g207112 = _MainMetallicChannelMode;
				TEXTURE2D(Texture276_g207100) = _MainMetallicTex;
				float localFilterTexture30_g207101 = ( 0.0 );
				SamplerState SS30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207101 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207101 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207101 = SamplerDefault30_g207101;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207101 = SamplerDefault30_g207101;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207101 = SamplerPoint30_g207101;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207101 = SamplerLow30_g207101;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207101 = SamplerMedium30_g207101;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207101 = SamplerHigh30_g207101;
				#endif
				}
				SamplerState Sampler276_g207100 = SS30_g207101;
				float4 temp_output_37_0_g207100 = Local_Coords180_g207086;
				half4 Coords276_g207100 = temp_output_37_0_g207100;
				half2 TexCoord276_g207100 = packedInput.ase_texcoord7.xy;
				half4 localSampleMain276_g207100 = SampleMain( Texture276_g207100 , Sampler276_g207100 , Coords276_g207100 , TexCoord276_g207100 );
				TEXTURE2D(Texture275_g207100) = _MainMetallicTex;
				SamplerState Sampler275_g207100 = SS30_g207101;
				half4 Coords275_g207100 = temp_output_37_0_g207100;
				half2 TexCoord275_g207100 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207100 = SampleExtra( Texture275_g207100 , Sampler275_g207100 , Coords275_g207100 , TexCoord275_g207100 );
				TEXTURE2D(Texture238_g207100) = _MainMetallicTex;
				SamplerState Sampler238_g207100 = SS30_g207101;
				half4 Coords238_g207100 = temp_output_37_0_g207100;
				float3 temp_output_279_0_g207100 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207100 = temp_output_279_0_g207100;
				half4 localSamplePlanar2D238_g207100 = SamplePlanar2D( Texture238_g207100 , Sampler238_g207100 , Coords238_g207100 , WorldPosition238_g207100 );
				TEXTURE2D(Texture246_g207100) = _MainMetallicTex;
				SamplerState Sampler246_g207100 = SS30_g207101;
				half4 Coords246_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition246_g207100 = temp_output_279_0_g207100;
				float3 temp_output_280_0_g207100 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207100 = temp_output_280_0_g207100;
				half4 localSamplePlanar3D246_g207100 = SamplePlanar3D( Texture246_g207100 , Sampler246_g207100 , Coords246_g207100 , WorldPosition246_g207100 , WorldNormal246_g207100 );
				TEXTURE2D(Texture234_g207100) = _MainMetallicTex;
				SamplerState Sampler234_g207100 = SS30_g207101;
				float4 Coords234_g207100 = temp_output_37_0_g207100;
				float3 WorldPosition234_g207100 = temp_output_279_0_g207100;
				float4 localSampleStochastic2D234_g207100 = SampleStochastic2D( Texture234_g207100 , Sampler234_g207100 , Coords234_g207100 , WorldPosition234_g207100 );
				TEXTURE2D(Texture263_g207100) = _MainMetallicTex;
				SamplerState Sampler263_g207100 = SS30_g207101;
				half4 Coords263_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition263_g207100 = temp_output_279_0_g207100;
				half3 WorldNormal263_g207100 = temp_output_280_0_g207100;
				half4 localSampleStochastic3D263_g207100 = SampleStochastic3D( Texture263_g207100 , Sampler263_g207100 , Coords263_g207100 , WorldPosition263_g207100 , WorldNormal263_g207100 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch335_g207086 = localSampleExtra275_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch335_g207086 = localSamplePlanar2D238_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch335_g207086 = localSamplePlanar3D246_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch335_g207086 = localSampleStochastic2D234_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch335_g207086 = localSampleStochastic3D263_g207100;
				#else
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#endif
				half4 Local_MetallicTex341_g207086 = staticSwitch335_g207086;
				float4 break59_g207112 = Local_MetallicTex341_g207086;
				float ifLocalVar58_g207112 = 0;
				if( temp_output_17_0_g207112 == 0.0 )
				ifLocalVar58_g207112 = break59_g207112.x;
				float ifLocalVar60_g207112 = 0;
				if( temp_output_17_0_g207112 == 1.0 )
				ifLocalVar60_g207112 = break59_g207112.y;
				float ifLocalVar61_g207112 = 0;
				if( temp_output_17_0_g207112 == 2.0 )
				ifLocalVar61_g207112 = break59_g207112.z;
				float ifLocalVar62_g207112 = 0;
				if( temp_output_17_0_g207112 == 3.0 )
				ifLocalVar62_g207112 = break59_g207112.w;
				float lerpResult366_g207086 = lerp( (Local_ShaderTex199_g207086).x , ( ifLocalVar58_g207112 + ifLocalVar60_g207112 + ifLocalVar61_g207112 + ifLocalVar62_g207112 ) , _MainMetallicSourceMode);
				half Local_Metallic322_g207086 = ( lerpResult366_g207086 * _MainMetallicValue );
				float temp_output_17_0_g207113 = _MainOcclusionChannelMode;
				TEXTURE2D(Texture276_g207102) = _MainOcclusionTex;
				float localFilterTexture30_g207108 = ( 0.0 );
				SamplerState SS30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207108 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207108 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207108 = SamplerDefault30_g207108;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207108 = SamplerDefault30_g207108;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207108 = SamplerPoint30_g207108;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207108 = SamplerLow30_g207108;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207108 = SamplerMedium30_g207108;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207108 = SamplerHigh30_g207108;
				#endif
				}
				SamplerState Sampler276_g207102 = SS30_g207108;
				float4 temp_output_37_0_g207102 = Local_Coords180_g207086;
				half4 Coords276_g207102 = temp_output_37_0_g207102;
				half2 TexCoord276_g207102 = packedInput.ase_texcoord7.xy;
				half4 localSampleMain276_g207102 = SampleMain( Texture276_g207102 , Sampler276_g207102 , Coords276_g207102 , TexCoord276_g207102 );
				TEXTURE2D(Texture275_g207102) = _MainOcclusionTex;
				SamplerState Sampler275_g207102 = SS30_g207108;
				half4 Coords275_g207102 = temp_output_37_0_g207102;
				half2 TexCoord275_g207102 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207102 = SampleExtra( Texture275_g207102 , Sampler275_g207102 , Coords275_g207102 , TexCoord275_g207102 );
				TEXTURE2D(Texture238_g207102) = _MainOcclusionTex;
				SamplerState Sampler238_g207102 = SS30_g207108;
				half4 Coords238_g207102 = temp_output_37_0_g207102;
				float3 temp_output_279_0_g207102 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207102 = temp_output_279_0_g207102;
				half4 localSamplePlanar2D238_g207102 = SamplePlanar2D( Texture238_g207102 , Sampler238_g207102 , Coords238_g207102 , WorldPosition238_g207102 );
				TEXTURE2D(Texture246_g207102) = _MainOcclusionTex;
				SamplerState Sampler246_g207102 = SS30_g207108;
				half4 Coords246_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition246_g207102 = temp_output_279_0_g207102;
				float3 temp_output_280_0_g207102 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207102 = temp_output_280_0_g207102;
				half4 localSamplePlanar3D246_g207102 = SamplePlanar3D( Texture246_g207102 , Sampler246_g207102 , Coords246_g207102 , WorldPosition246_g207102 , WorldNormal246_g207102 );
				TEXTURE2D(Texture234_g207102) = _MainOcclusionTex;
				SamplerState Sampler234_g207102 = SS30_g207108;
				float4 Coords234_g207102 = temp_output_37_0_g207102;
				float3 WorldPosition234_g207102 = temp_output_279_0_g207102;
				float4 localSampleStochastic2D234_g207102 = SampleStochastic2D( Texture234_g207102 , Sampler234_g207102 , Coords234_g207102 , WorldPosition234_g207102 );
				TEXTURE2D(Texture263_g207102) = _MainOcclusionTex;
				SamplerState Sampler263_g207102 = SS30_g207108;
				half4 Coords263_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition263_g207102 = temp_output_279_0_g207102;
				half3 WorldNormal263_g207102 = temp_output_280_0_g207102;
				half4 localSampleStochastic3D263_g207102 = SampleStochastic3D( Texture263_g207102 , Sampler263_g207102 , Coords263_g207102 , WorldPosition263_g207102 , WorldNormal263_g207102 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch343_g207086 = localSampleExtra275_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch343_g207086 = localSamplePlanar2D238_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch343_g207086 = localSamplePlanar3D246_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch343_g207086 = localSampleStochastic2D234_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch343_g207086 = localSampleStochastic3D263_g207102;
				#else
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#endif
				half4 Local_OcclusionTex349_g207086 = staticSwitch343_g207086;
				float4 break59_g207113 = Local_OcclusionTex349_g207086;
				float ifLocalVar58_g207113 = 0;
				if( temp_output_17_0_g207113 == 0.0 )
				ifLocalVar58_g207113 = break59_g207113.x;
				float ifLocalVar60_g207113 = 0;
				if( temp_output_17_0_g207113 == 1.0 )
				ifLocalVar60_g207113 = break59_g207113.y;
				float ifLocalVar61_g207113 = 0;
				if( temp_output_17_0_g207113 == 2.0 )
				ifLocalVar61_g207113 = break59_g207113.z;
				float ifLocalVar62_g207113 = 0;
				if( temp_output_17_0_g207113 == 3.0 )
				ifLocalVar62_g207113 = break59_g207113.w;
				float lerpResult373_g207086 = lerp( (Local_ShaderTex199_g207086).y , ( ifLocalVar58_g207113 + ifLocalVar60_g207113 + ifLocalVar61_g207113 + ifLocalVar62_g207113 ) , _MainOcclusionSourceMode);
				float clampResult17_g207110 = clamp( lerpResult373_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207109 = _MainOcclusionRemap.x;
				float temp_output_9_0_g207109 = ( clampResult17_g207110 - temp_output_7_0_g207109 );
				float lerpResult23_g207086 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g207109 * _MainOcclusionRemap.z ) + 0.0001 ) ) , _MainOcclusionValue);
				half Local_Occlusion313_g207086 = lerpResult23_g207086;
				float temp_output_17_0_g207115 = _MainSmoothnessChannelMode;
				TEXTURE2D(Texture276_g207105) = _MainSmoothnessTex;
				float localFilterTexture30_g207106 = ( 0.0 );
				SamplerState SS30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207106 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207106 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207106 = SamplerDefault30_g207106;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207106 = SamplerDefault30_g207106;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207106 = SamplerPoint30_g207106;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207106 = SamplerLow30_g207106;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207106 = SamplerMedium30_g207106;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207106 = SamplerHigh30_g207106;
				#endif
				}
				SamplerState Sampler276_g207105 = SS30_g207106;
				float4 temp_output_37_0_g207105 = Local_Coords180_g207086;
				half4 Coords276_g207105 = temp_output_37_0_g207105;
				half2 TexCoord276_g207105 = packedInput.ase_texcoord7.xy;
				half4 localSampleMain276_g207105 = SampleMain( Texture276_g207105 , Sampler276_g207105 , Coords276_g207105 , TexCoord276_g207105 );
				TEXTURE2D(Texture275_g207105) = _MainSmoothnessTex;
				SamplerState Sampler275_g207105 = SS30_g207106;
				half4 Coords275_g207105 = temp_output_37_0_g207105;
				half2 TexCoord275_g207105 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207105 = SampleExtra( Texture275_g207105 , Sampler275_g207105 , Coords275_g207105 , TexCoord275_g207105 );
				TEXTURE2D(Texture238_g207105) = _MainSmoothnessTex;
				SamplerState Sampler238_g207105 = SS30_g207106;
				half4 Coords238_g207105 = temp_output_37_0_g207105;
				float3 temp_output_279_0_g207105 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207105 = temp_output_279_0_g207105;
				half4 localSamplePlanar2D238_g207105 = SamplePlanar2D( Texture238_g207105 , Sampler238_g207105 , Coords238_g207105 , WorldPosition238_g207105 );
				TEXTURE2D(Texture246_g207105) = _MainSmoothnessTex;
				SamplerState Sampler246_g207105 = SS30_g207106;
				half4 Coords246_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition246_g207105 = temp_output_279_0_g207105;
				float3 temp_output_280_0_g207105 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207105 = temp_output_280_0_g207105;
				half4 localSamplePlanar3D246_g207105 = SamplePlanar3D( Texture246_g207105 , Sampler246_g207105 , Coords246_g207105 , WorldPosition246_g207105 , WorldNormal246_g207105 );
				TEXTURE2D(Texture234_g207105) = _MainSmoothnessTex;
				SamplerState Sampler234_g207105 = SS30_g207106;
				float4 Coords234_g207105 = temp_output_37_0_g207105;
				float3 WorldPosition234_g207105 = temp_output_279_0_g207105;
				float4 localSampleStochastic2D234_g207105 = SampleStochastic2D( Texture234_g207105 , Sampler234_g207105 , Coords234_g207105 , WorldPosition234_g207105 );
				TEXTURE2D(Texture263_g207105) = _MainSmoothnessTex;
				SamplerState Sampler263_g207105 = SS30_g207106;
				half4 Coords263_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition263_g207105 = temp_output_279_0_g207105;
				half3 WorldNormal263_g207105 = temp_output_280_0_g207105;
				half4 localSampleStochastic3D263_g207105 = SampleStochastic3D( Texture263_g207105 , Sampler263_g207105 , Coords263_g207105 , WorldPosition263_g207105 , WorldNormal263_g207105 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch359_g207086 = localSampleExtra275_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch359_g207086 = localSamplePlanar2D238_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch359_g207086 = localSamplePlanar3D246_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch359_g207086 = localSampleStochastic2D234_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch359_g207086 = localSampleStochastic3D263_g207105;
				#else
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#endif
				half4 Local_SmoothnessTex365_g207086 = staticSwitch359_g207086;
				float4 break59_g207115 = Local_SmoothnessTex365_g207086;
				float ifLocalVar58_g207115 = 0;
				if( temp_output_17_0_g207115 == 0.0 )
				ifLocalVar58_g207115 = break59_g207115.x;
				float ifLocalVar60_g207115 = 0;
				if( temp_output_17_0_g207115 == 1.0 )
				ifLocalVar60_g207115 = break59_g207115.y;
				float ifLocalVar61_g207115 = 0;
				if( temp_output_17_0_g207115 == 2.0 )
				ifLocalVar61_g207115 = break59_g207115.z;
				float ifLocalVar62_g207115 = 0;
				if( temp_output_17_0_g207115 == 3.0 )
				ifLocalVar62_g207115 = break59_g207115.w;
				float3 temp_cast_2 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 temp_cast_3 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 linearToGamma404_g207086 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult374_g207086 = lerp( (Local_ShaderTex199_g207086).w , (linearToGamma404_g207086).x , _MainSmoothnessSourceMode);
				float clampResult17_g207119 = clamp( lerpResult374_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207118 = _MainSmoothnessRemap.x;
				float temp_output_9_0_g207118 = ( clampResult17_g207119 - temp_output_7_0_g207118 );
				half Local_Smoothness317_g207086 = ( saturate( ( ( temp_output_9_0_g207118 * _MainSmoothnessRemap.z ) + 0.0001 ) ) * _MainSmoothnessValue );
				float4 appendResult73_g207086 = (float4(Local_Metallic322_g207086 , Local_Occlusion313_g207086 , 0.0 , Local_Smoothness317_g207086));
				half4 Local_Masks109_g207086 = appendResult73_g207086;
				float temp_output_17_0_g207114 = _MainMultiChannelMode;
				TEXTURE2D(Texture276_g207103) = _MainMultiTex;
				float localFilterTexture30_g207104 = ( 0.0 );
				SamplerState SS30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207104 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207104 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207104 = SamplerDefault30_g207104;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207104 = SamplerDefault30_g207104;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207104 = SamplerPoint30_g207104;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207104 = SamplerLow30_g207104;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207104 = SamplerMedium30_g207104;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207104 = SamplerHigh30_g207104;
				#endif
				}
				SamplerState Sampler276_g207103 = SS30_g207104;
				float4 temp_output_37_0_g207103 = Local_Coords180_g207086;
				half4 Coords276_g207103 = temp_output_37_0_g207103;
				half2 TexCoord276_g207103 = packedInput.ase_texcoord7.xy;
				half4 localSampleMain276_g207103 = SampleMain( Texture276_g207103 , Sampler276_g207103 , Coords276_g207103 , TexCoord276_g207103 );
				TEXTURE2D(Texture275_g207103) = _MainMultiTex;
				SamplerState Sampler275_g207103 = SS30_g207104;
				half4 Coords275_g207103 = temp_output_37_0_g207103;
				half2 TexCoord275_g207103 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207103 = SampleExtra( Texture275_g207103 , Sampler275_g207103 , Coords275_g207103 , TexCoord275_g207103 );
				TEXTURE2D(Texture238_g207103) = _MainMultiTex;
				SamplerState Sampler238_g207103 = SS30_g207104;
				half4 Coords238_g207103 = temp_output_37_0_g207103;
				float3 temp_output_279_0_g207103 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207103 = temp_output_279_0_g207103;
				half4 localSamplePlanar2D238_g207103 = SamplePlanar2D( Texture238_g207103 , Sampler238_g207103 , Coords238_g207103 , WorldPosition238_g207103 );
				TEXTURE2D(Texture246_g207103) = _MainMultiTex;
				SamplerState Sampler246_g207103 = SS30_g207104;
				half4 Coords246_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition246_g207103 = temp_output_279_0_g207103;
				float3 temp_output_280_0_g207103 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207103 = temp_output_280_0_g207103;
				half4 localSamplePlanar3D246_g207103 = SamplePlanar3D( Texture246_g207103 , Sampler246_g207103 , Coords246_g207103 , WorldPosition246_g207103 , WorldNormal246_g207103 );
				TEXTURE2D(Texture234_g207103) = _MainMultiTex;
				SamplerState Sampler234_g207103 = SS30_g207104;
				float4 Coords234_g207103 = temp_output_37_0_g207103;
				float3 WorldPosition234_g207103 = temp_output_279_0_g207103;
				float4 localSampleStochastic2D234_g207103 = SampleStochastic2D( Texture234_g207103 , Sampler234_g207103 , Coords234_g207103 , WorldPosition234_g207103 );
				TEXTURE2D(Texture263_g207103) = _MainMultiTex;
				SamplerState Sampler263_g207103 = SS30_g207104;
				half4 Coords263_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition263_g207103 = temp_output_279_0_g207103;
				half3 WorldNormal263_g207103 = temp_output_280_0_g207103;
				half4 localSampleStochastic3D263_g207103 = SampleStochastic3D( Texture263_g207103 , Sampler263_g207103 , Coords263_g207103 , WorldPosition263_g207103 , WorldNormal263_g207103 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch351_g207086 = localSampleExtra275_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch351_g207086 = localSamplePlanar2D238_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch351_g207086 = localSamplePlanar3D246_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch351_g207086 = localSampleStochastic2D234_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch351_g207086 = localSampleStochastic3D263_g207103;
				#else
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#endif
				half4 Local_MultiTex357_g207086 = staticSwitch351_g207086;
				float4 break59_g207114 = Local_MultiTex357_g207086;
				float ifLocalVar58_g207114 = 0;
				if( temp_output_17_0_g207114 == 0.0 )
				ifLocalVar58_g207114 = break59_g207114.x;
				float ifLocalVar60_g207114 = 0;
				if( temp_output_17_0_g207114 == 1.0 )
				ifLocalVar60_g207114 = break59_g207114.y;
				float ifLocalVar61_g207114 = 0;
				if( temp_output_17_0_g207114 == 2.0 )
				ifLocalVar61_g207114 = break59_g207114.z;
				float ifLocalVar62_g207114 = 0;
				if( temp_output_17_0_g207114 == 3.0 )
				ifLocalVar62_g207114 = break59_g207114.w;
				float lerpResult378_g207086 = lerp( (Local_Masks109_g207086).z , ( ifLocalVar58_g207114 + ifLocalVar60_g207114 + ifLocalVar61_g207114 + ifLocalVar62_g207114 ) , _MainMultiSourceMode);
				float clampResult17_g207116 = clamp( lerpResult378_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207117 = _MainMultiRemap.x;
				float temp_output_9_0_g207117 = ( clampResult17_g207116 - temp_output_7_0_g207117 );
				half Local_MultiMask78_g207086 = saturate( ( ( temp_output_9_0_g207117 * _MainMultiRemap.z ) + 0.0001 ) );
				float lerpResult58_g207086 = lerp( 1.0 , Local_MultiMask78_g207086 , _MainColorMode);
				float4 lerpResult62_g207086 = lerp( _MainColorTwo , _MainColor , lerpResult58_g207086);
				half3 Local_ColorRGB93_g207086 = (lerpResult62_g207086).rgb;
				half3 Local_Albedo139_g207086 = ( Local_AlbedoRGB107_g207086 * Local_ColorRGB93_g207086 );
				float3 In_Albedo3_g207090 = Local_Albedo139_g207086;
				float3 In_AlbedoRaw3_g207090 = Local_Albedo139_g207086;
				TEXTURE2D(Texture276_g207088) = _MainNormalTex;
				float localFilterTexture29_g207094 = ( 0.0 );
				SamplerState SS29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g207094 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g207094 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g207094 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g207094 = SamplerDefault29_g207094;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g207094 = SamplerDefault29_g207094;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g207094 = SamplerPoint29_g207094;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g207094 = SamplerLow29_g207094;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g207094 = SamplerMedium29_g207094;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g207094 = SamplerHigh29_g207094;
				#endif
				}
				SamplerState Sampler276_g207088 = SS29_g207094;
				float4 temp_output_37_0_g207088 = Local_Coords180_g207086;
				half4 Coords276_g207088 = temp_output_37_0_g207088;
				half2 TexCoord276_g207088 = packedInput.ase_texcoord7.xy;
				half4 localSampleMain276_g207088 = SampleMain( Texture276_g207088 , Sampler276_g207088 , Coords276_g207088 , TexCoord276_g207088 );
				TEXTURE2D(Texture275_g207088) = _MainNormalTex;
				SamplerState Sampler275_g207088 = SS29_g207094;
				half4 Coords275_g207088 = temp_output_37_0_g207088;
				half2 TexCoord275_g207088 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207088 = SampleExtra( Texture275_g207088 , Sampler275_g207088 , Coords275_g207088 , TexCoord275_g207088 );
				TEXTURE2D(Texture238_g207088) = _MainNormalTex;
				SamplerState Sampler238_g207088 = SS29_g207094;
				half4 Coords238_g207088 = temp_output_37_0_g207088;
				float3 temp_output_279_0_g207088 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207088 = temp_output_279_0_g207088;
				half4 localSamplePlanar2D238_g207088 = SamplePlanar2D( Texture238_g207088 , Sampler238_g207088 , Coords238_g207088 , WorldPosition238_g207088 );
				TEXTURE2D(Texture246_g207088) = _MainNormalTex;
				SamplerState Sampler246_g207088 = SS29_g207094;
				half4 Coords246_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition246_g207088 = temp_output_279_0_g207088;
				float3 temp_output_280_0_g207088 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207088 = temp_output_280_0_g207088;
				half4 localSamplePlanar3D246_g207088 = SamplePlanar3D( Texture246_g207088 , Sampler246_g207088 , Coords246_g207088 , WorldPosition246_g207088 , WorldNormal246_g207088 );
				TEXTURE2D(Texture234_g207088) = _MainNormalTex;
				SamplerState Sampler234_g207088 = SS29_g207094;
				float4 Coords234_g207088 = temp_output_37_0_g207088;
				float3 WorldPosition234_g207088 = temp_output_279_0_g207088;
				float4 localSampleStochastic2D234_g207088 = SampleStochastic2D( Texture234_g207088 , Sampler234_g207088 , Coords234_g207088 , WorldPosition234_g207088 );
				TEXTURE2D(Texture263_g207088) = _MainNormalTex;
				SamplerState Sampler263_g207088 = SS29_g207094;
				half4 Coords263_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition263_g207088 = temp_output_279_0_g207088;
				half3 WorldNormal263_g207088 = temp_output_280_0_g207088;
				half4 localSampleStochastic3D263_g207088 = SampleStochastic3D( Texture263_g207088 , Sampler263_g207088 , Coords263_g207088 , WorldPosition263_g207088 , WorldNormal263_g207088 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch193_g207086 = localSampleExtra275_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch193_g207086 = localSamplePlanar2D238_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch193_g207086 = localSamplePlanar3D246_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch193_g207086 = localSampleStochastic2D234_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch193_g207086 = localSampleStochastic3D263_g207088;
				#else
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#endif
				half4 Local_NormaTex191_g207086 = staticSwitch193_g207086;
				half4 Normal_Packed45_g207091 = Local_NormaTex191_g207086;
				float2 appendResult58_g207091 = (float2(( (Normal_Packed45_g207091).x * (Normal_Packed45_g207091).w ) , (Normal_Packed45_g207091).y));
				half2 Normal_Default50_g207091 = appendResult58_g207091;
				half2 Normal_ASTC41_g207091 = (Normal_Packed45_g207091).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g207091 = Normal_ASTC41_g207091;
				#else
				float2 staticSwitch38_g207091 = Normal_Default50_g207091;
				#endif
				half2 Normal_NO_DTX544_g207091 = (Normal_Packed45_g207091).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g207091 = Normal_NO_DTX544_g207091;
				#else
				float2 staticSwitch37_g207091 = staticSwitch38_g207091;
				#endif
				float2 temp_output_26_0_g207086 = ( (staticSwitch37_g207091*2.0 + -1.0) * _MainNormalValue );
				float3x3 ase_worldToTangent = float3x3( TangentWS.xyz, BitangentWS, NormalWS );
				half2 Normal_Planar45_g207092 = temp_output_26_0_g207086;
				float2 break71_g207092 = Normal_Planar45_g207092;
				float3 appendResult72_g207092 = (float3(break71_g207092.x , 0.0 , break71_g207092.y));
				float2 temp_output_205_0_g207086 = (mul( ase_worldToTangent, appendResult72_g207092 )).xy;
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#else
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#endif
				half2 Local_NormalTS108_g207086 = staticSwitch204_g207086;
				float2 In_NormalTS3_g207090 = Local_NormalTS108_g207086;
				float3 appendResult68_g207093 = (float3(Local_NormalTS108_g207086 , 1.0));
				float3 tanToWorld0 = float3( TangentWS.xyz.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.xyz.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.xyz.z, BitangentWS.z, NormalWS.z );
				float3 tanNormal74_g207093 = appendResult68_g207093;
				float3 worldNormal74_g207093 = normalize( float3( dot( tanToWorld0, tanNormal74_g207093 ), dot( tanToWorld1, tanNormal74_g207093 ), dot( tanToWorld2, tanNormal74_g207093 ) ) );
				half3 Local_NormalWS250_g207086 = worldNormal74_g207093;
				float3 In_NormalWS3_g207090 = Local_NormalWS250_g207086;
				float4 In_Shader3_g207090 = Local_Masks109_g207086;
				float4 In_Emissive3_g207090 = half4( 1, 1, 1, 1 );
				float3 temp_output_3_0_g207107 = Local_Albedo139_g207086;
				float dotResult20_g207107 = dot( temp_output_3_0_g207107 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale110_g207086 = dotResult20_g207107;
				float In_Grayscale3_g207090 = Local_Grayscale110_g207086;
				float clampResult144_g207086 = clamp( saturate( ( Local_Grayscale110_g207086 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity145_g207086 = clampResult144_g207086;
				float In_Luminosity3_g207090 = Local_Luminosity145_g207086;
				float In_MultiMask3_g207090 = Local_MultiMask78_g207086;
				float temp_output_17_0_g207111 = _MainAlphaChannelMode;
				TEXTURE2D(Texture276_g207098) = _MainAlphaTex;
				float localFilterTexture19_g207099 = ( 0.0 );
				SamplerState SS19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207099 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207099 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207099 = SamplerDefault19_g207099;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207099 = SamplerDefault19_g207099;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207099 = SamplerPoint19_g207099;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207099 = SamplerLow19_g207099;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207099 = SamplerMedium19_g207099;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207099 = SamplerHigh19_g207099;
				#endif
				}
				SamplerState Sampler276_g207098 = SS19_g207099;
				float4 temp_output_37_0_g207098 = Local_Coords180_g207086;
				half4 Coords276_g207098 = temp_output_37_0_g207098;
				half2 TexCoord276_g207098 = packedInput.ase_texcoord7.xy;
				half4 localSampleMain276_g207098 = SampleMain( Texture276_g207098 , Sampler276_g207098 , Coords276_g207098 , TexCoord276_g207098 );
				TEXTURE2D(Texture275_g207098) = _MainAlphaTex;
				SamplerState Sampler275_g207098 = SS19_g207099;
				half4 Coords275_g207098 = temp_output_37_0_g207098;
				half2 TexCoord275_g207098 = packedInput.uv2.xy;
				half4 localSampleExtra275_g207098 = SampleExtra( Texture275_g207098 , Sampler275_g207098 , Coords275_g207098 , TexCoord275_g207098 );
				TEXTURE2D(Texture238_g207098) = _MainAlphaTex;
				SamplerState Sampler238_g207098 = SS19_g207099;
				half4 Coords238_g207098 = temp_output_37_0_g207098;
				float3 temp_output_279_0_g207098 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207098 = temp_output_279_0_g207098;
				half4 localSamplePlanar2D238_g207098 = SamplePlanar2D( Texture238_g207098 , Sampler238_g207098 , Coords238_g207098 , WorldPosition238_g207098 );
				TEXTURE2D(Texture246_g207098) = _MainAlphaTex;
				SamplerState Sampler246_g207098 = SS19_g207099;
				half4 Coords246_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition246_g207098 = temp_output_279_0_g207098;
				float3 temp_output_280_0_g207098 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207098 = temp_output_280_0_g207098;
				half4 localSamplePlanar3D246_g207098 = SamplePlanar3D( Texture246_g207098 , Sampler246_g207098 , Coords246_g207098 , WorldPosition246_g207098 , WorldNormal246_g207098 );
				TEXTURE2D(Texture234_g207098) = _MainAlphaTex;
				SamplerState Sampler234_g207098 = SS19_g207099;
				float4 Coords234_g207098 = temp_output_37_0_g207098;
				float3 WorldPosition234_g207098 = temp_output_279_0_g207098;
				float4 localSampleStochastic2D234_g207098 = SampleStochastic2D( Texture234_g207098 , Sampler234_g207098 , Coords234_g207098 , WorldPosition234_g207098 );
				TEXTURE2D(Texture263_g207098) = _MainAlphaTex;
				SamplerState Sampler263_g207098 = SS19_g207099;
				half4 Coords263_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition263_g207098 = temp_output_279_0_g207098;
				half3 WorldNormal263_g207098 = temp_output_280_0_g207098;
				half4 localSampleStochastic3D263_g207098 = SampleStochastic3D( Texture263_g207098 , Sampler263_g207098 , Coords263_g207098 , WorldPosition263_g207098 , WorldNormal263_g207098 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch327_g207086 = localSampleExtra275_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch327_g207086 = localSamplePlanar2D238_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch327_g207086 = localSamplePlanar3D246_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch327_g207086 = localSampleStochastic2D234_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch327_g207086 = localSampleStochastic3D263_g207098;
				#else
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#endif
				half4 Local_AlphaTex330_g207086 = staticSwitch327_g207086;
				float4 break59_g207111 = Local_AlphaTex330_g207086;
				float ifLocalVar58_g207111 = 0;
				if( temp_output_17_0_g207111 == 0.0 )
				ifLocalVar58_g207111 = break59_g207111.x;
				float ifLocalVar60_g207111 = 0;
				if( temp_output_17_0_g207111 == 1.0 )
				ifLocalVar60_g207111 = break59_g207111.y;
				float ifLocalVar61_g207111 = 0;
				if( temp_output_17_0_g207111 == 2.0 )
				ifLocalVar61_g207111 = break59_g207111.z;
				float ifLocalVar62_g207111 = 0;
				if( temp_output_17_0_g207111 == 3.0 )
				ifLocalVar62_g207111 = break59_g207111.w;
				float3 temp_cast_4 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 temp_cast_5 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 linearToGamma402_g207086 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult385_g207086 = lerp( (Local_AlbedoTex185_g207086).w , (linearToGamma402_g207086).x , _MainAlphaSourceMode);
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch236_g207086 = ( lerpResult385_g207086 - _MainAlphaClipValue );
				#else
				float staticSwitch236_g207086 = lerpResult385_g207086;
				#endif
				half Local_AlphaClip111_g207086 = staticSwitch236_g207086;
				float In_AlphaClip3_g207090 = Local_AlphaClip111_g207086;
				half Local_AlphaFade246_g207086 = (lerpResult62_g207086).a;
				float In_AlphaFade3_g207090 = Local_AlphaFade246_g207086;
				float3 temp_cast_6 = (1.0).xxx;
				float3 In_Translucency3_g207090 = temp_cast_6;
				float In_Transmission3_g207090 = 1.0;
				float In_Thickness3_g207090 = 0.0;
				float In_Diffusion3_g207090 = 0.0;
				float In_Depth3_g207090 = 0.0;
				{
				Data3_g207090.Dummy = In_Dummy3_g207090;
				Data3_g207090.Albedo = In_Albedo3_g207090;
				Data3_g207090.AlbedoRaw = In_AlbedoRaw3_g207090;
				Data3_g207090.NormalTS = In_NormalTS3_g207090;
				Data3_g207090.NormalWS = In_NormalWS3_g207090;
				Data3_g207090.Shader = In_Shader3_g207090;
				Data3_g207090.Emissive= In_Emissive3_g207090;
				Data3_g207090.MultiMask = In_MultiMask3_g207090;
				Data3_g207090.Grayscale = In_Grayscale3_g207090;
				Data3_g207090.Luminosity = In_Luminosity3_g207090;
				Data3_g207090.AlphaClip = In_AlphaClip3_g207090;
				Data3_g207090.AlphaFade = In_AlphaFade3_g207090;
				Data3_g207090.Translucency = In_Translucency3_g207090;
				Data3_g207090.Transmission = In_Transmission3_g207090;
				Data3_g207090.Thickness = In_Thickness3_g207090;
				Data3_g207090.Diffusion = In_Diffusion3_g207090;
				Data3_g207090.Depth = In_Depth3_g207090;
				}
				TVEVisualData Data4_g207126 = Data3_g207090;
				float Out_Dummy4_g207126 = 0;
				float3 Out_Albedo4_g207126 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g207126 = float3( 0,0,0 );
				float2 Out_NormalTS4_g207126 = float2( 0,0 );
				float3 Out_NormalWS4_g207126 = float3( 0,0,0 );
				float4 Out_Shader4_g207126 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g207126 = float4( 0,0,0,0 );
				float Out_MultiMask4_g207126 = 0;
				float Out_Grayscale4_g207126 = 0;
				float Out_Luminosity4_g207126 = 0;
				float Out_AlphaClip4_g207126 = 0;
				float Out_AlphaFade4_g207126 = 0;
				float3 Out_Translucency4_g207126 = float3( 0,0,0 );
				float Out_Transmission4_g207126 = 0;
				float Out_Thickness4_g207126 = 0;
				float Out_Diffusion4_g207126 = 0;
				float Out_Depth4_g207126 = 0;
				{
				Out_Dummy4_g207126 = Data4_g207126.Dummy;
				Out_Albedo4_g207126 = Data4_g207126.Albedo;
				Out_AlbedoRaw4_g207126 = Data4_g207126.AlbedoRaw;
				Out_NormalTS4_g207126 = Data4_g207126.NormalTS;
				Out_NormalWS4_g207126 = Data4_g207126.NormalWS;
				Out_Shader4_g207126 = Data4_g207126.Shader;
				Out_Emissive4_g207126= Data4_g207126.Emissive;
				Out_MultiMask4_g207126 = Data4_g207126.MultiMask;
				Out_Grayscale4_g207126 = Data4_g207126.Grayscale;
				Out_Luminosity4_g207126= Data4_g207126.Luminosity;
				Out_AlphaClip4_g207126 = Data4_g207126.AlphaClip;
				Out_AlphaFade4_g207126 = Data4_g207126.AlphaFade;
				Out_Translucency4_g207126 = Data4_g207126.Translucency;
				Out_Transmission4_g207126 = Data4_g207126.Transmission;
				Out_Thickness4_g207126 = Data4_g207126.Thickness;
				Out_Diffusion4_g207126 = Data4_g207126.Diffusion;
				Out_Depth4_g207126= Data4_g207126.Depth;
				}
				half3 Input_Albedo24_g207125 = Out_Albedo4_g207126;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g207125 = half4( 0.2209163, 0.2209163, 0.2209163, 0.7790837 );
				#else
				float4 staticSwitch22_g207125 = half4( 0.04, 0.04, 0.04, 0.96 );
				#endif
				half4 ColorSpaceDielectricSpec23_g207125 = staticSwitch22_g207125;
				float4 break24_g207121 = Out_Shader4_g207126;
				half Metallic95_g207121 = break24_g207121.x;
				half Input_Metallic25_g207125 = Metallic95_g207121;
				half OneMinusReflectivity31_g207125 = ( (ColorSpaceDielectricSpec23_g207125).w - ( (ColorSpaceDielectricSpec23_g207125).w * Input_Metallic25_g207125 ) );
				
				float3 appendResult23_g207121 = (float3(Out_NormalTS4_g207126 , 1.0));
				float3 temp_output_13_0_g207124 = appendResult23_g207121;
				float3 temp_output_33_0_g207124 = ( temp_output_13_0_g207124 * _render_normal );
				float3 switchResult12_g207124 = (((IsFrontFace>0)?(temp_output_13_0_g207124):(temp_output_33_0_g207124)));
				
				float3 lerpResult28_g207125 = lerp( (ColorSpaceDielectricSpec23_g207125).xyz , Input_Albedo24_g207125 , Input_Metallic25_g207125);
				half RenderSpec102_g207121 = _RenderSpecular;
				
				float localCustomAlphaClip21_g207131 = ( 0.0 );
				float temp_output_3_0_g207131 = Out_AlphaClip4_g207126;
				float Alpha21_g207131 = temp_output_3_0_g207131;
				float temp_output_15_0_g207131 = 0.0;
				float Treshold21_g207131 = temp_output_15_0_g207131;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_CUTOUT) || defined (TVE_GLANCING) || defined (TVE_DITHER)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha21_g207131 - Treshold21_g207131);
				#endif
				#endif
				}
				

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;

				surfaceDescription.BaseColor = ( Input_Albedo24_g207125 * OneMinusReflectivity31_g207125 );
				surfaceDescription.Normal = switchResult12_g207124;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = ( lerpResult28_g207125 * RenderSpec102_g207121 );
				#endif

				surfaceDescription.Smoothness = break24_g207121.w;
				surfaceDescription.Occlusion = break24_g207121.y;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = saturate( ( Alpha21_g207131 * Out_AlphaFade4_g207126 ) );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif

				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
					#if defined( _WRITE_TRANSPARENT_MOTION_VECTOR )
						float3 positionOS = mul( GetWorldToObjectMatrix(),  float4( PositionRWS, 1.0 ) ).xyz;
						float3 previousPositionRWS = mul( GetPrevObjectToWorldMatrix(),  float4( positionOS, 1.0 ) ).xyz;
						packedInput.vpassPositionCS = mul( UNITY_MATRIX_UNJITTERED_VP, float4( PositionRWS, 1.0 ) ).xyw;
						packedInput.vpassPreviousPositionCS = mul( UNITY_MATRIX_PREV_VP, float4( previousPositionRWS, 1.0 ) ).xyw;
					#endif
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = input.positionSS.z;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);

				#ifdef DEBUG_DISPLAY
				#ifdef OUTPUT_SPLIT_LIGHTING
					outDiffuseLighting = float4(0, 0, 0, 1);
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#endif

			    bool viewMaterial = GetMaterialDebugColor(outColor, input, builtinData, posInput, surfaceData, bsdfData);

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);
						GetPBRValidatorDebug(surfaceData, result);
						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
                #endif
					{
                #ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
                #else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
                #endif
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;

						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

                #ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = float4(0, 0, 0, 1);
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
                #else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);

						#ifdef _ENABLE_FOG_ON_TRANSPARENT
                        outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
                        #endif

                        #ifdef _TRANSPARENT_REFRACTIVE_SORT
                        ComputeRefractionSplitColor(posInput, outColor, outBeforeRefractionColor, outBeforeRefractionAlpha);
                        #endif
                #endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);
						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
                #if defined(HAVE_VFX_MODIFICATION) && !VFX_FEATURE_MOTION_VECTORS
                        forceNoMotion = true;
                #endif
				        if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
				}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif

                #ifdef UNITY_VIRTUAL_TEXTURING
				    float vtAlphaValue = builtinData.opacity;
                    #if defined(HAS_REFRACTION) && HAS_REFRACTION
					vtAlphaValue = 1.0f - bsdfData.transmittanceMask;
                #endif
				outVTFeedback = PackVTFeedbackWithAlpha(builtinData.vtPackedFeedback, input.positionSS.xy, vtAlphaValue);
				outVTFeedback.rgb *= outVTFeedback.a; // premuliplied alpha
                #endif

			}
			ENDHLSL
		}

		
		Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull [_CullMode]

            HLSLPROGRAM
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#define ASE_FRAGMENT_NORMAL 0
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 170004
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma editor_sync_compilation
            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_TANGENT_TO_WORLD

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

            CBUFFER_START( UnityPerMaterial )
			half4 _MainOcclusionRemap;
			half4 _MainCoordValue;
			half4 _Color;
			half4 _MainColor;
			half4 _MainMultiRemap;
			half4 _main_coord_value;
			half4 _MainSmoothnessRemap;
			half4 _MainColorTwo;
			half3 _render_normal;
			half _MainMetallicChannelMode;
			half _MainAlbedoValue;
			half _MainSmoothnessInfo;
			half _MainMultiMaskInfo;
			half _MainCoordMode;
			half _MainSampleMode;
			half _MainMetallicSourceMode;
			half _MainMetallicValue;
			half _MainOcclusionSourceMode;
			half _MainEnd;
			half _MainOcclusionValue;
			half _MainSmoothnessChannelMode;
			half _MainSmoothnessSourceMode;
			half _MainSmoothnessValue;
			half _MainMultiChannelMode;
			half _MainMultiSourceMode;
			half _MainColorMode;
			half _MainNormalValue;
			half _MainAlphaChannelMode;
			half _MainAlphaSourceMode;
			half _MainAlphaClipValue;
			half _MainOcclusionChannelMode;
			half _render_src;
			half _MainCategory;
			half _RenderClip;
			half _render_cull;
			half _render_dst;
			half _render_zw;
			half _render_coverage;
			half _IsGeneralShader;
			half _RenderZWrite;
			half _IsVersion;
			half _RenderCategory;
			half _RenderEnd;
			half _RenderMode;
			half _RenderCull;
			half _RenderNormal;
			half _RenderBakeGI;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMotion;
			half _Cutoff;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderFilter;
			half _RenderShadow;
			half _IsStandardShader;
			half _RenderSpecular;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_Linear_Repeat);
			SAMPLER(sampler_Linear_Repeat_Aniso8);
			SAMPLER(sampler_Point_Repeat);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MainShaderTex);
			TEXTURE2D(_MainMetallicTex);
			TEXTURE2D(_MainOcclusionTex);
			TEXTURE2D(_MainSmoothnessTex);
			TEXTURE2D(_MainMultiTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_MainAlphaTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local_fragment TVE_FILTER_DEFAULT TVE_FILTER_POINT TVE_FILTER_LOW TVE_FILTER_MEDIUM TVE_FILTER_HIGH
			#pragma shader_feature_local_fragment TVE_MAIN_SAMPLE_MAIN_UV TVE_MAIN_SAMPLE_EXTRA_UV TVE_MAIN_SAMPLE_PLANAR_2D TVE_MAIN_SAMPLE_PLANAR_3D TVE_MAIN_SAMPLE_STOCHASTIC_2D TVE_MAIN_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_vertex TVE_PIVOT_OFF TVE_PIVOT_BAKED TVE_PIVOT_PROC
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			#define TVE_GEOMETRY_SHADER
			//#pragma editor_sync_compilation
			#ifndef ASE_NEEDS_TEXTURE_COORDINATES2 //Needed for ASE 1.9.8.1
				#define ASE_NEEDS_TEXTURE_COORDINATES2
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			void ComputeWorldCoords( half4 Coords, half3 WorldPosition, out half2 ZX, out half2 ZY, out half2 XY )
			{
				ZX = WorldPosition.xz * Coords.xx - Coords.zz;
				ZY = WorldPosition.yz * Coords.yx - Coords.wz; 
				XY = WorldPosition.xy * Coords.xy - Coords.zw;
			}
			
			half4 SampleMain( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SampleExtra( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			half4 SamplePlanar2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			void ComputeTriplanarWeights( half3 WorldNormal, out half T1, out half T2, out half T3 )
			{
				half3 powNormal = abs( WorldNormal.xyz );
				half3 weights = max( powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal, 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				T1 = weights.y;
				T2 = weights.x;
				T3 = weights.z;
			}
			
			half4 SamplePlanar3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				half4 tex1 = SAMPLE_TEXTURE2D( Texture, Sampler, ZX);
				half4 tex2 = SAMPLE_TEXTURE2D( Texture, Sampler, ZY);
				half4 tex3 = SAMPLE_TEXTURE2D( Texture, Sampler, XY);
				return tex1 * T1 + tex2 * T2 + tex3 * T3;
			}
			
			void ComputeStochasticCoords( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				half2 vertex1, vertex2, vertex3;
				// Scaling of the input
				half2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				half2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				half3 temp = half3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float4 SampleStochastic2D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				ComputeStochasticCoords(UV, UV1, UV2, UV3, W1, W2, W3 );
				half4 tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(UV), ddy(UV));
				half4 tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(UV), ddy(UV));
				half4 tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(UV), ddy(UV));
				return tex1 * W1 + tex2 * W2 + tex3 * W3;
			}
			
			half4 SampleStochastic3D( TEXTURE2D(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				half4 tex1, tex2, tex3;
				ComputeStochasticCoords(ZX, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZX), ddy(ZX));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZX), ddy(ZX));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZX), ddy(ZX));
				half4 texZX = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(ZY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZY), ddy(ZY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZY), ddy(ZY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZY), ddy(ZY));
				half4 texZY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(XY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(XY), ddy(XY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(XY), ddy(XY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(XY), ddy(XY));
				half4 texXY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				return texZX * T1 + texZY * T2 + texXY * T3;
			}
			

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(PickingSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

                #ifdef DEBUG_DISPLAY
                if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                {
                    surfaceDescription.Alpha = 1.0f;
                }
                #endif

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                //BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);

            }

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float3 vertexToFrag73_g205214 = ase_positionWS;
				output.ase_texcoord4.xyz = vertexToFrag73_g205214;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205224 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205224 = ( localObjectPosition_UNITY_MATRIX_M14_g205224 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205224 = localObjectPosition_UNITY_MATRIX_M14_g205224;
				#endif
				float3 temp_output_340_7_g205214 = staticSwitch13_g205224;
				float3 localObjectPosition_UNITY_MATRIX_M14_g205226 = ObjectPosition_UNITY_MATRIX_M();
				float3 _Vector0 = float3(0,0,0);
				float3 appendResult60_g205222 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 PositionOS131_g205214 = inputMesh.positionOS;
				float3 break233_g205214 = PositionOS131_g205214;
				float3 appendResult234_g205214 = (float3(break233_g205214.x , 0.0 , break233_g205214.z));
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch229_g205214 = _Vector0;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch229_g205214 = appendResult60_g205222;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch229_g205214 = appendResult234_g205214;
				#else
				float3 staticSwitch229_g205214 = _Vector0;
				#endif
				half3 PivotOS149_g205214 = staticSwitch229_g205214;
				float3 temp_output_122_0_g205226 = PivotOS149_g205214;
				float3 PivotsOnlyWS105_g205226 = mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g205226 , 0.0 ) ).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g205226 = ( ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g205226 = ( localObjectPosition_UNITY_MATRIX_M14_g205226 + PivotsOnlyWS105_g205226 );
				#endif
				float3 temp_output_341_7_g205214 = staticSwitch13_g205226;
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch236_g205214 = temp_output_341_7_g205214;
				#else
				float3 staticSwitch236_g205214 = temp_output_340_7_g205214;
				#endif
				float3 vertexToFrag76_g205214 = staticSwitch236_g205214;
				output.ase_texcoord5.xyz = vertexToFrag76_g205214;
				
				output.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				output.ase_texcoord3.zw = inputMesh.ase_texcoord2.xy;
				output.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half isFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];

				float localCustomAlphaClip21_g207131 = ( 0.0 );
				float localBreakData4_g207126 = ( 0.0 );
				float localCompData3_g207090 = ( 0.0 );
				TVEVisualData Data3_g207090 = (TVEVisualData)0;
				half4 Dummy130_g207086 = ( _MainCategory + _MainEnd + ( _MainSampleMode + _MainCoordMode + _MainCoordValue ) + _MainMultiMaskInfo + _MainSmoothnessInfo );
				float In_Dummy3_g207090 = Dummy130_g207086.x;
				TEXTURE2D(Texture276_g207087) = _MainAlbedoTex;
				float localFilterTexture19_g207095 = ( 0.0 );
				SamplerState SS19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207095 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207095 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207095 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207095 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207095 = SamplerDefault19_g207095;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207095 = SamplerDefault19_g207095;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207095 = SamplerPoint19_g207095;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207095 = SamplerLow19_g207095;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207095 = SamplerMedium19_g207095;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207095 = SamplerHigh19_g207095;
				#endif
				}
				SamplerState Sampler276_g207087 = SS19_g207095;
				half4 Local_Coords180_g207086 = _main_coord_value;
				float4 temp_output_37_0_g207087 = Local_Coords180_g207086;
				half4 Coords276_g207087 = temp_output_37_0_g207087;
				half2 TexCoord276_g207087 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207087 = SampleMain( Texture276_g207087 , Sampler276_g207087 , Coords276_g207087 , TexCoord276_g207087 );
				TEXTURE2D(Texture275_g207087) = _MainAlbedoTex;
				SamplerState Sampler275_g207087 = SS19_g207095;
				half4 Coords275_g207087 = temp_output_37_0_g207087;
				half2 TexCoord275_g207087 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207087 = SampleExtra( Texture275_g207087 , Sampler275_g207087 , Coords275_g207087 , TexCoord275_g207087 );
				TEXTURE2D(Texture238_g207087) = _MainAlbedoTex;
				SamplerState Sampler238_g207087 = SS19_g207095;
				half4 Coords238_g207087 = temp_output_37_0_g207087;
				TVEModelData Data16_g205219 = (TVEModelData)0;
				float In_Dummy16_g205219 = 0.0;
				float3 vertexToFrag73_g205214 = packedInput.ase_texcoord4.xyz;
				half3 PositionWS122_g205214 = vertexToFrag73_g205214;
				float3 In_PositionWS16_g205219 = PositionWS122_g205214;
				float3 vertexToFrag76_g205214 = packedInput.ase_texcoord5.xyz;
				half3 PivotWS121_g205214 = vertexToFrag76_g205214;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g205214 = ( PositionWS122_g205214 - PivotWS121_g205214 );
				#else
				float3 staticSwitch204_g205214 = PositionWS122_g205214;
				#endif
				half3 PositionWO132_g205214 = ( staticSwitch204_g205214 - TVE_WorldOrigin );
				float3 In_PositionWO16_g205219 = PositionWO132_g205214;
				float3 In_PivotWS16_g205219 = PivotWS121_g205214;
				half3 PivotWO133_g205214 = ( PivotWS121_g205214 - TVE_WorldOrigin );
				float3 In_PivotWO16_g205219 = PivotWO133_g205214;
				float3 normalizedWorldNormal = normalize( NormalWS );
				half3 Normal_WS95_g205214 = normalizedWorldNormal;
				float3 In_NormalWS16_g205219 = Normal_WS95_g205214;
				float3 normalizeResult296_g205214 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g205214 ) );
				half3 ViewDirWS169_g205214 = normalizeResult296_g205214;
				float3 In_ViewDirWS16_g205219 = ViewDirWS169_g205214;
				half4 VertexMasks171_g205214 = packedInput.ase_color;
				float4 In_VertexData16_g205219 = VertexMasks171_g205214;
				float4 In_BoundsData16_g205219 = float4( 1,1,1,1 );
				{
				Data16_g205219.Dummy = In_Dummy16_g205219;
				Data16_g205219.PositionWS = In_PositionWS16_g205219;
				Data16_g205219.PositionWO = In_PositionWO16_g205219;
				Data16_g205219.PivotWS = In_PivotWS16_g205219;
				Data16_g205219.PivotWO = In_PivotWO16_g205219;
				Data16_g205219.NormalWS = In_NormalWS16_g205219;
				Data16_g205219.ViewDirWS = In_ViewDirWS16_g205219;
				Data16_g205219.VertexData = In_VertexData16_g205219;
				Data16_g205219.BoundsData = In_BoundsData16_g205219;
				}
				TVEModelData Data15_g207089 = Data16_g205219;
				float Out_Dummy15_g207089 = 0;
				float3 Out_PositionWS15_g207089 = float3( 0,0,0 );
				float3 Out_PositionWO15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWS15_g207089 = float3( 0,0,0 );
				float3 Out_PivotWO15_g207089 = float3( 0,0,0 );
				float3 Out_NormalWS15_g207089 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g207089 = float3( 0,0,0 );
				float4 Out_VertexData15_g207089 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g207089 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g207089 = Data15_g207089.Dummy;
				Out_PositionWS15_g207089 = Data15_g207089.PositionWS;
				Out_PositionWO15_g207089 = Data15_g207089.PositionWO;
				Out_PivotWS15_g207089 = Data15_g207089.PivotWS;
				Out_PivotWO15_g207089 = Data15_g207089.PivotWO;
				Out_NormalWS15_g207089 = Data15_g207089.NormalWS;
				Out_ViewDirWS15_g207089 = Data15_g207089.ViewDirWS;
				Out_VertexData15_g207089 = Data15_g207089.VertexData;
				Out_BoundsData15_g207089 = Data15_g207089.BoundsData;
				}
				half3 Model_PositionWO222_g207086 = Out_PositionWO15_g207089;
				float3 temp_output_279_0_g207087 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207087 = temp_output_279_0_g207087;
				half4 localSamplePlanar2D238_g207087 = SamplePlanar2D( Texture238_g207087 , Sampler238_g207087 , Coords238_g207087 , WorldPosition238_g207087 );
				TEXTURE2D(Texture246_g207087) = _MainAlbedoTex;
				SamplerState Sampler246_g207087 = SS19_g207095;
				half4 Coords246_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition246_g207087 = temp_output_279_0_g207087;
				half3 Model_NormalWS226_g207086 = Out_NormalWS15_g207089;
				float3 temp_output_280_0_g207087 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207087 = temp_output_280_0_g207087;
				half4 localSamplePlanar3D246_g207087 = SamplePlanar3D( Texture246_g207087 , Sampler246_g207087 , Coords246_g207087 , WorldPosition246_g207087 , WorldNormal246_g207087 );
				TEXTURE2D(Texture234_g207087) = _MainAlbedoTex;
				SamplerState Sampler234_g207087 = SS19_g207095;
				float4 Coords234_g207087 = temp_output_37_0_g207087;
				float3 WorldPosition234_g207087 = temp_output_279_0_g207087;
				float4 localSampleStochastic2D234_g207087 = SampleStochastic2D( Texture234_g207087 , Sampler234_g207087 , Coords234_g207087 , WorldPosition234_g207087 );
				TEXTURE2D(Texture263_g207087) = _MainAlbedoTex;
				SamplerState Sampler263_g207087 = SS19_g207095;
				half4 Coords263_g207087 = temp_output_37_0_g207087;
				half3 WorldPosition263_g207087 = temp_output_279_0_g207087;
				half3 WorldNormal263_g207087 = temp_output_280_0_g207087;
				half4 localSampleStochastic3D263_g207087 = SampleStochastic3D( Texture263_g207087 , Sampler263_g207087 , Coords263_g207087 , WorldPosition263_g207087 , WorldNormal263_g207087 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch184_g207086 = localSampleExtra275_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch184_g207086 = localSamplePlanar2D238_g207087;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch184_g207086 = localSamplePlanar3D246_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch184_g207086 = localSampleStochastic2D234_g207087;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch184_g207086 = localSampleStochastic3D263_g207087;
				#else
				float4 staticSwitch184_g207086 = localSampleMain276_g207087;
				#endif
				half4 Local_AlbedoTex185_g207086 = staticSwitch184_g207086;
				float3 lerpResult53_g207086 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex185_g207086).xyz , _MainAlbedoValue);
				half3 Local_AlbedoRGB107_g207086 = lerpResult53_g207086;
				TEXTURE2D(Texture276_g207096) = _MainShaderTex;
				float localFilterTexture30_g207097 = ( 0.0 );
				SamplerState SS30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207097 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207097 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207097 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207097 = SamplerDefault30_g207097;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207097 = SamplerDefault30_g207097;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207097 = SamplerPoint30_g207097;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207097 = SamplerLow30_g207097;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207097 = SamplerMedium30_g207097;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207097 = SamplerHigh30_g207097;
				#endif
				}
				SamplerState Sampler276_g207096 = SS30_g207097;
				float4 temp_output_37_0_g207096 = Local_Coords180_g207086;
				half4 Coords276_g207096 = temp_output_37_0_g207096;
				half2 TexCoord276_g207096 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207096 = SampleMain( Texture276_g207096 , Sampler276_g207096 , Coords276_g207096 , TexCoord276_g207096 );
				TEXTURE2D(Texture275_g207096) = _MainShaderTex;
				SamplerState Sampler275_g207096 = SS30_g207097;
				half4 Coords275_g207096 = temp_output_37_0_g207096;
				half2 TexCoord275_g207096 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207096 = SampleExtra( Texture275_g207096 , Sampler275_g207096 , Coords275_g207096 , TexCoord275_g207096 );
				TEXTURE2D(Texture238_g207096) = _MainShaderTex;
				SamplerState Sampler238_g207096 = SS30_g207097;
				half4 Coords238_g207096 = temp_output_37_0_g207096;
				float3 temp_output_279_0_g207096 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207096 = temp_output_279_0_g207096;
				half4 localSamplePlanar2D238_g207096 = SamplePlanar2D( Texture238_g207096 , Sampler238_g207096 , Coords238_g207096 , WorldPosition238_g207096 );
				TEXTURE2D(Texture246_g207096) = _MainShaderTex;
				SamplerState Sampler246_g207096 = SS30_g207097;
				half4 Coords246_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition246_g207096 = temp_output_279_0_g207096;
				float3 temp_output_280_0_g207096 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207096 = temp_output_280_0_g207096;
				half4 localSamplePlanar3D246_g207096 = SamplePlanar3D( Texture246_g207096 , Sampler246_g207096 , Coords246_g207096 , WorldPosition246_g207096 , WorldNormal246_g207096 );
				TEXTURE2D(Texture234_g207096) = _MainShaderTex;
				SamplerState Sampler234_g207096 = SS30_g207097;
				float4 Coords234_g207096 = temp_output_37_0_g207096;
				float3 WorldPosition234_g207096 = temp_output_279_0_g207096;
				float4 localSampleStochastic2D234_g207096 = SampleStochastic2D( Texture234_g207096 , Sampler234_g207096 , Coords234_g207096 , WorldPosition234_g207096 );
				TEXTURE2D(Texture263_g207096) = _MainShaderTex;
				SamplerState Sampler263_g207096 = SS30_g207097;
				half4 Coords263_g207096 = temp_output_37_0_g207096;
				half3 WorldPosition263_g207096 = temp_output_279_0_g207096;
				half3 WorldNormal263_g207096 = temp_output_280_0_g207096;
				half4 localSampleStochastic3D263_g207096 = SampleStochastic3D( Texture263_g207096 , Sampler263_g207096 , Coords263_g207096 , WorldPosition263_g207096 , WorldNormal263_g207096 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch198_g207086 = localSampleExtra275_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch198_g207086 = localSamplePlanar2D238_g207096;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch198_g207086 = localSamplePlanar3D246_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch198_g207086 = localSampleStochastic2D234_g207096;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch198_g207086 = localSampleStochastic3D263_g207096;
				#else
				float4 staticSwitch198_g207086 = localSampleMain276_g207096;
				#endif
				half4 Local_ShaderTex199_g207086 = staticSwitch198_g207086;
				float temp_output_17_0_g207112 = _MainMetallicChannelMode;
				TEXTURE2D(Texture276_g207100) = _MainMetallicTex;
				float localFilterTexture30_g207101 = ( 0.0 );
				SamplerState SS30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207101 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207101 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207101 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207101 = SamplerDefault30_g207101;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207101 = SamplerDefault30_g207101;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207101 = SamplerPoint30_g207101;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207101 = SamplerLow30_g207101;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207101 = SamplerMedium30_g207101;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207101 = SamplerHigh30_g207101;
				#endif
				}
				SamplerState Sampler276_g207100 = SS30_g207101;
				float4 temp_output_37_0_g207100 = Local_Coords180_g207086;
				half4 Coords276_g207100 = temp_output_37_0_g207100;
				half2 TexCoord276_g207100 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207100 = SampleMain( Texture276_g207100 , Sampler276_g207100 , Coords276_g207100 , TexCoord276_g207100 );
				TEXTURE2D(Texture275_g207100) = _MainMetallicTex;
				SamplerState Sampler275_g207100 = SS30_g207101;
				half4 Coords275_g207100 = temp_output_37_0_g207100;
				half2 TexCoord275_g207100 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207100 = SampleExtra( Texture275_g207100 , Sampler275_g207100 , Coords275_g207100 , TexCoord275_g207100 );
				TEXTURE2D(Texture238_g207100) = _MainMetallicTex;
				SamplerState Sampler238_g207100 = SS30_g207101;
				half4 Coords238_g207100 = temp_output_37_0_g207100;
				float3 temp_output_279_0_g207100 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207100 = temp_output_279_0_g207100;
				half4 localSamplePlanar2D238_g207100 = SamplePlanar2D( Texture238_g207100 , Sampler238_g207100 , Coords238_g207100 , WorldPosition238_g207100 );
				TEXTURE2D(Texture246_g207100) = _MainMetallicTex;
				SamplerState Sampler246_g207100 = SS30_g207101;
				half4 Coords246_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition246_g207100 = temp_output_279_0_g207100;
				float3 temp_output_280_0_g207100 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207100 = temp_output_280_0_g207100;
				half4 localSamplePlanar3D246_g207100 = SamplePlanar3D( Texture246_g207100 , Sampler246_g207100 , Coords246_g207100 , WorldPosition246_g207100 , WorldNormal246_g207100 );
				TEXTURE2D(Texture234_g207100) = _MainMetallicTex;
				SamplerState Sampler234_g207100 = SS30_g207101;
				float4 Coords234_g207100 = temp_output_37_0_g207100;
				float3 WorldPosition234_g207100 = temp_output_279_0_g207100;
				float4 localSampleStochastic2D234_g207100 = SampleStochastic2D( Texture234_g207100 , Sampler234_g207100 , Coords234_g207100 , WorldPosition234_g207100 );
				TEXTURE2D(Texture263_g207100) = _MainMetallicTex;
				SamplerState Sampler263_g207100 = SS30_g207101;
				half4 Coords263_g207100 = temp_output_37_0_g207100;
				half3 WorldPosition263_g207100 = temp_output_279_0_g207100;
				half3 WorldNormal263_g207100 = temp_output_280_0_g207100;
				half4 localSampleStochastic3D263_g207100 = SampleStochastic3D( Texture263_g207100 , Sampler263_g207100 , Coords263_g207100 , WorldPosition263_g207100 , WorldNormal263_g207100 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch335_g207086 = localSampleExtra275_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch335_g207086 = localSamplePlanar2D238_g207100;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch335_g207086 = localSamplePlanar3D246_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch335_g207086 = localSampleStochastic2D234_g207100;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch335_g207086 = localSampleStochastic3D263_g207100;
				#else
				float4 staticSwitch335_g207086 = localSampleMain276_g207100;
				#endif
				half4 Local_MetallicTex341_g207086 = staticSwitch335_g207086;
				float4 break59_g207112 = Local_MetallicTex341_g207086;
				float ifLocalVar58_g207112 = 0;
				if( temp_output_17_0_g207112 == 0.0 )
				ifLocalVar58_g207112 = break59_g207112.x;
				float ifLocalVar60_g207112 = 0;
				if( temp_output_17_0_g207112 == 1.0 )
				ifLocalVar60_g207112 = break59_g207112.y;
				float ifLocalVar61_g207112 = 0;
				if( temp_output_17_0_g207112 == 2.0 )
				ifLocalVar61_g207112 = break59_g207112.z;
				float ifLocalVar62_g207112 = 0;
				if( temp_output_17_0_g207112 == 3.0 )
				ifLocalVar62_g207112 = break59_g207112.w;
				float lerpResult366_g207086 = lerp( (Local_ShaderTex199_g207086).x , ( ifLocalVar58_g207112 + ifLocalVar60_g207112 + ifLocalVar61_g207112 + ifLocalVar62_g207112 ) , _MainMetallicSourceMode);
				half Local_Metallic322_g207086 = ( lerpResult366_g207086 * _MainMetallicValue );
				float temp_output_17_0_g207113 = _MainOcclusionChannelMode;
				TEXTURE2D(Texture276_g207102) = _MainOcclusionTex;
				float localFilterTexture30_g207108 = ( 0.0 );
				SamplerState SS30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207108 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207108 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207108 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207108 = SamplerDefault30_g207108;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207108 = SamplerDefault30_g207108;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207108 = SamplerPoint30_g207108;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207108 = SamplerLow30_g207108;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207108 = SamplerMedium30_g207108;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207108 = SamplerHigh30_g207108;
				#endif
				}
				SamplerState Sampler276_g207102 = SS30_g207108;
				float4 temp_output_37_0_g207102 = Local_Coords180_g207086;
				half4 Coords276_g207102 = temp_output_37_0_g207102;
				half2 TexCoord276_g207102 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207102 = SampleMain( Texture276_g207102 , Sampler276_g207102 , Coords276_g207102 , TexCoord276_g207102 );
				TEXTURE2D(Texture275_g207102) = _MainOcclusionTex;
				SamplerState Sampler275_g207102 = SS30_g207108;
				half4 Coords275_g207102 = temp_output_37_0_g207102;
				half2 TexCoord275_g207102 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207102 = SampleExtra( Texture275_g207102 , Sampler275_g207102 , Coords275_g207102 , TexCoord275_g207102 );
				TEXTURE2D(Texture238_g207102) = _MainOcclusionTex;
				SamplerState Sampler238_g207102 = SS30_g207108;
				half4 Coords238_g207102 = temp_output_37_0_g207102;
				float3 temp_output_279_0_g207102 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207102 = temp_output_279_0_g207102;
				half4 localSamplePlanar2D238_g207102 = SamplePlanar2D( Texture238_g207102 , Sampler238_g207102 , Coords238_g207102 , WorldPosition238_g207102 );
				TEXTURE2D(Texture246_g207102) = _MainOcclusionTex;
				SamplerState Sampler246_g207102 = SS30_g207108;
				half4 Coords246_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition246_g207102 = temp_output_279_0_g207102;
				float3 temp_output_280_0_g207102 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207102 = temp_output_280_0_g207102;
				half4 localSamplePlanar3D246_g207102 = SamplePlanar3D( Texture246_g207102 , Sampler246_g207102 , Coords246_g207102 , WorldPosition246_g207102 , WorldNormal246_g207102 );
				TEXTURE2D(Texture234_g207102) = _MainOcclusionTex;
				SamplerState Sampler234_g207102 = SS30_g207108;
				float4 Coords234_g207102 = temp_output_37_0_g207102;
				float3 WorldPosition234_g207102 = temp_output_279_0_g207102;
				float4 localSampleStochastic2D234_g207102 = SampleStochastic2D( Texture234_g207102 , Sampler234_g207102 , Coords234_g207102 , WorldPosition234_g207102 );
				TEXTURE2D(Texture263_g207102) = _MainOcclusionTex;
				SamplerState Sampler263_g207102 = SS30_g207108;
				half4 Coords263_g207102 = temp_output_37_0_g207102;
				half3 WorldPosition263_g207102 = temp_output_279_0_g207102;
				half3 WorldNormal263_g207102 = temp_output_280_0_g207102;
				half4 localSampleStochastic3D263_g207102 = SampleStochastic3D( Texture263_g207102 , Sampler263_g207102 , Coords263_g207102 , WorldPosition263_g207102 , WorldNormal263_g207102 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch343_g207086 = localSampleExtra275_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch343_g207086 = localSamplePlanar2D238_g207102;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch343_g207086 = localSamplePlanar3D246_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch343_g207086 = localSampleStochastic2D234_g207102;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch343_g207086 = localSampleStochastic3D263_g207102;
				#else
				float4 staticSwitch343_g207086 = localSampleMain276_g207102;
				#endif
				half4 Local_OcclusionTex349_g207086 = staticSwitch343_g207086;
				float4 break59_g207113 = Local_OcclusionTex349_g207086;
				float ifLocalVar58_g207113 = 0;
				if( temp_output_17_0_g207113 == 0.0 )
				ifLocalVar58_g207113 = break59_g207113.x;
				float ifLocalVar60_g207113 = 0;
				if( temp_output_17_0_g207113 == 1.0 )
				ifLocalVar60_g207113 = break59_g207113.y;
				float ifLocalVar61_g207113 = 0;
				if( temp_output_17_0_g207113 == 2.0 )
				ifLocalVar61_g207113 = break59_g207113.z;
				float ifLocalVar62_g207113 = 0;
				if( temp_output_17_0_g207113 == 3.0 )
				ifLocalVar62_g207113 = break59_g207113.w;
				float lerpResult373_g207086 = lerp( (Local_ShaderTex199_g207086).y , ( ifLocalVar58_g207113 + ifLocalVar60_g207113 + ifLocalVar61_g207113 + ifLocalVar62_g207113 ) , _MainOcclusionSourceMode);
				float clampResult17_g207110 = clamp( lerpResult373_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207109 = _MainOcclusionRemap.x;
				float temp_output_9_0_g207109 = ( clampResult17_g207110 - temp_output_7_0_g207109 );
				float lerpResult23_g207086 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g207109 * _MainOcclusionRemap.z ) + 0.0001 ) ) , _MainOcclusionValue);
				half Local_Occlusion313_g207086 = lerpResult23_g207086;
				float temp_output_17_0_g207115 = _MainSmoothnessChannelMode;
				TEXTURE2D(Texture276_g207105) = _MainSmoothnessTex;
				float localFilterTexture30_g207106 = ( 0.0 );
				SamplerState SS30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207106 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207106 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207106 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207106 = SamplerDefault30_g207106;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207106 = SamplerDefault30_g207106;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207106 = SamplerPoint30_g207106;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207106 = SamplerLow30_g207106;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207106 = SamplerMedium30_g207106;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207106 = SamplerHigh30_g207106;
				#endif
				}
				SamplerState Sampler276_g207105 = SS30_g207106;
				float4 temp_output_37_0_g207105 = Local_Coords180_g207086;
				half4 Coords276_g207105 = temp_output_37_0_g207105;
				half2 TexCoord276_g207105 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207105 = SampleMain( Texture276_g207105 , Sampler276_g207105 , Coords276_g207105 , TexCoord276_g207105 );
				TEXTURE2D(Texture275_g207105) = _MainSmoothnessTex;
				SamplerState Sampler275_g207105 = SS30_g207106;
				half4 Coords275_g207105 = temp_output_37_0_g207105;
				half2 TexCoord275_g207105 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207105 = SampleExtra( Texture275_g207105 , Sampler275_g207105 , Coords275_g207105 , TexCoord275_g207105 );
				TEXTURE2D(Texture238_g207105) = _MainSmoothnessTex;
				SamplerState Sampler238_g207105 = SS30_g207106;
				half4 Coords238_g207105 = temp_output_37_0_g207105;
				float3 temp_output_279_0_g207105 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207105 = temp_output_279_0_g207105;
				half4 localSamplePlanar2D238_g207105 = SamplePlanar2D( Texture238_g207105 , Sampler238_g207105 , Coords238_g207105 , WorldPosition238_g207105 );
				TEXTURE2D(Texture246_g207105) = _MainSmoothnessTex;
				SamplerState Sampler246_g207105 = SS30_g207106;
				half4 Coords246_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition246_g207105 = temp_output_279_0_g207105;
				float3 temp_output_280_0_g207105 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207105 = temp_output_280_0_g207105;
				half4 localSamplePlanar3D246_g207105 = SamplePlanar3D( Texture246_g207105 , Sampler246_g207105 , Coords246_g207105 , WorldPosition246_g207105 , WorldNormal246_g207105 );
				TEXTURE2D(Texture234_g207105) = _MainSmoothnessTex;
				SamplerState Sampler234_g207105 = SS30_g207106;
				float4 Coords234_g207105 = temp_output_37_0_g207105;
				float3 WorldPosition234_g207105 = temp_output_279_0_g207105;
				float4 localSampleStochastic2D234_g207105 = SampleStochastic2D( Texture234_g207105 , Sampler234_g207105 , Coords234_g207105 , WorldPosition234_g207105 );
				TEXTURE2D(Texture263_g207105) = _MainSmoothnessTex;
				SamplerState Sampler263_g207105 = SS30_g207106;
				half4 Coords263_g207105 = temp_output_37_0_g207105;
				half3 WorldPosition263_g207105 = temp_output_279_0_g207105;
				half3 WorldNormal263_g207105 = temp_output_280_0_g207105;
				half4 localSampleStochastic3D263_g207105 = SampleStochastic3D( Texture263_g207105 , Sampler263_g207105 , Coords263_g207105 , WorldPosition263_g207105 , WorldNormal263_g207105 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch359_g207086 = localSampleExtra275_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch359_g207086 = localSamplePlanar2D238_g207105;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch359_g207086 = localSamplePlanar3D246_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch359_g207086 = localSampleStochastic2D234_g207105;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch359_g207086 = localSampleStochastic3D263_g207105;
				#else
				float4 staticSwitch359_g207086 = localSampleMain276_g207105;
				#endif
				half4 Local_SmoothnessTex365_g207086 = staticSwitch359_g207086;
				float4 break59_g207115 = Local_SmoothnessTex365_g207086;
				float ifLocalVar58_g207115 = 0;
				if( temp_output_17_0_g207115 == 0.0 )
				ifLocalVar58_g207115 = break59_g207115.x;
				float ifLocalVar60_g207115 = 0;
				if( temp_output_17_0_g207115 == 1.0 )
				ifLocalVar60_g207115 = break59_g207115.y;
				float ifLocalVar61_g207115 = 0;
				if( temp_output_17_0_g207115 == 2.0 )
				ifLocalVar61_g207115 = break59_g207115.z;
				float ifLocalVar62_g207115 = 0;
				if( temp_output_17_0_g207115 == 3.0 )
				ifLocalVar62_g207115 = break59_g207115.w;
				float3 temp_cast_2 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 temp_cast_3 = (( ifLocalVar58_g207115 + ifLocalVar60_g207115 + ifLocalVar61_g207115 + ifLocalVar62_g207115 )).xxx;
				float3 linearToGamma404_g207086 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult374_g207086 = lerp( (Local_ShaderTex199_g207086).w , (linearToGamma404_g207086).x , _MainSmoothnessSourceMode);
				float clampResult17_g207119 = clamp( lerpResult374_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207118 = _MainSmoothnessRemap.x;
				float temp_output_9_0_g207118 = ( clampResult17_g207119 - temp_output_7_0_g207118 );
				half Local_Smoothness317_g207086 = ( saturate( ( ( temp_output_9_0_g207118 * _MainSmoothnessRemap.z ) + 0.0001 ) ) * _MainSmoothnessValue );
				float4 appendResult73_g207086 = (float4(Local_Metallic322_g207086 , Local_Occlusion313_g207086 , 0.0 , Local_Smoothness317_g207086));
				half4 Local_Masks109_g207086 = appendResult73_g207086;
				float temp_output_17_0_g207114 = _MainMultiChannelMode;
				TEXTURE2D(Texture276_g207103) = _MainMultiTex;
				float localFilterTexture30_g207104 = ( 0.0 );
				SamplerState SS30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g207104 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g207104 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g207104 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g207104 = SamplerDefault30_g207104;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g207104 = SamplerDefault30_g207104;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g207104 = SamplerPoint30_g207104;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g207104 = SamplerLow30_g207104;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g207104 = SamplerMedium30_g207104;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g207104 = SamplerHigh30_g207104;
				#endif
				}
				SamplerState Sampler276_g207103 = SS30_g207104;
				float4 temp_output_37_0_g207103 = Local_Coords180_g207086;
				half4 Coords276_g207103 = temp_output_37_0_g207103;
				half2 TexCoord276_g207103 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207103 = SampleMain( Texture276_g207103 , Sampler276_g207103 , Coords276_g207103 , TexCoord276_g207103 );
				TEXTURE2D(Texture275_g207103) = _MainMultiTex;
				SamplerState Sampler275_g207103 = SS30_g207104;
				half4 Coords275_g207103 = temp_output_37_0_g207103;
				half2 TexCoord275_g207103 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207103 = SampleExtra( Texture275_g207103 , Sampler275_g207103 , Coords275_g207103 , TexCoord275_g207103 );
				TEXTURE2D(Texture238_g207103) = _MainMultiTex;
				SamplerState Sampler238_g207103 = SS30_g207104;
				half4 Coords238_g207103 = temp_output_37_0_g207103;
				float3 temp_output_279_0_g207103 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207103 = temp_output_279_0_g207103;
				half4 localSamplePlanar2D238_g207103 = SamplePlanar2D( Texture238_g207103 , Sampler238_g207103 , Coords238_g207103 , WorldPosition238_g207103 );
				TEXTURE2D(Texture246_g207103) = _MainMultiTex;
				SamplerState Sampler246_g207103 = SS30_g207104;
				half4 Coords246_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition246_g207103 = temp_output_279_0_g207103;
				float3 temp_output_280_0_g207103 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207103 = temp_output_280_0_g207103;
				half4 localSamplePlanar3D246_g207103 = SamplePlanar3D( Texture246_g207103 , Sampler246_g207103 , Coords246_g207103 , WorldPosition246_g207103 , WorldNormal246_g207103 );
				TEXTURE2D(Texture234_g207103) = _MainMultiTex;
				SamplerState Sampler234_g207103 = SS30_g207104;
				float4 Coords234_g207103 = temp_output_37_0_g207103;
				float3 WorldPosition234_g207103 = temp_output_279_0_g207103;
				float4 localSampleStochastic2D234_g207103 = SampleStochastic2D( Texture234_g207103 , Sampler234_g207103 , Coords234_g207103 , WorldPosition234_g207103 );
				TEXTURE2D(Texture263_g207103) = _MainMultiTex;
				SamplerState Sampler263_g207103 = SS30_g207104;
				half4 Coords263_g207103 = temp_output_37_0_g207103;
				half3 WorldPosition263_g207103 = temp_output_279_0_g207103;
				half3 WorldNormal263_g207103 = temp_output_280_0_g207103;
				half4 localSampleStochastic3D263_g207103 = SampleStochastic3D( Texture263_g207103 , Sampler263_g207103 , Coords263_g207103 , WorldPosition263_g207103 , WorldNormal263_g207103 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch351_g207086 = localSampleExtra275_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch351_g207086 = localSamplePlanar2D238_g207103;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch351_g207086 = localSamplePlanar3D246_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch351_g207086 = localSampleStochastic2D234_g207103;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch351_g207086 = localSampleStochastic3D263_g207103;
				#else
				float4 staticSwitch351_g207086 = localSampleMain276_g207103;
				#endif
				half4 Local_MultiTex357_g207086 = staticSwitch351_g207086;
				float4 break59_g207114 = Local_MultiTex357_g207086;
				float ifLocalVar58_g207114 = 0;
				if( temp_output_17_0_g207114 == 0.0 )
				ifLocalVar58_g207114 = break59_g207114.x;
				float ifLocalVar60_g207114 = 0;
				if( temp_output_17_0_g207114 == 1.0 )
				ifLocalVar60_g207114 = break59_g207114.y;
				float ifLocalVar61_g207114 = 0;
				if( temp_output_17_0_g207114 == 2.0 )
				ifLocalVar61_g207114 = break59_g207114.z;
				float ifLocalVar62_g207114 = 0;
				if( temp_output_17_0_g207114 == 3.0 )
				ifLocalVar62_g207114 = break59_g207114.w;
				float lerpResult378_g207086 = lerp( (Local_Masks109_g207086).z , ( ifLocalVar58_g207114 + ifLocalVar60_g207114 + ifLocalVar61_g207114 + ifLocalVar62_g207114 ) , _MainMultiSourceMode);
				float clampResult17_g207116 = clamp( lerpResult378_g207086 , 0.0001 , 0.9999 );
				float temp_output_7_0_g207117 = _MainMultiRemap.x;
				float temp_output_9_0_g207117 = ( clampResult17_g207116 - temp_output_7_0_g207117 );
				half Local_MultiMask78_g207086 = saturate( ( ( temp_output_9_0_g207117 * _MainMultiRemap.z ) + 0.0001 ) );
				float lerpResult58_g207086 = lerp( 1.0 , Local_MultiMask78_g207086 , _MainColorMode);
				float4 lerpResult62_g207086 = lerp( _MainColorTwo , _MainColor , lerpResult58_g207086);
				half3 Local_ColorRGB93_g207086 = (lerpResult62_g207086).rgb;
				half3 Local_Albedo139_g207086 = ( Local_AlbedoRGB107_g207086 * Local_ColorRGB93_g207086 );
				float3 In_Albedo3_g207090 = Local_Albedo139_g207086;
				float3 In_AlbedoRaw3_g207090 = Local_Albedo139_g207086;
				TEXTURE2D(Texture276_g207088) = _MainNormalTex;
				float localFilterTexture29_g207094 = ( 0.0 );
				SamplerState SS29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g207094 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g207094 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g207094 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g207094 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g207094 = SamplerDefault29_g207094;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g207094 = SamplerDefault29_g207094;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g207094 = SamplerPoint29_g207094;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g207094 = SamplerLow29_g207094;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g207094 = SamplerMedium29_g207094;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g207094 = SamplerHigh29_g207094;
				#endif
				}
				SamplerState Sampler276_g207088 = SS29_g207094;
				float4 temp_output_37_0_g207088 = Local_Coords180_g207086;
				half4 Coords276_g207088 = temp_output_37_0_g207088;
				half2 TexCoord276_g207088 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207088 = SampleMain( Texture276_g207088 , Sampler276_g207088 , Coords276_g207088 , TexCoord276_g207088 );
				TEXTURE2D(Texture275_g207088) = _MainNormalTex;
				SamplerState Sampler275_g207088 = SS29_g207094;
				half4 Coords275_g207088 = temp_output_37_0_g207088;
				half2 TexCoord275_g207088 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207088 = SampleExtra( Texture275_g207088 , Sampler275_g207088 , Coords275_g207088 , TexCoord275_g207088 );
				TEXTURE2D(Texture238_g207088) = _MainNormalTex;
				SamplerState Sampler238_g207088 = SS29_g207094;
				half4 Coords238_g207088 = temp_output_37_0_g207088;
				float3 temp_output_279_0_g207088 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207088 = temp_output_279_0_g207088;
				half4 localSamplePlanar2D238_g207088 = SamplePlanar2D( Texture238_g207088 , Sampler238_g207088 , Coords238_g207088 , WorldPosition238_g207088 );
				TEXTURE2D(Texture246_g207088) = _MainNormalTex;
				SamplerState Sampler246_g207088 = SS29_g207094;
				half4 Coords246_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition246_g207088 = temp_output_279_0_g207088;
				float3 temp_output_280_0_g207088 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207088 = temp_output_280_0_g207088;
				half4 localSamplePlanar3D246_g207088 = SamplePlanar3D( Texture246_g207088 , Sampler246_g207088 , Coords246_g207088 , WorldPosition246_g207088 , WorldNormal246_g207088 );
				TEXTURE2D(Texture234_g207088) = _MainNormalTex;
				SamplerState Sampler234_g207088 = SS29_g207094;
				float4 Coords234_g207088 = temp_output_37_0_g207088;
				float3 WorldPosition234_g207088 = temp_output_279_0_g207088;
				float4 localSampleStochastic2D234_g207088 = SampleStochastic2D( Texture234_g207088 , Sampler234_g207088 , Coords234_g207088 , WorldPosition234_g207088 );
				TEXTURE2D(Texture263_g207088) = _MainNormalTex;
				SamplerState Sampler263_g207088 = SS29_g207094;
				half4 Coords263_g207088 = temp_output_37_0_g207088;
				half3 WorldPosition263_g207088 = temp_output_279_0_g207088;
				half3 WorldNormal263_g207088 = temp_output_280_0_g207088;
				half4 localSampleStochastic3D263_g207088 = SampleStochastic3D( Texture263_g207088 , Sampler263_g207088 , Coords263_g207088 , WorldPosition263_g207088 , WorldNormal263_g207088 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch193_g207086 = localSampleExtra275_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch193_g207086 = localSamplePlanar2D238_g207088;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch193_g207086 = localSamplePlanar3D246_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch193_g207086 = localSampleStochastic2D234_g207088;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch193_g207086 = localSampleStochastic3D263_g207088;
				#else
				float4 staticSwitch193_g207086 = localSampleMain276_g207088;
				#endif
				half4 Local_NormaTex191_g207086 = staticSwitch193_g207086;
				half4 Normal_Packed45_g207091 = Local_NormaTex191_g207086;
				float2 appendResult58_g207091 = (float2(( (Normal_Packed45_g207091).x * (Normal_Packed45_g207091).w ) , (Normal_Packed45_g207091).y));
				half2 Normal_Default50_g207091 = appendResult58_g207091;
				half2 Normal_ASTC41_g207091 = (Normal_Packed45_g207091).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g207091 = Normal_ASTC41_g207091;
				#else
				float2 staticSwitch38_g207091 = Normal_Default50_g207091;
				#endif
				half2 Normal_NO_DTX544_g207091 = (Normal_Packed45_g207091).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g207091 = Normal_NO_DTX544_g207091;
				#else
				float2 staticSwitch37_g207091 = staticSwitch38_g207091;
				#endif
				float2 temp_output_26_0_g207086 = ( (staticSwitch37_g207091*2.0 + -1.0) * _MainNormalValue );
				float3x3 ase_worldToTangent = float3x3( TangentWS.xyz, BitangentWS, NormalWS );
				half2 Normal_Planar45_g207092 = temp_output_26_0_g207086;
				float2 break71_g207092 = Normal_Planar45_g207092;
				float3 appendResult72_g207092 = (float3(break71_g207092.x , 0.0 , break71_g207092.y));
				float2 temp_output_205_0_g207086 = (mul( ase_worldToTangent, appendResult72_g207092 )).xy;
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch204_g207086 = temp_output_205_0_g207086;
				#else
				float2 staticSwitch204_g207086 = temp_output_26_0_g207086;
				#endif
				half2 Local_NormalTS108_g207086 = staticSwitch204_g207086;
				float2 In_NormalTS3_g207090 = Local_NormalTS108_g207086;
				float3 appendResult68_g207093 = (float3(Local_NormalTS108_g207086 , 1.0));
				float3 tanToWorld0 = float3( TangentWS.xyz.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.xyz.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.xyz.z, BitangentWS.z, NormalWS.z );
				float3 tanNormal74_g207093 = appendResult68_g207093;
				float3 worldNormal74_g207093 = normalize( float3( dot( tanToWorld0, tanNormal74_g207093 ), dot( tanToWorld1, tanNormal74_g207093 ), dot( tanToWorld2, tanNormal74_g207093 ) ) );
				half3 Local_NormalWS250_g207086 = worldNormal74_g207093;
				float3 In_NormalWS3_g207090 = Local_NormalWS250_g207086;
				float4 In_Shader3_g207090 = Local_Masks109_g207086;
				float4 In_Emissive3_g207090 = half4( 1, 1, 1, 1 );
				float3 temp_output_3_0_g207107 = Local_Albedo139_g207086;
				float dotResult20_g207107 = dot( temp_output_3_0_g207107 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale110_g207086 = dotResult20_g207107;
				float In_Grayscale3_g207090 = Local_Grayscale110_g207086;
				float clampResult144_g207086 = clamp( saturate( ( Local_Grayscale110_g207086 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity145_g207086 = clampResult144_g207086;
				float In_Luminosity3_g207090 = Local_Luminosity145_g207086;
				float In_MultiMask3_g207090 = Local_MultiMask78_g207086;
				float temp_output_17_0_g207111 = _MainAlphaChannelMode;
				TEXTURE2D(Texture276_g207098) = _MainAlphaTex;
				float localFilterTexture19_g207099 = ( 0.0 );
				SamplerState SS19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g207099 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g207099 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g207099 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g207099 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g207099 = SamplerDefault19_g207099;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g207099 = SamplerDefault19_g207099;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g207099 = SamplerPoint19_g207099;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g207099 = SamplerLow19_g207099;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g207099 = SamplerMedium19_g207099;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g207099 = SamplerHigh19_g207099;
				#endif
				}
				SamplerState Sampler276_g207098 = SS19_g207099;
				float4 temp_output_37_0_g207098 = Local_Coords180_g207086;
				half4 Coords276_g207098 = temp_output_37_0_g207098;
				half2 TexCoord276_g207098 = packedInput.ase_texcoord3.xy;
				half4 localSampleMain276_g207098 = SampleMain( Texture276_g207098 , Sampler276_g207098 , Coords276_g207098 , TexCoord276_g207098 );
				TEXTURE2D(Texture275_g207098) = _MainAlphaTex;
				SamplerState Sampler275_g207098 = SS19_g207099;
				half4 Coords275_g207098 = temp_output_37_0_g207098;
				half2 TexCoord275_g207098 = packedInput.ase_texcoord3.zw;
				half4 localSampleExtra275_g207098 = SampleExtra( Texture275_g207098 , Sampler275_g207098 , Coords275_g207098 , TexCoord275_g207098 );
				TEXTURE2D(Texture238_g207098) = _MainAlphaTex;
				SamplerState Sampler238_g207098 = SS19_g207099;
				half4 Coords238_g207098 = temp_output_37_0_g207098;
				float3 temp_output_279_0_g207098 = Model_PositionWO222_g207086;
				half3 WorldPosition238_g207098 = temp_output_279_0_g207098;
				half4 localSamplePlanar2D238_g207098 = SamplePlanar2D( Texture238_g207098 , Sampler238_g207098 , Coords238_g207098 , WorldPosition238_g207098 );
				TEXTURE2D(Texture246_g207098) = _MainAlphaTex;
				SamplerState Sampler246_g207098 = SS19_g207099;
				half4 Coords246_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition246_g207098 = temp_output_279_0_g207098;
				float3 temp_output_280_0_g207098 = Model_NormalWS226_g207086;
				half3 WorldNormal246_g207098 = temp_output_280_0_g207098;
				half4 localSamplePlanar3D246_g207098 = SamplePlanar3D( Texture246_g207098 , Sampler246_g207098 , Coords246_g207098 , WorldPosition246_g207098 , WorldNormal246_g207098 );
				TEXTURE2D(Texture234_g207098) = _MainAlphaTex;
				SamplerState Sampler234_g207098 = SS19_g207099;
				float4 Coords234_g207098 = temp_output_37_0_g207098;
				float3 WorldPosition234_g207098 = temp_output_279_0_g207098;
				float4 localSampleStochastic2D234_g207098 = SampleStochastic2D( Texture234_g207098 , Sampler234_g207098 , Coords234_g207098 , WorldPosition234_g207098 );
				TEXTURE2D(Texture263_g207098) = _MainAlphaTex;
				SamplerState Sampler263_g207098 = SS19_g207099;
				half4 Coords263_g207098 = temp_output_37_0_g207098;
				half3 WorldPosition263_g207098 = temp_output_279_0_g207098;
				half3 WorldNormal263_g207098 = temp_output_280_0_g207098;
				half4 localSampleStochastic3D263_g207098 = SampleStochastic3D( Texture263_g207098 , Sampler263_g207098 , Coords263_g207098 , WorldPosition263_g207098 , WorldNormal263_g207098 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch327_g207086 = localSampleExtra275_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch327_g207086 = localSamplePlanar2D238_g207098;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch327_g207086 = localSamplePlanar3D246_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch327_g207086 = localSampleStochastic2D234_g207098;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch327_g207086 = localSampleStochastic3D263_g207098;
				#else
				float4 staticSwitch327_g207086 = localSampleMain276_g207098;
				#endif
				half4 Local_AlphaTex330_g207086 = staticSwitch327_g207086;
				float4 break59_g207111 = Local_AlphaTex330_g207086;
				float ifLocalVar58_g207111 = 0;
				if( temp_output_17_0_g207111 == 0.0 )
				ifLocalVar58_g207111 = break59_g207111.x;
				float ifLocalVar60_g207111 = 0;
				if( temp_output_17_0_g207111 == 1.0 )
				ifLocalVar60_g207111 = break59_g207111.y;
				float ifLocalVar61_g207111 = 0;
				if( temp_output_17_0_g207111 == 2.0 )
				ifLocalVar61_g207111 = break59_g207111.z;
				float ifLocalVar62_g207111 = 0;
				if( temp_output_17_0_g207111 == 3.0 )
				ifLocalVar62_g207111 = break59_g207111.w;
				float3 temp_cast_4 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 temp_cast_5 = (( ifLocalVar58_g207111 + ifLocalVar60_g207111 + ifLocalVar61_g207111 + ifLocalVar62_g207111 )).xxx;
				float3 linearToGamma402_g207086 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult385_g207086 = lerp( (Local_AlbedoTex185_g207086).w , (linearToGamma402_g207086).x , _MainAlphaSourceMode);
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch236_g207086 = ( lerpResult385_g207086 - _MainAlphaClipValue );
				#else
				float staticSwitch236_g207086 = lerpResult385_g207086;
				#endif
				half Local_AlphaClip111_g207086 = staticSwitch236_g207086;
				float In_AlphaClip3_g207090 = Local_AlphaClip111_g207086;
				half Local_AlphaFade246_g207086 = (lerpResult62_g207086).a;
				float In_AlphaFade3_g207090 = Local_AlphaFade246_g207086;
				float3 temp_cast_6 = (1.0).xxx;
				float3 In_Translucency3_g207090 = temp_cast_6;
				float In_Transmission3_g207090 = 1.0;
				float In_Thickness3_g207090 = 0.0;
				float In_Diffusion3_g207090 = 0.0;
				float In_Depth3_g207090 = 0.0;
				{
				Data3_g207090.Dummy = In_Dummy3_g207090;
				Data3_g207090.Albedo = In_Albedo3_g207090;
				Data3_g207090.AlbedoRaw = In_AlbedoRaw3_g207090;
				Data3_g207090.NormalTS = In_NormalTS3_g207090;
				Data3_g207090.NormalWS = In_NormalWS3_g207090;
				Data3_g207090.Shader = In_Shader3_g207090;
				Data3_g207090.Emissive= In_Emissive3_g207090;
				Data3_g207090.MultiMask = In_MultiMask3_g207090;
				Data3_g207090.Grayscale = In_Grayscale3_g207090;
				Data3_g207090.Luminosity = In_Luminosity3_g207090;
				Data3_g207090.AlphaClip = In_AlphaClip3_g207090;
				Data3_g207090.AlphaFade = In_AlphaFade3_g207090;
				Data3_g207090.Translucency = In_Translucency3_g207090;
				Data3_g207090.Transmission = In_Transmission3_g207090;
				Data3_g207090.Thickness = In_Thickness3_g207090;
				Data3_g207090.Diffusion = In_Diffusion3_g207090;
				Data3_g207090.Depth = In_Depth3_g207090;
				}
				TVEVisualData Data4_g207126 = Data3_g207090;
				float Out_Dummy4_g207126 = 0;
				float3 Out_Albedo4_g207126 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g207126 = float3( 0,0,0 );
				float2 Out_NormalTS4_g207126 = float2( 0,0 );
				float3 Out_NormalWS4_g207126 = float3( 0,0,0 );
				float4 Out_Shader4_g207126 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g207126 = float4( 0,0,0,0 );
				float Out_MultiMask4_g207126 = 0;
				float Out_Grayscale4_g207126 = 0;
				float Out_Luminosity4_g207126 = 0;
				float Out_AlphaClip4_g207126 = 0;
				float Out_AlphaFade4_g207126 = 0;
				float3 Out_Translucency4_g207126 = float3( 0,0,0 );
				float Out_Transmission4_g207126 = 0;
				float Out_Thickness4_g207126 = 0;
				float Out_Diffusion4_g207126 = 0;
				float Out_Depth4_g207126 = 0;
				{
				Out_Dummy4_g207126 = Data4_g207126.Dummy;
				Out_Albedo4_g207126 = Data4_g207126.Albedo;
				Out_AlbedoRaw4_g207126 = Data4_g207126.AlbedoRaw;
				Out_NormalTS4_g207126 = Data4_g207126.NormalTS;
				Out_NormalWS4_g207126 = Data4_g207126.NormalWS;
				Out_Shader4_g207126 = Data4_g207126.Shader;
				Out_Emissive4_g207126= Data4_g207126.Emissive;
				Out_MultiMask4_g207126 = Data4_g207126.MultiMask;
				Out_Grayscale4_g207126 = Data4_g207126.Grayscale;
				Out_Luminosity4_g207126= Data4_g207126.Luminosity;
				Out_AlphaClip4_g207126 = Data4_g207126.AlphaClip;
				Out_AlphaFade4_g207126 = Data4_g207126.AlphaFade;
				Out_Translucency4_g207126 = Data4_g207126.Translucency;
				Out_Transmission4_g207126 = Data4_g207126.Transmission;
				Out_Thickness4_g207126 = Data4_g207126.Thickness;
				Out_Diffusion4_g207126 = Data4_g207126.Diffusion;
				Out_Depth4_g207126= Data4_g207126.Depth;
				}
				float temp_output_3_0_g207131 = Out_AlphaClip4_g207126;
				float Alpha21_g207131 = temp_output_3_0_g207131;
				float temp_output_15_0_g207131 = 0.0;
				float Treshold21_g207131 = temp_output_15_0_g207131;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_CUTOUT) || defined (TVE_GLANCING) || defined (TVE_DITHER)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha21_g207131 - Treshold21_g207131);
				#endif
				#endif
				}
				

				PickingSurfaceDescription surfaceDescription = (PickingSurfaceDescription)0;

				surfaceDescription.Alpha = saturate( ( Alpha21_g207131 * Out_AlphaFade4_g207126 ) );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = input.positionSS.z;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif

				outColor = _SelectionID;
			}

            ENDHLSL
		}

        Pass
        {
            Name "FullScreenDebug"
            Tags
			{
				"LightMode" = "FullScreenDebug"
            }

            Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

            HLSLPROGRAM
            /*ase_pragma_before*/
            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
		    #define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
					uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};

			struct SurfaceDescriptionInputs
			{
				 float3 TangentSpaceNormal;
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

            struct VertexDescription
			{
				float3 Position;
				float3 Normal;
				float3 Tangent;
			};

			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
			{
				VertexDescription description = (VertexDescription)0;
				description.Position = IN.ObjectSpacePosition;
				description.Normal = IN.ObjectSpaceNormal;
				description.Tangent = IN.ObjectSpaceTangent;
				return description;
			}

            struct SurfaceDescription
			{
				float3 BaseColor;
				float3 Emission;
				float Alpha;
				float3 BentNormal;
				float Smoothness;
				float Occlusion;
				float3 NormalTS;
				float Metallic;
			};

			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
			{
				SurfaceDescription surface = (SurfaceDescription)0;
				surface.BaseColor = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
				surface.Emission = float3(0, 0, 0);
				surface.Alpha = 1;
				surface.BentNormal = IN.TangentSpaceNormal;
				surface.Smoothness = 0.5;
				surface.Occlusion = 1;
				surface.NormalTS = IN.TangentSpaceNormal;
				surface.Metallic = 0;
				return surface;
			}

			VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
			{
				VertexDescriptionInputs output;
				ZERO_INITIALIZE(VertexDescriptionInputs, output);

				output.ObjectSpaceNormal = input.normalOS;
				output.ObjectSpaceTangent = input.tangentOS.xyz;
				output.ObjectSpacePosition = input.positionOS;

				return output;
			}

			AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters  )
			{
				VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);

				VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);

				input.positionOS = vertexDescription.Position;
				input.normalOS = vertexDescription.Normal;
				input.tangentOS.xyz = vertexDescription.Tangent;
				return input;
			}

			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);

				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS; // input.positionCS is SV_Position

				return output;
			}

			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}

			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil]
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}
            ENDHLSL
        }
		
	}
	
	CustomEditor "TheVisualEngine.MaterialGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19802
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5246;640,-256;Inherit;False;Block Model;44;;205214;7ad7765e793a6714babedee0033c36e9;14,240,1,290,1,291,1,289,1,181,0,183,0,185,0,188,0,190,0,184,0,192,0,189,0,300,0,193,0;10;102;FLOAT3;0,0,0;False;163;FLOAT3;0,0,0;False;186;FLOAT3;0,0,0;False;187;FLOAT3;0,0,0;False;166;FLOAT3;0,0,0;False;164;FLOAT3;0,0,0;False;301;FLOAT3;0,0,0;False;167;FLOAT4;0,0,0,0;False;172;FLOAT4;0,0,0,0;False;175;FLOAT4;0,0,0,0;False;2;OBJECT;128;OBJECT;314
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;4641;960,-192;Half;False;Model Frag;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;4598;1408,-256;Inherit;False;4641;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5292;1664,-256;Inherit;False;Block Main Packer;56;;207086;6f902604bb216a2499087c243d45e11c;2,65,1,136,1;1;225;OBJECT;0,0,0,0;False;1;OBJECT;106
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;4635;1984,-256;Half;False;Visual Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2213;2432,-256;Inherit;False;4635;Visual Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;20;2608,-640;Half;False;Property;_render_src;_render_src;96;1;[HideInInspector];Create;True;0;0;0;True;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;10;2432,-640;Half;False;Property;_render_cull;_render_cull;95;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;7;2784,-640;Half;False;Property;_render_dst;_render_dst;97;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;17;2960,-640;Half;False;Property;_render_zw;_render_zw;98;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1355;3136,-640;Half;False;Property;_render_coverage;_render_coverage;99;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1087;3712,-640;Inherit;False;Base Compile;-1;;207120;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2267;2432,-768;Half;False;Property;_IsGeneralShader;_IsGeneralShader;100;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5267;2688,-256;Inherit;False;Block Render;0;;207121;a46c8f81ec84cc34b8c5bbba7c174e1d;0;3;17;OBJECT;;False;19;OBJECT;;False;125;FLOAT;0;False;20;FLOAT3;21;FLOAT3;22;FLOAT3;34;FLOAT3;77;FLOAT;26;FLOAT;27;FLOAT;108;FLOAT;109;FLOAT;72;FLOAT;28;FLOAT;71;FLOAT3;65;FLOAT;66;FLOAT;67;FLOAT;68;FLOAT;73;FLOAT3;37;FLOAT3;30;FLOAT3;32;FLOAT4;33
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;4645;960,-256;Half;False;Model Vert;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;4258;2656,-768;Half;False;Property;_IsStandardShader;_IsStandardShader;101;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5294;3232,-256;Float;False;True;-1;3;TheVisualEngine.MaterialGUI;0;15;BOXOPHOBIC/The Visual Engine/Helpers/Custom Texture Packing;28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefGBuffer;255;False;;255;True;_StencilWriteMaskGBuffer;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;False;True;0;True;_ZTestGBuffer;False;True;1;LightMode=GBuffer;False;False;0;;0;0;Standard;40;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;0;638742674576054130;Alpha Clipping;0;0;  Use Shadow Threshold;0;0;Material Type,InvertActionOnDeselection;4;638742674620213704;  Energy Conserving Specular;1;0;  Transmission,InvertActionOnDeselection;0;0;Normal Space,InvertActionOnDeselection;0;0;Receive Decals;1;0;Receive SSR;1;0;Receive SSR Transparent;0;0;Motion Vectors;0;638742674670180871;  Add Precomputed Velocity;0;0;Specular AA;0;0;Specular Occlusion Mode;1;0;Override Baked GI;0;0;Write Depth;0;0;  Depth Offset;0;0;  Conservative;0;0;GPU Instancing;1;0;LOD CrossFade;1;638742674721403398;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position;0;638742674735013747;0;11;True;True;True;True;True;False;False;False;False;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5295;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5296;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5297;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5298;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5299;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;MotionVectors;0;5;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefMV;255;False;;255;True;_StencilWriteMaskMV;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5300;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentBackface;0;6;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;False;True;1;False;;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;False;False;True;0;True;_ZWrite;True;0;True;_ZTestTransparent;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5301;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPrepass;0;7;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5302;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPostpass;0;8;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5303;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;9;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;True;1;1;False;;0;True;_DstBlend2;0;1;False;;0;False;;False;False;True;1;1;False;;0;True;_DstBlend2;0;1;False;;0;False;;False;False;False;True;0;True;_CullModeForward;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;True;True;0;True;_StencilRef;255;False;;255;True;_StencilWriteMask;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;0;True;_ZWrite;True;0;True;_ZTestDepthEqualForOpaque;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5304;3232,-256;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;10;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
WireConnection;4641;0;5246;314
WireConnection;5292;225;4598;0
WireConnection;4635;0;5292;106
WireConnection;5267;17;2213;0
WireConnection;4645;0;5246;128
WireConnection;5294;0;5267;21
WireConnection;5294;1;5267;22
WireConnection;5294;5;5267;77
WireConnection;5294;7;5267;27
WireConnection;5294;8;5267;26
WireConnection;5294;9;5267;28
ASEEND*/
//CHKSM=2980D1ACFA73106460AF7D9F45B82D29DB0CB85C