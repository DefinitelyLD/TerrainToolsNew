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
            float _Angle;

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

                // Calculate the center of the bounding box (_Bounds)
                float2 boundsCenter = (_Bounds.xy + _Bounds.zw) * 0.5;

                // First, get the hologram's rotation matrix (we'll assume this comes from a uniform variable)
                float angle = radians(_Angle); // Rotation angle in degrees or radians
                float cosAngle = cos(angle);
                float sinAngle = sin(angle);
                
                // Create a rotation matrix based on the angle
                float2x2 rotationMatrix = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);

                // Rotate the UV coordinates based on the hologram's rotation
                float2 rotatedUV = mul(rotationMatrix, uv - boundsCenter);  // Rotate around the center
                rotatedUV += boundsCenter;  // Reposition after rotation

                // Check if the rotated UV is inside the bounds
                if(rotatedUV.x < _Bounds.x || rotatedUV.x > _Bounds.z || rotatedUV.y < _Bounds.y || rotatedUV.y > _Bounds.w) {
                    discard;
                }

                // Apply the rest of the hologram rendering logic
                float2 innerUV = (rotatedUV - _Bounds.xy) / (_Bounds.zw - _Bounds.xy);

                float mask = tex2D(_Mask, innerUV);

                return float4(i.height, 1 - i.height, 1 , 0.2 * mask);
            }
            ENDCG
        }
    }
}
