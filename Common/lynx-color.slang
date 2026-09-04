#version 450

/*
   Shader Modified for Atari Lynx
   Based on Color Mangler by hunterk / Pokefan531
   License: Public domain
*/
// Shader that replicates the LCD Colorspace from Atari Lynx --

layout(push_constant) uniform Push
{
    float darken_screen;
} params;

layout(std140, set = 0, binding = 0) uniform UBO
{
	mat4 MVP;
	vec4 OutputSize;
	vec4 OriginalSize;
	vec4 SourceSize;
	float mode;
} global;

#pragma parameter mode "Color Profile (1=sRGB, 2=DCI, 3=Rec2020)" 1.0 1.0 3.0 1.0
int color_mode = int(global.mode);

#pragma parameter darken_screen "External Darken Screen" 0.0 0.0 1.0 0.05

#define target_gamma 2.2
#define display_gamma 2.2

/*
    Atari Lynx matrices. Slightly punchier than the Game Gear, 
    but still retaining the characteristics of a 1989 passive-matrix LCD.
*/
const mat4 Lynx_sRGB = mat4(
	0.88, 0.12, 0.12, 0.0,  //red channel
	0.15, 0.78, 0.12, 0.0,  //green channel
	0.08, 0.15, 0.82, 0.0,  //blue channel
	0.0,  0.0,  0.0,  0.92  //alpha channel 
); 

const mat4 Lynx_DCI = mat4(
	0.78, 0.15, 0.15, 0.0,  
	0.20, 0.72, 0.15, 0.0,  
	0.05, 0.18, 0.78, 0.0,  
	0.0,  0.0,  0.0,  0.96  
); 

const mat4 Lynx_Rec2020 = mat4(
	0.68, 0.18, 0.15, 0.0,  
	0.25, 0.68, 0.18, 0.0,  
	0.08, 0.18, 0.75, 0.0,  
	0.0,  0.0,  0.0,  1.0   
); 

#pragma stage vertex
layout(location = 0) in vec4 Position;
layout(location = 1) in vec2 TexCoord;
layout(location = 0) out vec2 vTexCoord;
layout(location = 1) out mat4 profile;

void main()
{
	gl_Position = global.MVP * Position;
	vTexCoord = TexCoord;

	if (color_mode == 1) profile = Lynx_sRGB;
	else if (color_mode == 2) profile = Lynx_DCI;
	else if (color_mode == 3) profile = Lynx_Rec2020;
}

#pragma stage fragment
layout(location = 0) in vec2 vTexCoord;
layout(location = 1) in mat4 profile;
layout(location = 0) out vec4 FragColor;
layout(set = 0, binding = 2) uniform sampler2D Source;

void main()
{
	float lum = profile[3].w;

	vec4 screen = pow(texture(Source, vTexCoord), vec4(target_gamma + (params.darken_screen * 1.6))).rgba;
	screen = clamp(screen * lum, 0.0, 1.0);
	screen = profile * screen;
	FragColor = pow(screen, vec4(1.0 / display_gamma));
}
