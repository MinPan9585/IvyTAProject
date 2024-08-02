// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SinCourse/BlendTexture+Alpha"
{
	Properties
	{
		_Indensity("Indensity", Float) = 1
		_Opacity("Opacity", Float) = 1
		[HDR]_Color("Color", Color) = (1,1,1,1)
		_MainTex("MainTex", 2D) = "white" {}
		_MainU("MainU", Float) = 0
		_MainV("MainV", Float) = 0
		_AlphaTex("AlphaTex", 2D) = "white" {}
		_AlphaU("AlphaU", Float) = 0
		_AlphaV("AlphaV", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Off
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		BlendOp Add
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Lambert keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _MainTex;
		uniform float _MainU;
		uniform float _MainV;
		uniform float4 _MainTex_ST;
		uniform float _Indensity;
		uniform float4 _Color;
		uniform float _Opacity;
		uniform sampler2D _AlphaTex;
		uniform float _AlphaU;
		uniform float _AlphaV;

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 appendResult6 = (float2(_MainU , _MainV));
			float2 uv0_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode1 = tex2D( _MainTex, ( ( appendResult6 * _Time.y ) + uv0_MainTex ) );
			o.Emission = ( (tex2DNode1).rgb * _Indensity * (_Color).rgb );
			float2 appendResult37 = (float2(_AlphaU , _AlphaV));
			float3 desaturateInitialColor33 = tex2D( _AlphaTex, ( ( appendResult37 * _Time.y ) + i.uv_texcoord ) ).rgb;
			float desaturateDot33 = dot( desaturateInitialColor33, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar33 = lerp( desaturateInitialColor33, desaturateDot33.xxx, 1.0 );
			o.Alpha = ( tex2DNode1.a * _Color.a * _Opacity * (desaturateVar33).x );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17000
0;0;1920;1029;2363.533;-156.7684;1.357442;True;True
Node;AmplifyShaderEditor.CommentaryNode;31;-1926.057,760.0416;Float;False;996.575;444.3248;Alpha;9;41;40;39;38;37;36;35;34;33;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2;-1734.111,-13.01346;Float;False;697.1188;379.1068;主贴图流动;7;9;8;7;6;5;4;3;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1876.057,822.6592;Float;False;Property;_AlphaU;AlphaU;7;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1873.057,899.6594;Float;False;Property;_AlphaV;AlphaV;8;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-1681.112,126.3863;Float;False;Property;_MainV;MainV;5;0;Create;True;0;0;False;0;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-1684.111,49.38651;Float;False;Property;_MainU;MainU;4;0;Create;True;0;0;False;0;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;37;-1702.057,842.6592;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;36;-1736.52,948.0667;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;5;-1512.574,131.5934;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;6;-1510.111,38.98654;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-1756.619,1043.367;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-1539.057,840.6592;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;7;-1513.874,203.0933;Float;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-1347.111,36.98654;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;40;-1380.796,837.0823;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;41;-1250.482,810.0417;Float;True;Property;_AlphaTex;AlphaTex;6;0;Create;True;0;0;False;0;None;7ab44978b03a7494586f5a4d3766dd1f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-1192.992,50.58074;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;15;-1535.56,370.118;Float;False;500.3463;260.3333;主颜色;2;17;16;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DesaturateOpNode;33;-952.1541,814.0151;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;16;-1485.56,420.118;Float;False;Property;_Color;Color;2;1;[HDR];Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-1022,18;Float;True;Property;_MainTex;MainTex;3;0;Create;True;0;0;False;0;None;06ca7f4e15d38b44ea670db94e64af32;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;17;-1277.88,421.7639;Float;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;32;-772.6862,808.5274;Float;False;True;False;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;13;-731,17;Float;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-665.6321,356.6082;Float;False;Property;_Opacity;Opacity;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-687.3669,100.3918;Float;False;Property;_Indensity;Indensity;0;0;Create;True;0;0;False;0;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-470,222;Float;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-483,102;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-294,54;Float;False;True;2;Float;ASEMaterialInspector;0;0;Lambert;SinCourse/BlendTexture+Alpha;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;1;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;9;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;37;0;35;0
WireConnection;37;1;34;0
WireConnection;6;0;4;0
WireConnection;6;1;3;0
WireConnection;38;0;37;0
WireConnection;38;1;36;0
WireConnection;8;0;6;0
WireConnection;8;1;5;0
WireConnection;40;0;38;0
WireConnection;40;1;39;0
WireConnection;41;1;40;0
WireConnection;9;0;8;0
WireConnection;9;1;7;0
WireConnection;33;0;41;0
WireConnection;1;1;9;0
WireConnection;17;0;16;0
WireConnection;32;0;33;0
WireConnection;13;0;1;0
WireConnection;14;0;1;4
WireConnection;14;1;16;4
WireConnection;14;2;11;0
WireConnection;14;3;32;0
WireConnection;12;0;13;0
WireConnection;12;1;10;0
WireConnection;12;2;17;0
WireConnection;0;2;12;0
WireConnection;0;9;14;0
ASEEND*/
//CHKSM=6D1B122BB31715B0778EF9A3866F994963009131