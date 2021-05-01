extends Node


const _Battle := preload("res://scenes/battle.tscn")

onready var _cur_scene := $UI


func _ready() -> void:
	_cur_scene.get_node("VBoxContainer/Play").grab_focus()


func _on_play_pressed() -> void:
	_cur_scene.free()
	add_child(_Battle.instance())
