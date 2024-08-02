// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SinCourse/BlendTexture+Alpha+Distortion+Gradient+2UV+Dissolve"
{
	Properties
	{
		_Indensity("Indensity", Float) = 1
		_Opacity("Opacity", Float) = 1
		[HDR]_Color("Color", Color) = (1,1,1,1)
		_GradientTex("GradientTex", 2D) = "white" {}
		[Toggle(_GRADIENTTEX2UV_ON)] _GradientTex2UV("GradientTex2UV", Float) = 0
		_GradientTexU("GradientTexU", Float) = 0
		_GradientTexV("GradientTexV", Float) = 0
		_DistortionTex("DistortionTex", 2D) = "white" {}
		[Toggle(_DISTORTIONTEX2UV_ON)] _DistortionTex2UV("DistortionTex2UV", Float) = 0
		_DistortionU("DistortionU", Float) = 0
		_DistortionV("DistortionV", Float) = 0
		_DistortionIndensity("DistortionIndensity", Float) = 0
		_MainTex("MainTex", 2D) = "white" {}
		[Toggle(_MAINTEX2UV_ON)] _MainTex2UV("MainTex2UV", Float) = 0
		_MainU("MainU", Float) = 0
		_MainV("MainV", Float) = 0
		_AlphaTex("AlphaTex", 2D) = "white" {}
		[Toggle(_ALPHATEX2UV_ON)] _AlphaTex2UV("AlphaTex2UV", Float) = 0
		_AlphaU("AlphaU", Float) = 0
		_AlphaV("AlphaV", Float) = 0
		[Toggle(_SOFTDISSOLVESWITCH_ON)] _SoftDissolveSwitch("SoftDissolveSwitch", Float) = 0
		_SoftDissolveTex("SoftDissolveTex", 2D) = "white" {}
		[Toggle(_SOFTDISSOLVETEX2UV_ON)] _SoftDissolveTex2UV("SoftDissolveTex2UV", Float) = 0
		_SoftDissolveTexU("SoftDissolveTexU", Float) = 0
		_SoftDissolveTexV("SoftDissolveTexV", Float) = 0
		_SoftDissolveIndensity("SoftDissolveIndensity", Range( 0 , 1.05)) = 0
		_SoftDissolveSoft("SoftDissolveSoft", Float) = 0
		[Toggle(_SOFTMINMAXSWITCH_ON)] _SoftMinMaxSwitch("SoftMinMaxSwitch", Float) = 0
		_SoftDissolveSoftMin("SoftDissolveSoftMin", Float) = 0
		_SoftDissolveSoftMax("SoftDissolveSoftMax", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
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
		#pragma shader_feature _GRADIENTTEX2UV_ON
		#pragma shader_feature _MAINTEX2UV_ON
		#pragma shader_feature _DISTORTIONTEX2UV_ON
		#pragma shader_feature _SOFTDISSOLVESWITCH_ON
		#pragma shader_feature _ALPHATEX2UV_ON
		#pragma shader_feature _SOFTMINMAXSWITCH_ON
		#pragma shader_feature _SOFTDISSOLVETEX2UV_ON
		#pragma surface surf Lambert keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float2 uv_texcoord;
			float2 uv2_texcoord2;
		};

		uniform sampler2D _GradientTex;
		uniform float _GradientTexU;
		uniform float _GradientTexV;
		uniform float4 _GradientTex_ST;
		uniform sampler2D _MainTex;
		uniform float _MainU;
		uniform float _MainV;
		uniform float4 _MainTex_ST;
		uniform sampler2D _DistortionTex;
		uniform float4 _DistortionTex_ST;
		uniform float _DistortionU;
		uniform float _DistortionV;
		uniform float _DistortionIndensity;
		uniform float _Indensity;
		uniform float4 _Color;
		uniform sampler2D _AlphaTex;
		uniform float _AlphaU;
		uniform float _AlphaV;
		uniform float4 _AlphaTex_ST;
		uniform float _SoftDissolveSoft;
		uniform sampler2D _SoftDissolveTex;
		uniform float _SoftDissolveTexU;
		uniform float _SoftDissolveTexV;
		uniform float4 _SoftDissolveTex_ST;
		uniform float _SoftDissolveIndensity;
		uniform float _SoftDissolveSoftMin;
		uniform float _SoftDissolveSoftMax;
		uniform float _Opacity;

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 appendResult53 = (float2(_GradientTexU , _GradientTexV));
			float2 uv0_GradientTex = i.uv_texcoord * _GradientTex_ST.xy + _GradientTex_ST.zw;
			float2 uv1_GradientTex = i.uv2_texcoord2 * _GradientTex_ST.xy + _GradientTex_ST.zw;
			#ifdef _GRADIENTTEX2UV_ON
				float2 staticSwitch65 = uv1_GradientTex;
			#else
				float2 staticSwitch65 = uv0_GradientTex;
			#endif
			float2 appendResult6 = (float2(_MainU , _MainV));
			float2 uv0_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float2 uv1_MainTex = i.uv2_texcoord2 * _MainTex_ST.xy + _MainTex_ST.zw;
			#ifdef _MAINTEX2UV_ON
				float2 staticSwitch69 = uv1_MainTex;
			#else
				float2 staticSwitch69 = uv0_MainTex;
			#endif
			float2 uv0_DistortionTex = i.uv_texcoord * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
			float2 uv1_DistortionTex = i.uv2_texcoord2 * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
			#ifdef _DISTORTIONTEX2UV_ON
				float2 staticSwitch66 = uv1_DistortionTex;
			#else
				float2 staticSwitch66 = uv0_DistortionTex;
			#endif
			float2 appendResult35 = (float2(_DistortionU , _DistortionV));
			float3 desaturateInitialColor43 = tex2D( _DistortionTex, ( staticSwitch66 + ( appendResult35 * _Time.y ) ) ).rgb;
			float desaturateDot43 = dot( desaturateInitialColor43, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar43 = lerp( desaturateInitialColor43, desaturateDot43.xxx, 1.0 );
			float3 lerpResult44 = lerp( float3( ( ( appendResult6 * _Time.y ) + staticSwitch69 ) ,  0.0 ) , desaturateVar43 , _DistortionIndensity);
			float4 tex2DNode1 = tex2D( _MainTex, lerpResult44.xy );
			o.Emission = ( ( (tex2D( _GradientTex, ( ( appendResult53 * _Time.y ) + staticSwitch65 ) )).rgb * (tex2DNode1).rgb ) * _Indensity * (_Color).rgb );
			float2 appendResult21 = (float2(_AlphaU , _AlphaV));
			float2 uv0_AlphaTex = i.uv_texcoord * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
			float2 uv1_AlphaTex = i.uv2_texcoord2 * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
			#ifdef _ALPHATEX2UV_ON
				float2 staticSwitch71 = uv1_AlphaTex;
			#else
				float2 staticSwitch71 = uv0_AlphaTex;
			#endif
			float3 desaturateInitialColor30 = tex2D( _AlphaTex, ( ( appendResult21 * _Time.y ) + staticSwitch71 ) ).rgb;
			float desaturateDot30 = dot( desaturateInitialColor30, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar30 = lerp( desaturateInitialColor30, desaturateDot30.xxx, 1.0 );
			float temp_output_14_0 = ( tex2DNode1.a * _Color.a * (desaturateVar30).x );
			float2 temp_cast_4 = (temp_output_14_0).xx;
			float2 temp_cast_5 = (( 1.0 - _SoftDissolveSoft )).xx;
			float2 temp_cast_6 = (_SoftDissolveSoft).xx;
			float2 appendResult75 = (float2(_SoftDissolveTexU , _SoftDissolveTexV));
			float2 uv0_SoftDissolveTex = i.uv_texcoord * _SoftDissolveTex_ST.xy + _SoftDissolveTex_ST.zw;
			float2 uv1_SoftDissolveTex = i.uv2_texcoord2 * _SoftDissolveTex_ST.xy + _SoftDissolveTex_ST.zw;
			#ifdef _SOFTDISSOLVETEX2UV_ON
				float2 staticSwitch131 = uv1_SoftDissolveTex;
			#else
				float2 staticSwitch131 = uv0_SoftDissolveTex;
			#endif
			float2 clampResult110 = clamp( ( (tex2D( _SoftDissolveTex, ( ( appendResult75 * _Time.y ) + staticSwitch131 ) )).ra + 1.0 + ( _SoftDissolveIndensity * -2.0 ) ) , float2( 0,0 ) , float2( 1,0 ) );
			float2 smoothstepResult114 = smoothstep( temp_cast_5 , temp_cast_6 , clampResult110);
			float2 temp_cast_7 = (_SoftDissolveSoftMin).xx;
			float2 temp_cast_8 = (_SoftDissolveSoftMax).xx;
			float2 smoothstepResult115 = smoothstep( temp_cast_7 , temp_cast_8 , clampResult110);
			#ifdef _SOFTMINMAXSWITCH_ON
				float2 staticSwitch118 = smoothstepResult115;
			#else
				float2 staticSwitch118 = smoothstepResult114;
			#endif
			#ifdef _SOFTDISSOLVESWITCH_ON
				float2 staticSwitch126 = ( temp_output_14_0 * staticSwitch118 );
			#else
				float2 staticSwitch126 = temp_cast_4;
			#endif
			o.Alpha = ( staticSwitch126 * _Opacity ).x;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17000
0;0;1920;1029;4185.594;-1694.931;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;72;-4161.982,1954.052;Float;False;751.5742;379.1072;软溶解流动;7;82;79;77;76;75;74;73;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;46;-2533.785,-605.2855;Float;False;1182.001;386.1057;UV扭曲贴图;9;33;34;35;36;39;41;42;43;37;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-4108.983,2084.912;Float;False;Property;_SoftDissolveTexV;SoftDissolveTexV;24;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-4111.983,2007.912;Float;False;Property;_SoftDissolveTexU;SoftDissolveTexU;23;0;Create;True;0;0;False;0;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-2483.785,-375.2852;Float;False;Property;_DistortionV;DistortionV;10;0;Create;True;0;0;False;0;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-2483.785,-455.2852;Float;False;Property;_DistortionU;DistortionU;9;0;Create;True;0;0;False;0;0;-0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;76;-3885.989,2098.659;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;75;-3883.526,2006.052;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;31;-2011.01,708.7104;Float;False;996.575;444.3248;Alpha;8;20;19;22;21;25;24;27;28;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;79;-3888.356,2170.159;Float;False;0;90;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;130;-3915.594,2328.931;Float;False;1;90;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;67;-2307.584,-674.8661;Float;False;1;42;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;37;-2232.785,-555.2856;Float;False;0;42;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;36;-2333.318,-329.1797;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;131;-3636.594,2218.931;Float;False;Property;_SoftDissolveTex2UV;SoftDissolveTex2UV;22;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;2;-2104.209,-26.31358;Float;False;697.1188;379.1068;主贴图流动;7;9;8;7;6;5;4;3;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1958.01,848.3282;Float;False;Property;_AlphaV;AlphaV;19;0;Create;True;0;0;False;0;0;-0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;-3720.527,2004.052;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;35;-2307.785,-439.2852;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-1961.01,771.3279;Float;False;Property;_AlphaU;AlphaU;18;0;Create;True;0;0;False;0;0;-0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;24;-1841.572,992.0352;Float;False;0;28;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;-2051.21,113.086;Float;False;Property;_MainV;MainV;15;0;Create;True;0;0;False;0;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;82;-3566.408,2017.646;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;66;-1997.584,-710.8661;Float;False;Property;_DistortionTex2UV;DistortionTex2UV;8;0;Create;True;0;0;False;0;0;0;1;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;22;-1821.473,896.7354;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;21;-1787.01,791.3279;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;70;-1856.804,1131.645;Float;False;1;28;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-2147.786,-439.2852;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-2054.209,36.08621;Float;False;Property;_MainU;MainU;14;0;Create;True;0;0;False;0;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;86;-3361.04,1912.928;Float;False;2176.837;720.1458;软溶解;14;115;114;113;112;111;110;109;108;107;106;105;103;102;90;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;41;-1995.786,-496.2855;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;90;-3311.04,1962.928;Float;True;Property;_SoftDissolveTex;SoftDissolveTex;21;0;Create;True;0;0;False;0;None;9c6be083f8393bd499ab046cd9184138;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;6;-1880.209,25.68629;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;47;-2302.367,-1224.019;Float;False;719.1189;379.1068;渐变叠加贴图流动;8;57;55;54;53;52;51;50;65;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;102;-2465.954,2416.246;Float;False;Constant;_Float2;Float 2;33;0;Create;True;0;0;False;0;-2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;7;-1883.972,189.7931;Float;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;103;-2592.954,2335.246;Float;False;Property;_SoftDissolveIndensity;SoftDissolveIndensity;25;0;Create;True;0;0;False;0;0;0.5;0;1.05;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;5;-1882.672,118.2931;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;71;-1546.804,1095.645;Float;False;Property;_AlphaTex2UV;AlphaTex2UV;17;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-1624.01,789.3279;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;68;-2116.804,380.6447;Float;False;1;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;42;-1843.786,-535.2855;Float;True;Property;_DistortionTex;DistortionTex;7;0;Create;True;0;0;False;0;None;369c020ad9005f345842e241d7c188ef;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;51;-2249.368,-1092.62;Float;False;Property;_GradientTexV;GradientTexV;6;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-1717.209,23.68631;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-2304.954,2270.246;Float;False;Constant;_Float0;Float 0;33;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;69;-1806.804,344.6447;Float;False;Property;_MainTex2UV;MainTex2UV;13;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;27;-1465.749,785.751;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-2297.954,2340.246;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-2252.367,-1169.619;Float;False;Property;_GradientTexU;GradientTexU;5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;105;-2398.73,2060.325;Float;True;True;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;45;-1553.097,-206.6291;Float;False;Property;_DistortionIndensity;DistortionIndensity;11;0;Create;True;0;0;False;0;0;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;55;-2060.129,-1007.913;Float;False;0;61;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;28;-1335.435,758.7104;Float;True;Property;_AlphaTex;AlphaTex;16;0;Create;True;0;0;False;0;None;06ca7f4e15d38b44ea670db94e64af32;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;52;-2058.829,-1079.413;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;64;-2168.462,-888.098;Float;False;1;61;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;43;-1555.785,-528.2855;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-1563.091,37.28042;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-1782.682,2308.072;Float;False;Property;_SoftDissolveSoft;SoftDissolveSoft;26;0;Create;True;0;0;False;0;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;108;-2147.025,2205.664;Float;False;3;3;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;53;-2056.366,-1172.019;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DesaturateOpNode;30;-1037.107,762.6839;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;65;-1824.776,-976.2219;Float;False;Property;_GradientTex2UV;GradientTex2UV;4;0;Create;True;0;0;False;0;0;0;1;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;54;-1893.367,-1174.019;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;44;-1200.229,40.79488;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;113;-2030.978,2507.073;Float;False;Property;_SoftDissolveSoftMax;SoftDissolveSoftMax;29;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;110;-2025.667,2205.459;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;111;-1590.735,2248.012;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-2028.979,2422.073;Float;False;Property;_SoftDissolveSoftMin;SoftDissolveSoftMin;28;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;15;-1535.56,370.118;Float;False;500.3463;260.3333;主颜色;2;17;16;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;16;-1485.56,420.118;Float;False;Property;_Color;Color;2;1;[HDR];Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;57;-1739.248,-1160.425;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;117;-1154.642,2158.492;Float;False;348;189.3333;软溶解soft开关;1;118;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SmoothstepOpNode;115;-1789.382,2380.073;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;49;-1484.773,-1035.118;Float;False;584.2609;280;渐变叠加贴图;2;62;61;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ComponentMaskNode;29;-857.6392,757.1961;Float;False;True;False;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;114;-1440.2,2222.274;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-1022,18;Float;True;Property;_MainTex;MainTex;12;0;Create;True;0;0;False;0;None;06ca7f4e15d38b44ea670db94e64af32;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;61;-1433.773,-985.1178;Float;True;Property;_GradientTex;GradientTex;3;0;Create;True;0;0;False;0;None;cfc4d8fef9e4a484581198645f265c53;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;118;-1104.642,2208.492;Float;False;Property;_SoftMinMaxSwitch;SoftMinMaxSwitch;27;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;127;-412.5908,443.3786;Float;False;537.0822;256.2446;软溶解开关;2;128;126;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-661.7839,426.3074;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;128;-369.9106,557.9702;Float;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;13;-731,17;Float;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;62;-1143.178,-978.6017;Float;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-663.5933,-723.972;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;17;-1277.88,421.7639;Float;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;11;200.8888,840.9791;Float;False;Property;_Opacity;Opacity;1;0;Create;True;0;0;False;0;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-687.3669,100.3918;Float;False;Property;_Indensity;Indensity;0;0;Create;True;0;0;False;0;1;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;126;-174.8404,493.3786;Float;False;Property;_SoftDissolveSwitch;SoftDissolveSwitch;20;0;Create;True;0;0;False;0;0;0;1;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-99.20004,128.6;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;129;248.3099,574.3942;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;504.9753,107.3348;Float;False;True;2;Float;ASEMaterialInspector;0;0;Lambert;SinCourse/BlendTexture+Alpha+Distortion+Gradient+2UV+Dissolve;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;1;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;30;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;75;0;74;0
WireConnection;75;1;73;0
WireConnection;131;1;79;0
WireConnection;131;0;130;0
WireConnection;77;0;75;0
WireConnection;77;1;76;0
WireConnection;35;0;34;0
WireConnection;35;1;33;0
WireConnection;82;0;77;0
WireConnection;82;1;131;0
WireConnection;66;1;37;0
WireConnection;66;0;67;0
WireConnection;21;0;19;0
WireConnection;21;1;20;0
WireConnection;39;0;35;0
WireConnection;39;1;36;0
WireConnection;41;0;66;0
WireConnection;41;1;39;0
WireConnection;90;1;82;0
WireConnection;6;0;4;0
WireConnection;6;1;3;0
WireConnection;71;1;24;0
WireConnection;71;0;70;0
WireConnection;25;0;21;0
WireConnection;25;1;22;0
WireConnection;42;1;41;0
WireConnection;8;0;6;0
WireConnection;8;1;5;0
WireConnection;69;1;7;0
WireConnection;69;0;68;0
WireConnection;27;0;25;0
WireConnection;27;1;71;0
WireConnection;107;0;103;0
WireConnection;107;1;102;0
WireConnection;105;0;90;0
WireConnection;28;1;27;0
WireConnection;43;0;42;0
WireConnection;9;0;8;0
WireConnection;9;1;69;0
WireConnection;108;0;105;0
WireConnection;108;1;106;0
WireConnection;108;2;107;0
WireConnection;53;0;50;0
WireConnection;53;1;51;0
WireConnection;30;0;28;0
WireConnection;65;1;55;0
WireConnection;65;0;64;0
WireConnection;54;0;53;0
WireConnection;54;1;52;0
WireConnection;44;0;9;0
WireConnection;44;1;43;0
WireConnection;44;2;45;0
WireConnection;110;0;108;0
WireConnection;111;0;109;0
WireConnection;57;0;54;0
WireConnection;57;1;65;0
WireConnection;115;0;110;0
WireConnection;115;1;112;0
WireConnection;115;2;113;0
WireConnection;29;0;30;0
WireConnection;114;0;110;0
WireConnection;114;1;111;0
WireConnection;114;2;109;0
WireConnection;1;1;44;0
WireConnection;61;1;57;0
WireConnection;118;1;114;0
WireConnection;118;0;115;0
WireConnection;14;0;1;4
WireConnection;14;1;16;4
WireConnection;14;2;29;0
WireConnection;128;0;14;0
WireConnection;128;1;118;0
WireConnection;13;0;1;0
WireConnection;62;0;61;0
WireConnection;63;0;62;0
WireConnection;63;1;13;0
WireConnection;17;0;16;0
WireConnection;126;1;14;0
WireConnection;126;0;128;0
WireConnection;12;0;63;0
WireConnection;12;1;10;0
WireConnection;12;2;17;0
WireConnection;129;0;126;0
WireConnection;129;1;11;0
WireConnection;0;2;12;0
WireConnection;0;9;129;0
ASEEND*/
//CHKSM=17FAAE4F76EB9D3976CD8A5CFB04C4100562E6D4