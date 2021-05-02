extends Node


const _Battle := preload("res://scenes/battle.tscn")
const _Main_Menu := preload("res://scenes/main_menu.tscn")

var _cur_scene:Node


func _ready() -> void:
	randomize()
	_cur_scene = _Main_Menu.instance()
	add_child(_cur_scene)
	var play = $MainMenu/MarginContainer/VBoxContainer/Play
# warning-ignore:return_value_discarded
	play.connect("pressed", self, "_on_play_pressed", [], CONNECT_DEFERRED)
	play.grab_focus()
	

func _on_play_pressed() -> void:
	get_tree().paused = false
	_cur_scene.free()
	_cur_scene = _Battle.instance()
	add_child(_cur_scene)
# warning-ignore:return_value_discarded
	_cur_scene.get_node("UI/GameOver/VBoxContainer/MainMenu").connect("pressed", self, "_on_main_menu_pressed", [], CONNECT_DEFERRED)
# warning-ignore:return_value_discarded
	_cur_scene.get_node("UI/GameOver/VBoxContainer/TryAgain").connect("pressed", self, "_on_play_pressed", [], CONNECT_DEFERRED)


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	_cur_scene.free()
	_cur_scene = _Main_Menu.instance()
	add_child(_cur_scene)
	var play = $MainMenu/MarginContainer/VBoxContainer/Play
# warning-ignore:return_value_discarded
	play.connect("pressed", self, "_on_play_pressed", [], CONNECT_DEFERRED)
	play.grab_focus()
