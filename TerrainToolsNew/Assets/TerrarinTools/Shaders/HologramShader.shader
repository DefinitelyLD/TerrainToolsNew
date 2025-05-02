Shader "TerrainTools/HologramShader"
{
    SubShader
    {
        Tags { "RenderType"="Transparent" }
        LOD 100
        Cull Off ZWrite Off ZTest LEqual
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma target 5.0

            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            sampler2D _Heightmap;
            sampler2D _Mask;

            float4 _TerrainSize;
            float4 _Bounds;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
                float height : HEIGHT;
            };

            v2f vert(appdata v)
            {
                v2f o;

                float height = tex2Dlod(_Heightmap, float4(v.uv, 0, 0)).r;
                height *= 2.0;

                o.height = height;

                height *= _TerrainSize.y;
                v.vertex.y += height + 0.1;

                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;

                return o;
            }

            float4 frag(v2f i) : SV_Target
            {
                float2 uv = i.uv;

                if(uv.x < _Bounds.x || uv.x > _Bounds.z || uv.y < _Bounds.y || uv.y > _Bounds.w) {
                    discard;
                }

                float2 innerUV = (uv - _Bounds.xy) / (_Bounds.zw - _Bounds.xy);

                float mask = tex2D(_Mask, innerUV);

                return float4(i.height, 1 - i.height, 1 , 0.2 * mask);
            }
            ENDCG
        }
    }
}
