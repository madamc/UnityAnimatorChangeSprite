// My sprites came up swapped properly, but they were very dark. I decided to create a new shader based on Daniel Brauer's template here http://wiki.unity3d.com/index.php/Vertex/Fragment_Template
// He recommends that where no lighting is needed, a fragment/vertex shader would be better per the discussion here https://forum.unity.com/threads/make-shader-unlit.263336/
// This shader rendered my spritesheets properly. 

Shader "Unlit/Swap2DAsset" {
	Properties{
		[PerRendererData] _MainTex("Sprite Texture", 2D) = "white" {}
		_MainTex2("_MainTex2", 2D) = "white" {}
		_Color("Tint", Color) = (1,1,1,1)
		[MaterialToggle] PixelSnap("Pixel snap", Float) = 0
	}
		SubShader{
			Tags
			{
				"Queue" = "Transparent"
				"IgnoreProjector" = "True"
				"RenderType" = "Transparent"
				"PreviewType" = "Plane"
				"CanUseSpriteAtlas" = "True"
			}
			LOD 0
			Blend SrcAlpha OneMinusSrcAlpha

			Pass {
				CGPROGRAM
					#pragma vertex vert
					#pragma fragment frag
					#include "UnityCG.cginc"

					struct v2f {
						float4 pos : SV_POSITION;
						float2 uv_MainTex : TEXCOORD0;
					};

					float4 _MainTex_ST;

					v2f vert(appdata_base v) {
						v2f o;
						o.pos = UnityObjectToClipPos(v.vertex);
						o.uv_MainTex = TRANSFORM_TEX(v.texcoord, _MainTex);
						return o;
					}

					sampler2D _MainTex;
					sampler2D _MainTex2;

					float4 frag(v2f IN) : COLOR {
						half4 c = tex2D(_MainTex2, IN.uv_MainTex);
						return c;
					}
				ENDCG
			}
	}
}
