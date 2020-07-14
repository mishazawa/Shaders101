Shader "Misha/Template" {
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
            o.Albedo = _Color.rgb;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
