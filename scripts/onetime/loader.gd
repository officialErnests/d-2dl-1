extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("start")

func loadMain() -> void:
	get_tree().change_scene_to_file("res://scenes/intro.tscn")