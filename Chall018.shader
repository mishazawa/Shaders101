Shader "Misha/Chall018" {
    Properties {
        _MainTex    ("Texture", 2D)  = "white" {}
        _BumpTex    ("Normal Map", 2D)  = "bump" {}
        _Depth      ("Depth", Range(0, 10)) = 1
        _Brightness ("Brightness", Range(0.1, 2.5)) = 1
        _CubeTex    ("Cubemap", CUBE) = "white" {}
    }

    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert

        samplerCUBE _CubeTex;
        sampler2D   _MainTex;
        sampler2D   _BumpTex;
        half        _Depth;
        half        _Brightness;

        struct Input {
            float2 uv_MainTex;
            float2 uv_BumpTex;
            float3 worldRefl; INTERNAL_DATA
        };

        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            o.Albedo *= _Brightness;

            o.Normal = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex));
            o.Normal *= float3(_Depth, _Depth, 1);

            o.Emission = texCUBE(_CubeTex, WorldReflectionVector(IN, o.Normal)).rgb;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
