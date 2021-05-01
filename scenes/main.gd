extends Node


const _Battle := preload("res://scenes/battle.tscn")

onready var _cur_scene := $UI
onready var _play := $UI/MarginContainer/VBoxContainer/Play
onready var i_pop := $UI/IPop


func _ready() -> void:
	randomize()
	_play.grab_focus()


func _on_play_pressed() -> void:
	_cur_scene.free()
	add_child(_Battle.instance())


func _on_instructions_pressed() -> void:
	i_pop.popup_centered()
