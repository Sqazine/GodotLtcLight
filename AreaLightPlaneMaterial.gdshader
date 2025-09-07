shader_type spatial;
render_mode cull_disabled;
render_mode unshaded;

//uniform mat4 model;
//uniform mat4 view;
//uniform mat4 projection;
uniform lowp vec3 lightColor;

void vertex() {
	// Called for every vertex the material is visible on.
	//POSITION = projection * view *model *vec4(VERTEX,1.0f);
}

void fragment() {
	// Called for every pixel the material is visible on.
	ALBEDO = lightColor;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}