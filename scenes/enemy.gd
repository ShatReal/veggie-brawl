extends RigidBody2D


const _IMPULSE := 20
const _DELAY := 2
const _RANGE := 5

onready var _timer = $Timer


func _on_timer_timeout() -> void:
	apply_central_impulse(Vector2.RIGHT.rotated(randf() * 2 * PI) * _IMPULSE)
	_timer.wait_time = randi() % _RANGE + _DELAY
	_timer.start()
