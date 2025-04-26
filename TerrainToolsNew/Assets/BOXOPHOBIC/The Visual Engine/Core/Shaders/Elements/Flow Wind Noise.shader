// Made with Amplify Shader Editor v1.9.8.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Visual Engine/Elements/Flow Wind Noise"
{
	Properties
	{
		[StyledMessage(Info, Use the FAde Slope elements to cut out the alpha based on the terrain normal orientation., 0, 15)]_ElementMessage("Element Message", Float) = 0
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
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[Enum(Main UV,0,Planar,1)][Space(10)]_ElementUVsMode("Element Sampling", Float) = 0
		[StyledVector(9)]_MainUVs("Element UV Value", Vector) = (1,1,0,0)
		[StyledRemapSlider]_MainTexAlphaRemap("Element Alpha", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MainTexFalloffRemap("Element Falloff", Vector) = (0,0,0,0)
		[Space(10)][StyledRemapSlider]_NoiseRemap("Noise Remap", Vector) = (0,1,0,0)
		_NoiseTillingValue("Noise Tilling", Float) = 1
		_NoiseSpeedValue("Noise Speed", Float) = 1
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
			#include "UnityShaderVariables.cginc"
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
			uniform half4 TVE_TimeParams;
			uniform half _NoiseSpeedValue;
			uniform half _NoiseTillingValue;
			uniform half4 _NoiseRemap;
			uniform sampler2D _MainTex;
			uniform float _ElementUVsMode;
			uniform half4 _MainUVs;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexFalloffRemap;
			uniform float _ElementIntensity;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;
			uniform half _ElementBlendA;
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( v.vertex ).xyz, 1 ) ).xyz;
				float2 appendResult316 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult312 = lerp( ( 1.0 - v.ase_texcoord.xy ) , appendResult316 , _ElementUVsMode);
				float2 vertexToFrag11_g23089 = ( ( lerpResult312 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord1.xy = vertexToFrag11_g23089;
				
				o.ase_texcoord1.zw = v.ase_texcoord.xy;
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
				float lerpResult128_g23072 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				float3 appendResult270 = (float3((WorldPosition).xz , ( lerpResult128_g23072 * _NoiseSpeedValue )));
				float simplePerlin3D272 = snoise( appendResult270*( _NoiseTillingValue * 0.1 ) );
				simplePerlin3D272 = simplePerlin3D272*0.5 + 0.5;
				float temp_output_7_0_g23078 = _NoiseRemap.x;
				float temp_output_9_0_g23078 = ( simplePerlin3D272 - temp_output_7_0_g23078 );
				half Noise275 = saturate( ( ( temp_output_9_0_g23078 / ( _NoiseRemap.y - temp_output_7_0_g23078 ) ) + 0.0001 ) );
				float2 vertexToFrag11_g23089 = i.ase_texcoord1.xy;
				half4 MainTex_RGBA299 = tex2D( _MainTex, vertexToFrag11_g23089 );
				float clampResult17_g23088 = clamp( (MainTex_RGBA299).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g23085 = _MainTexAlphaRemap.x;
				float temp_output_9_0_g23085 = ( clampResult17_g23088 - temp_output_7_0_g23085 );
				half Element_Remap_A304 = saturate( ( ( temp_output_9_0_g23085 / ( _MainTexAlphaRemap.y - temp_output_7_0_g23085 ) ) + 0.0001 ) );
				float clampResult17_g23083 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord1.zw*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g23084 = _MainTexFalloffRemap.x;
				float temp_output_9_0_g23084 = ( clampResult17_g23083 - temp_output_7_0_g23084 );
				half Element_Falloff305 = saturate( ( ( temp_output_9_0_g23084 / ( _MainTexFalloffRemap.y - temp_output_7_0_g23084 ) ) + 0.0001 ) );
				float temp_output_7_0_g23075 = 1.0;
				float temp_output_9_0_g23075 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g23075 );
				float lerpResult18_g23073 = lerp( 1.0 , saturate( ( temp_output_9_0_g23075 / ( _ElementVolumeFadeValue - temp_output_7_0_g23075 ) ) ) , _ElementVolumeFadeMode);
				float Element_Alpha196 = ( Element_Remap_A304 * Element_Falloff305 * _ElementIntensity * lerpResult18_g23073 );
				float lerpResult238 = lerp( 1.0 , Noise275 , Element_Alpha196);
				float lerpResult236 = lerp( lerpResult238 , ( Noise275 * Element_Alpha196 ) , _ElementBlendA);
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
			#include "UnityShaderVariables.cginc"
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
			uniform half4 TVE_TimeParams;
			uniform half _NoiseSpeedValue;
			uniform half _NoiseTillingValue;
			uniform half4 _NoiseRemap;
			uniform sampler2D _MainTex;
			uniform float _ElementUVsMode;
			uniform half4 _MainUVs;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexFalloffRemap;
			uniform float _ElementIntensity;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( v.vertex ).xyz, 1 ) ).xyz;
				float2 appendResult316 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult312 = lerp( ( 1.0 - v.ase_texcoord.xy ) , appendResult316 , _ElementUVsMode);
				float2 vertexToFrag11_g23089 = ( ( lerpResult312 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord1.xy = vertexToFrag11_g23089;
				
				o.ase_texcoord1.zw = v.ase_texcoord.xy;
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
				float lerpResult128_g23072 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				float3 appendResult270 = (float3((WorldPosition).xz , ( lerpResult128_g23072 * _NoiseSpeedValue )));
				float simplePerlin3D272 = snoise( appendResult270*( _NoiseTillingValue * 0.1 ) );
				simplePerlin3D272 = simplePerlin3D272*0.5 + 0.5;
				float temp_output_7_0_g23078 = _NoiseRemap.x;
				float temp_output_9_0_g23078 = ( simplePerlin3D272 - temp_output_7_0_g23078 );
				half Noise275 = saturate( ( ( temp_output_9_0_g23078 / ( _NoiseRemap.y - temp_output_7_0_g23078 ) ) + 0.0001 ) );
				float3 temp_cast_0 = (Noise275).xxx;
				half3 Input_Color94_g23081 = temp_cast_0;
				float3 break68_g23081 = Input_Color94_g23081;
				float clampResult80_g23081 = clamp( max( max( break68_g23081.x , break68_g23081.y ) , break68_g23081.z ) , 0.1 , 10000.0 );
				float4 color276 = IsGammaSpace() ? float4(0.654902,0.9596435,1,0) : float4(0.3864295,0.9106393,1,0);
				half3 Input_Tint76_g23081 = (color276).rgb;
				half3 Element_Valid47_g23081 = ( clampResult80_g23081 * Input_Tint76_g23081 );
				float2 vertexToFrag11_g23089 = i.ase_texcoord1.xy;
				half4 MainTex_RGBA299 = tex2D( _MainTex, vertexToFrag11_g23089 );
				float clampResult17_g23088 = clamp( (MainTex_RGBA299).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g23085 = _MainTexAlphaRemap.x;
				float temp_output_9_0_g23085 = ( clampResult17_g23088 - temp_output_7_0_g23085 );
				half Element_Remap_A304 = saturate( ( ( temp_output_9_0_g23085 / ( _MainTexAlphaRemap.y - temp_output_7_0_g23085 ) ) + 0.0001 ) );
				float clampResult17_g23083 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord1.zw*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g23084 = _MainTexFalloffRemap.x;
				float temp_output_9_0_g23084 = ( clampResult17_g23083 - temp_output_7_0_g23084 );
				half Element_Falloff305 = saturate( ( ( temp_output_9_0_g23084 / ( _MainTexFalloffRemap.y - temp_output_7_0_g23084 ) ) + 0.0001 ) );
				float temp_output_7_0_g23075 = 1.0;
				float temp_output_9_0_g23075 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g23075 );
				float lerpResult18_g23073 = lerp( 1.0 , saturate( ( temp_output_9_0_g23075 / ( _ElementVolumeFadeValue - temp_output_7_0_g23075 ) ) ) , _ElementVolumeFadeMode);
				float Element_Alpha196 = ( Element_Remap_A304 * Element_Falloff305 * _ElementIntensity * lerpResult18_g23073 );
				half Input_Alpha48_g23081 = Element_Alpha196;
				float4 appendResult58_g23081 = (float4(Element_Valid47_g23081 , Input_Alpha48_g23081));
				
				
				finalColor = appendResult58_g23081;
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
Node;AmplifyShaderEditor.TexCoordVertexDataNode;314;-4736,-384;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;313;-4736,-256;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector4Node;318;-4352,-256;Half;False;Property;_MainUVs;Element UV Value;15;0;Create;False;0;0;0;False;1;StyledVector(9);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;315;-4544,-384;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;316;-4544,-256;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-4736,-96;Inherit;False;Property;_ElementUVsMode;Element Sampling;14;1;[Enum];Create;False;0;2;Main UV;0;Planar;1;0;False;1;Space(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;320;-4128,-256;Inherit;False;FLOAT2;0;1;2;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;312;-4352,-384;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;310;-3968,-384;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SwizzleNode;319;-4128,-176;Inherit;False;FLOAT2;2;3;2;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;311;-3776,-384;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;287;-4736,1024;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;317;-3584,-384;Inherit;False;Per Vertex;-1;;23089;db7dd586c7d3fd34786fd504127455fc;0;1;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;288;-4512,1024;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;2;False;2;FLOAT;-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;309;-3072,-384;Inherit;True;Property;_MainTex;Element Texture;13;1;[NoScaleOffset];Create;False;0;0;0;False;1;StyledTextureSingleLine;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DistanceOpNode;289;-4288,1024;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;299;-2752,-384;Half;False;MainTex_RGBA;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;283;-4736,640;Inherit;False;299;MainTex_RGBA;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;290;-4096,1024;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;284;-4480,640;Inherit;False;FLOAT;3;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;291;-3952,1024;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;264;-1536,-192;Inherit;False;Get Global Time;-1;;23072;2b2f842f8071fb945821b595284b5848;0;1;129;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;265;-1536,-384;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;266;-1536,-128;Half;False;Property;_NoiseSpeedValue;Noise Speed;20;0;Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;285;-3712,1024;Inherit;False;Math Clamp;-1;;23083;be0e6188e535d474483310546a0d9e78;0;1;6;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;307;-3968,640;Inherit;False;Math Clamp;-1;;23088;be0e6188e535d474483310546a0d9e78;0;1;6;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;322;-3712,1152;Half;False;Property;_MainTexFalloffRemap;Element Falloff;17;0;Create;False;0;0;0;False;1;StyledRemapSlider;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;323;-3968,768;Half;False;Property;_MainTexAlphaRemap;Element Alpha;16;0;Create;False;0;0;0;False;1;StyledRemapSlider;False;0,1,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;267;-1280,-192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;268;-1280,-384;Inherit;False;FLOAT2;0;2;2;3;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;269;-1088,-192;Half;False;Property;_NoiseTillingValue;Noise Tilling;19;0;Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;286;-3456,1024;Inherit;False;Math Remap;-1;;23084;5eda8a2bb94ebef4ab0e43d19291cd8b;2,18,0,14,0;4;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;19;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;293;-3456,640;Inherit;False;Math Remap;-1;;23085;5eda8a2bb94ebef4ab0e43d19291cd8b;2,18,0,14,0;4;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;19;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;270;-1088,-384;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;271;-896,-192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;305;-2752,1024;Half;False;Element_Falloff;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;304;-2752,640;Half;False;Element_Remap_A;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;194;-1536,1216;Inherit;False;Element Fade Volume;23;;23073;4935729172cdadd45b9b14c3fa9c1db4;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;262;-1536,1152;Inherit;False;Element Fade;1;;23076;9434fbc0de86bc1468f2200e11b7c443;0;0;1;FLOAT;4
Node;AmplifyShaderEditor.NoiseGeneratorNode;272;-704,-384;Inherit;False;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;325;-1536,1024;Inherit;False;304;Element_Remap_A;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;326;-1536,1088;Inherit;False;305;Element_Falloff;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;277;-704,-256;Half;False;Property;_NoiseRemap;Noise Remap;18;0;Create;False;0;0;0;False;2;Space(10);StyledRemapSlider;False;0,1,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;192;-1024,1152;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;279;-384,-384;Inherit;False;Math Remap;-1;;23078;5eda8a2bb94ebef4ab0e43d19291cd8b;2,18,0,14,0;4;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;19;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;196;-128,1152;Inherit;False;Element_Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;275;-192,-384;Half;False;Noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;276;1280,-256;Inherit;False;Constant;_Color6;Color 1;63;0;Create;True;0;0;0;False;0;False;0.654902,0.9596435,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;202;1280,-320;Inherit;False;196;Element_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;1280,-384;Inherit;False;275;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;188;1568,-640;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;241;768,-320;Inherit;False;196;Element_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;236;1296,-640;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;235;1024,-384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;238;1024,-640;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;220;1024,-256;Half;False;Property;_ElementBlendA;Render Blend;10;1;[Enum];Create;False;0;2;Multiply;0;Additive;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;176;-832,-1408;Inherit;False;Element Compile;-1;;23080;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-1280,-1408;Half;False;Property;_CategoryElement;[ Category Element ];12;0;Create;True;0;0;0;True;1;StyledCategory(Element Settings, true, 0, 10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;215;-1280,-1344;Half;False;Property;_EndElement;[ End Element ];21;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;216;-1280,-1280;Half;False;Property;_EndRender;[ End Render ];11;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;213;-1072,-1408;Half;False;Property;_CategoryFade;[ Category Fade ];22;0;Create;True;0;0;0;True;1;StyledCategory(Fading Settings, true, 0, 10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;214;-1072,-1344;Half;False;Property;_EndFade;[ End Fade ];26;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;219;-160,-1408;Inherit;False;Property;_render_src;_render_src;27;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;218;0,-1408;Inherit;False;Property;_render_dst;_render_dst;28;1;[HideInInspector];Create;True;0;0;0;True;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-1536,-1408;Half;False;Property;_ElementMessage;Element Message;0;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the FAde Slope elements to cut out the alpha based on the terrain normal orientation., 0, 15);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;203;1536,-384;Inherit;False;Element Visuals;-1;;23081;78cf0f00cfd72824e84597f2db54a76e;1,64,1;3;59;FLOAT3;0,0,0;False;117;FLOAT;0;False;77;COLOR;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;242;768,-640;Inherit;False;275;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;239;768,-384;Inherit;False;275;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;292;-3456,896;Half;False;Constant;_Float4;Float 4;66;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;240;768,-576;Inherit;False;196;Element_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;199;1984,-640;Float;False;True;-1;2;TheVisualEngine.ElementGUI;100;16;BOXOPHOBIC/The Visual Engine/Elements/Flow Wind Noise;f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;0;5;False;_render_src;10;False;;1;0;True;_render_src;0;True;_render_dst;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;True;True;False;False;False;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;True;1;LightMode=VolumePass;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;200;1984,-384;Float;False;False;-1;2;AmplifyShaderEditor.MaterialInspector;100;16;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
WireConnection;315;0;314;0
WireConnection;316;0;313;1
WireConnection;316;1;313;3
WireConnection;320;0;318;0
WireConnection;312;0;315;0
WireConnection;312;1;316;0
WireConnection;312;2;321;0
WireConnection;310;0;312;0
WireConnection;310;1;320;0
WireConnection;319;0;318;0
WireConnection;311;0;310;0
WireConnection;311;1;319;0
WireConnection;317;3;311;0
WireConnection;288;0;287;0
WireConnection;309;1;317;0
WireConnection;289;0;288;0
WireConnection;299;0;309;0
WireConnection;290;0;289;0
WireConnection;284;0;283;0
WireConnection;291;0;290;0
WireConnection;285;6;291;0
WireConnection;307;6;284;0
WireConnection;267;0;264;0
WireConnection;267;1;266;0
WireConnection;268;0;265;0
WireConnection;286;6;285;0
WireConnection;286;7;322;1
WireConnection;286;8;322;2
WireConnection;293;6;307;0
WireConnection;293;7;323;1
WireConnection;293;8;323;2
WireConnection;270;0;268;0
WireConnection;270;2;267;0
WireConnection;271;0;269;0
WireConnection;305;0;286;0
WireConnection;304;0;293;0
WireConnection;272;0;270;0
WireConnection;272;1;271;0
WireConnection;192;0;325;0
WireConnection;192;1;326;0
WireConnection;192;2;262;4
WireConnection;192;3;194;0
WireConnection;279;6;272;0
WireConnection;279;7;277;1
WireConnection;279;8;277;2
WireConnection;196;0;192;0
WireConnection;275;0;279;0
WireConnection;188;3;236;0
WireConnection;236;0;238;0
WireConnection;236;1;235;0
WireConnection;236;2;220;0
WireConnection;235;0;239;0
WireConnection;235;1;241;0
WireConnection;238;1;242;0
WireConnection;238;2;240;0
WireConnection;203;59;244;0
WireConnection;203;117;202;0
WireConnection;203;77;276;0
WireConnection;199;0;188;0
WireConnection;200;0;203;0
ASEEND*/
//CHKSM=B143846C734BD0797F38DCFB94193C1D9A61A8FC