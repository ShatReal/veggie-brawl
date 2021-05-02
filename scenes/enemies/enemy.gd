extends RigidBody2D


const _ANGLE_RANGE := PI / 6
const _IMPULSE := 600
const _DELAY := 0.5
const _RANGE := 1
const _SPRITES := [
	"res://scenes/enemies/bread.tscn",
	"res://scenes/enemies/carrot_0.tscn",
	"res://scenes/enemies/carrot_1.tscn",
	"res://scenes/enemies/onion.tscn",
	"res://scenes/enemies/potato.tscn",
]

var player:RigidBody2D

onready var hit = $Hit
onready var _timer = $Timer
onready var _move = $Move


func _init():
	add_child(load(_SPRITES[randi()%_SPRITES.size()]).instance())


func _on_timer_timeout() -> void:
	if player:
		var a:Vector2
		if not randi() % 3:
			a = position.direction_to(player.position).rotated(randf() * _ANGLE_RANGE - _ANGLE_RANGE / 2)
		else:
			a = Vector2.RIGHT.rotated(randf() * 2 * PI)
		apply_central_impulse(a * _IMPULSE)
		_timer.wait_time = randf() * _RANGE + _DELAY
		_timer.start()
		_move.play()


# warning-ignore:unused_argument
func _on_body_entered(body: Node) -> void:
	if randi() % 2:
		hit.play()
