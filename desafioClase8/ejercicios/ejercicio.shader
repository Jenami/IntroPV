shader_type canvas_item;
uniform float width = 0.07;

uniform float progress = 0.05 ;

uniform vec4 colorA: hint_color;
uniform vec4 colorB: hint_color;

// Retorna la distancia al segmento
float sdSegment( in vec2 p, in vec2 a, in vec2 b ){
    vec2 pa = p-a, ba = b-a;
    float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length( pa - ba*h );
}

void fragment() {
	float grayscaleBG = sdSegment(UV, vec2(0.1, 0.5), vec2(0.9, 0.5));
	vec3 lineBackground = vec3(1.0 - smoothstep(width, width + 0.01, grayscaleBG));
	
	float grayscaleFG = sdSegment(UV, vec2(0.1, 0.5), vec2(progress, 0.5));
	float lineForeground = 1.0 - smoothstep(width, width + 0.01, grayscaleFG);

	vec3 health_color = mix(colorA.rgb, colorB.rgb, progress);
	vec3 bar = mix(lineBackground, health_color.rgb, lineForeground);
	
	COLOR = vec4(bar, 1.0);
}