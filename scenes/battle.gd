extends Node2D


const _TEXT := "Enemies left: %02d"

var _num_enemies:int

onready var _player := $Player
onready var _game_over := $UI/GameOver
onready var _label := $UI/GameOver/VBoxContainer/Label
onready var _left = $UI/Left


func _ready() -> void:
# warning-ignore:return_value_discarded
	_num_enemies = $Enemies.get_child_count()
	_left.text = _TEXT % _num_enemies


func _on_player_killed() -> void:
	_game_over.popup_centered()
	get_tree().paused = true


func _on_enemy_killed() -> void:
	_num_enemies -= 1
	_left.text = _TEXT % _num_enemies
	if _num_enemies == 0:
		_label.text = "You won!"
		_game_over.popup_centered()
		get_tree().paused = true
