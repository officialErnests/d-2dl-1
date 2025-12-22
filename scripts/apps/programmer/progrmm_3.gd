extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -700.0
@export var animator: AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction > 0:
			animator.flip_h = false
		else:
			animator.flip_h = true
		velocity.x += direction * SPEED * delta
	velocity.x *= 0.98

	move_and_slide()
	if not is_on_floor():
		animator.play("jump")
	else:
		if abs(velocity.x) > 100:
			animator.play("walk")
		else:
			animator.play("idle")
