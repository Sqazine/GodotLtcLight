shader_type spatial;
render_mode cull_disabled;
render_mode unshaded;

uniform sampler2D materialDiffuse;

void vertex() {
	// Called for every vertex the material is visible on.
	//POSITION = projection * view *model *vec4(VERTEX,1.0f);
}

void fragment() {
	// Called for every pixel the material is visible on.
	ALBEDO = texture(materialDiffuse,UV).xyz;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}