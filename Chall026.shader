Shader "Misha/Chall026" {
    Properties {
        _RimColor   ("Rim Color", Color)         = (1,1,1,1)
        _RimPower   ("Rim Power", Range(0.5, 8)) = 3
        _StripeSize ("Stripe Size", Range(1, 8)) = 3
        _MainTex    ("Texture", 2D)              = "white" {}
        _BumpTex    ("Normal Map", 2D)           = "bump" {}
        _Depth      ("Depth", Range(1, 8))       = 3
    }

    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _BumpTex;
        fixed4    _RimColor;
        float     _RimPower;
        float     _StripeSize;
        float     _Depth;

        struct Input {
            float2 uv_MainTex;
            float2 uv_BumpTex;
            float3 viewDir;
            float3 worldPos;
        };

        void surf (Input IN, inout SurfaceOutput o) {
            half rim    = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            half stripe = frac(IN.worldPos.y * _StripeSize * 5) > 0.6 ? float3(0.7, 0, 0) : float3(0, 0, 0.7);

            o.Albedo   = tex2D(_MainTex, IN.uv_MainTex).rgb;
            o.Normal   = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex));
            o.Normal  *= float3(_Depth, _Depth, 1);
            o.Emission = pow(rim, _RimPower) * stripe;


        }

        ENDCG
    }
    FallBack "Diffuse"
}
