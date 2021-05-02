extends Node2D


const _Spoon := preload("res://scenes/spoon.tscn")
const _TEXT := "Enemies left: %02d"

var _num_enemies:int

onready var _player := $Player
onready var _game_over := $UI/GameOver
onready var _label := $UI/GameOver/VBoxContainer/Label
onready var _left = $UI/Left


func _ready() -> void:
# warning-ignore:return_value_discarded
	_num_enemies = $Enemies.get_child_count()
	for enemy in $Enemies.get_children():
		enemy.player = _player
	_left.text = _TEXT % _num_enemies


func _on_player_killed() -> void:
	_game_over.popup_centered()
	get_tree().paused = true


func _on_enemy_killed() -> void:
	_num_enemies -= 1
	_left.text = _TEXT % _num_enemies
	match _num_enemies:
		15, 10, 5, 2, 1:
			call_deferred("_add_new_spoon")
		0:
			_label.text = "You won!"
			_game_over.popup_centered()
			get_tree().paused = true

func _add_new_spoon() -> void:
	var spoon = _Spoon.instance()
	add_child_below_node($Spoon, spoon)
	spoon.position = Vector2(spoon.OFFSCREEN_X, spoon.OFFSCREEN_Y)
