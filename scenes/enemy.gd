extends RigidBody2D


const _IMPULSE := 400
const _DELAY := 0.5
const _RANGE := 1

onready var _timer = $Timer


func _on_timer_timeout() -> void:
	apply_central_impulse(Vector2.RIGHT.rotated(randf() * 2 * PI) * _IMPULSE)
	_timer.wait_time = randf() * _RANGE + _DELAY
	_timer.start()
