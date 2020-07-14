Shader "Misha/Chall014" {
    Properties {
        _DiffuseTex  ("Diffuse Texture", 2D)   = "white" {}
        _EmissionTex ("Emission Texture", 2D)  = "white" {}
    }

    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _DiffuseTex;
        sampler2D _EmissionTex;

        struct Input {
            float2 uv_DiffuseTex;
            float2 uv_EmissionText;
        };

        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo   = tex2D(_DiffuseTex, IN.uv_DiffuseTex).rgb;
            o.Emission = tex2D(_EmissionTex, IN.uv_EmissionText).rgb;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
