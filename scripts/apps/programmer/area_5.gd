extends Area2D

@export var ictory_screen: Panel

func _on_body_entered(body: Node2D) -> void:
	ictory_screen.visible = true
