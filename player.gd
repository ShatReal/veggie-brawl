extends RigidBody2D


func _physics_process(delta: float) -> void:
	var impulse = Vector2()
	if Input.is_action_just_pressed("ui_right"):
		impulse.x += 1
	if Input.is_action_just_pressed("ui_left"):
		impulse.x -= 1
	if Input.is_action_just_pressed("ui_down"):
		impulse.y += 1
	if Input.is_action_just_pressed("ui_up"):
		impulse.y -= 1
	impulse = impulse.normalized()
	apply_impulse(impulse.rotated(PI) * 20, impulse * 200)
