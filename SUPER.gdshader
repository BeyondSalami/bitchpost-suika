shader_type canvas_item;

uniform bool rotate_90 = true;
uniform sampler2D gradient;


void fragment(){
	vec2 uv = UV;
	if (rotate_90){
		uv = UV.yx;
	}
	COLOR.rgb = texture(gradient,uv).rgb;
	COLOR.a = texture(TEXTURE,UV).a;
}