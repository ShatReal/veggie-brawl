extends RigidBody2D


const _ANGLE_RANGE := PI / 6
const _IMPULSE := 600
const _DELAY := 0.5
const _RANGE := 1

var player:RigidBody2D

onready var _timer = $Timer


func _on_timer_timeout() -> void:
	if player:
		var a:Vector2
		if randi() % 2:
			a = position.direction_to(player.position).rotated(randf() * _ANGLE_RANGE - _ANGLE_RANGE / 2)
		else:
			a = Vector2.RIGHT.rotated(randf() * 2 * PI)
		apply_central_impulse(a * _IMPULSE)
		_timer.wait_time = randf() * _RANGE + _DELAY
		_timer.start()
