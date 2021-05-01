extends StaticBody2D


const _X_RANGE := 1800
const _Y_RANGE := 600
const _WAIT_RANGE := 5
const _WAIT_OFFSET := 5
const _OFFSCREEN_X := 3000
const _OFFSCREEN_Y := -1500
const _TIME := 3

var _moving_down:bool
var x: int
var y: int

onready var _poly := $CollisionPolygon2D
onready var _timer := $Timer
onready var _tween := $Tween
onready var _area := $Area2D


func _ready() -> void:
	_move_down()


func _move_down() -> void:
	_moving_down = true
	_poly.disabled = true
# warning-ignore:integer_division
	x = randi() % _X_RANGE - _X_RANGE / 2
	if x < 0:
		scale.x = 1
	else:
		scale.x = -1
# warning-ignore:integer_division
	y = randi() % _Y_RANGE - _Y_RANGE / 2
	_tween.interpolate_property(self, "position:x", _OFFSCREEN_X * sign(x), x, _TIME)
	_tween.interpolate_property(self, "position:y", _OFFSCREEN_Y, y, _TIME)
	_tween.start()


func _on_tween_all_completed() -> void:
	if _moving_down:
		_timer.start()
	else:
		_move_down()


func _on_timer_timeout() -> void:
	_moving_down = false
	_poly.disabled = false
	for battler in _area.get_overlapping_bodies():
		battler.set_collision_mask_bit(2, true)
	_tween.interpolate_property(self, "position:x", x, _OFFSCREEN_X * sign(x), _TIME)
	_tween.interpolate_property(self, "position:y", y, _OFFSCREEN_Y, _TIME)
	_tween.start()
