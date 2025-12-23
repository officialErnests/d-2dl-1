extends AnimationPlayer

func _ready() -> void:
	play("intro")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		play("intro_skip")