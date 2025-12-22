shader_type canvas_item;
uniform float red;
uniform float green;
uniform float blue;
void fragment() {
	COLOR = vec4(red, green, blue, COLOR.a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
