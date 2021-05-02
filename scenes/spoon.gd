extends Area2D


const OFFSCREEN_X := 3000
const OFFSCREEN_Y := -1500
const _X_RANGE := 1800
const _Y_RANGE := 600
const _WAIT_RANGE := 5
const _WAIT_OFFSET := 5
const _TIME := 3

var _moving_down:bool
var x: int
var y: int

onready var _timer := $Timer
onready var _tween := $Tween


func _ready() -> void:
	_move_down()


func _move_down() -> void:
	_moving_down = true
# warning-ignore:integer_division
	x = randi() % _X_RANGE - _X_RANGE / 2
	if x < 0:
		scale.x = 1
	else:
		scale.x = -1
# warning-ignore:integer_division
	y = randi() % _Y_RANGE - _Y_RANGE / 2
	_tween.interpolate_property(self, "position:x", OFFSCREEN_X * sign(x), x, _TIME)
	_tween.interpolate_property(self, "position:y", OFFSCREEN_Y, y, _TIME)
	_tween.start()


func _on_tween_all_completed() -> void:
	if _moving_down:
		_timer.start()
	else:
		_move_down()


func _on_timer_timeout() -> void:
	_moving_down = false
	for battler in get_overlapping_bodies():
		if battler is RigidBody2D:
			battler.mode = RigidBody2D.MODE_KINEMATIC
			battler.set_collision_layer_bit(0, false)
			battler.set_collision_layer_bit(1, true)
			battler.set_collision_mask_bit(0, false)
			var pos:Vector2 = battler.global_position
			var rot:float = battler.global_rotation
			battler.get_parent().remove_child(battler)
			add_child(battler)
			battler.global_position = pos
			battler.global_rotation = rot
	_tween.interpolate_property(self, "position:x", x, OFFSCREEN_X * sign(x), _TIME)
	_tween.interpolate_property(self, "position:y", y, OFFSCREEN_Y, _TIME)
	_tween.start()
