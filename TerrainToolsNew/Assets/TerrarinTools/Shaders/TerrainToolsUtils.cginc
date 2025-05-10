//UNITY_SHADER_NO_UPGRADE
#ifndef TERRAIN_TOOLS_UTILS
#define TERRAIN_TOOLS_UTILS

void SampleBorder_float(UnityTexture2D Texture, UnitySamplerState Sampler, float2 UV, float Border, float Step, out float Output)
{
    float2 texelSize = Texture.texelSize.xy;
    float2 offset = texelSize * Border;
    
    float2 uv = UV;

    // Sample 4 border directions around UV

    float top = SAMPLE_TEXTURE2D(Texture, Sampler, uv + float2(0.0, offset.y)).r;
    float bottom = SAMPLE_TEXTURE2D(Texture, Sampler, uv - float2(0.0, offset.y)).r;
    float right = SAMPLE_TEXTURE2D(Texture, Sampler, uv + float2(offset.x, 0.0)).r;
    float left = SAMPLE_TEXTURE2D(Texture, Sampler, uv - float2(offset.x, 0.0)).r;

    if (left <= Step || right <= Step || top <= Step || bottom <= Step)
    {
        Output = 0;
    }
    else
    {
        Output = 1;
    }
}
void SampleOutwardBorder_float(
    UnityTexture2D Texture,
    UnityTexture2D Heightmap,
    UnityTexture2D Density,
    UnitySamplerState Sampler,
    float2 UV,
    float Border,
    float Step,
    out float Output,
    out bool IsExtended,
    out float ExtendHeight)
{
    float2 texelSize = Texture.texelSize.xy;

    // Sample center pixel
    float center = SAMPLE_TEXTURE2D(Texture, Sampler, UV).r;
    float centerBinary = step(Step, center);

    float maxSample = centerBinary;

    float4 offset = float4(1, 1, -1, -1);

    float2 directions[8] =
    {
        float2(offset.x, offset.y),
        float2(-offset.x, offset.y),
        float2(offset.x, -offset.y),
        float2(-offset.x, -offset.y),
        float2(offset.x, 0),
        float2(-offset.x, 0),
        float2(0, offset.y),
        float2(0, -offset.y)
    };

    // Calculate max binary value in 8 directions
    for (int i = 0; i < 8; i++)
    {
        float2 offsetUV = UV + directions[i] * texelSize * Border;
        float sample = SAMPLE_TEXTURE2D(Texture, Sampler, offsetUV).r;
        float binary = step(Step, sample);
        maxSample = max(maxSample, binary);
    }

    Output = maxSample;
    IsExtended = (centerBinary == 0) && (maxSample == 1);

    // --------------------------
    // Feathering logic
    // --------------------------
    if (centerBinary == 1)
    {
        ExtendHeight = 1.0;
    }
    else if (maxSample == 0)
    {
        ExtendHeight = 0.0; // No mask nearby
    }
    else
    {
        float minDist = texelSize * Border;
        int radius = 2;

        for (int y = -radius; y <= radius; y++)
        {
            for (int x = -radius; x <= radius; x++)
            {
                float2 offset = float2(x, y);
                float2 sampleUV = UV + offset * texelSize;
                float sample = SAMPLE_TEXTURE2D(Texture, Sampler, sampleUV).r;
                float isMask = step(Step, sample);

                if (isMask > 0.0)
                {
                    float dist = length(offset * texelSize);
                    minDist = min(minDist, dist);
                }
            }
        }

        float feather = saturate(1.0 - (minDist / (Border)));
        ExtendHeight = feather;
    }
}



#endif //TERRAIN_TOOLS_UTILS