extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("start")

func loadMain() -> void:
	get_tree().change_scene_to_file("res://scenes/intro.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		loadMain()