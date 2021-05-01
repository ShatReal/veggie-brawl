extends KinematicBody2D


const _SPEED := 200

var _velocity := Vector2()


func _physics_process(_delta: float) -> void:
	_velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	_velocity.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	_velocity = _velocity.normalized()
	_velocity = move_and_slide(_velocity * _SPEED)
	
