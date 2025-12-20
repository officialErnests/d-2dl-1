extends ColorRect

var x = 0
func _process(delta: float) -> void:
	x += delta
	var distance = get_viewport().get_mouse_position().distance_squared_to( global_position)
	
	material.set("shader_parameter/closenes", distance / 4000)
	global_position.x += distance / 200 * pow(sin(x / 2), 3)
	position.y += sin(x / 3) + 2
	rotation += delta
	if (position.x > 460):
		position.x = -100
	elif (position.x < -200):
		position.x = 450
	if (position.y > 360):
		position.y = -200
