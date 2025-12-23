extends AnimationPlayer

var debounced = false

func _ready() -> void:
	play("intro")

func _input(event: InputEvent) -> void:
	if debounced: return
	if Input.is_action_just_pressed("ui_cancel"):
		debounced = true
		play("intro_skip")