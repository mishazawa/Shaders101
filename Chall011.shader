Shader "Misha/Chall011" {
    Properties {
        _Color   ("Color", Color) = (1,1,1,1)
        _MainTex ("Texture", 2D)  = "white" {}
    }

    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        fixed4    _Color;

        struct Input {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o) {
            float4 green = float4(0, 1, 0, 1);
            o.Albedo = (tex2D(_MainTex, IN.uv_MainTex) * green).rgb;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
