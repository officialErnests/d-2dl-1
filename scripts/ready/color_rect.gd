extends Control

var rectt = preload("res://scenes/color_rect.tscn")

func _ready() -> void:
	for i in range(100):
		var temp = rectt.instantiate()
		temp.global_position = Vector2(randf_range(0, 640),randf_range(0, 360)) - Vector2.ONE * 50
		temp.size = Vector2.ONE * randf_range(2,5)
		temp.rotation = randf_range(0, 350)
		add_child(temp)