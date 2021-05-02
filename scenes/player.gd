extends RigidBody2D


const _FORCE := 200

var _dir := Vector2()

onready var hit := $Hit
onready var _move := $Move


func _physics_process(_delta: float) -> void:
	_dir = Vector2.ZERO
	if Input.is_action_just_pressed("right"):
		_dir.x += 1
	if Input.is_action_just_pressed("left"):
		_dir.x -= 1
	if Input.is_action_just_pressed("down"):
		_dir.y += 1
	if Input.is_action_just_pressed("up"):
		_dir.y -= 1
	_dir = _dir.normalized()
	if not _dir.length() == 0:
		_move.play()
		apply_central_impulse(_dir * _FORCE)


func _on_body_entered(_body: Node) -> void:
	hit.play()
