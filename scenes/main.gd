extends Node


const _Battle := preload("res://scenes/battle.tscn")
const _Main_Menu := preload("res://scenes/main_menu.tscn")
const _MUSIC := [
	"res://sounds/soup_royale_menu_loop.mp3",
	"res://sounds/soup_royale_cut.mp3",
]

var _cur_scene:Node

onready var _a_player := $AudioStreamPlayer


func _ready() -> void:
	randomize()
	_cur_scene = _Main_Menu.instance()
	add_child(_cur_scene)
	var play = $MainMenu/MarginContainer/VBoxContainer/Play
# warning-ignore:return_value_discarded
	play.connect("pressed", self, "_on_play_pressed", [true], CONNECT_DEFERRED)
	play.grab_focus()
	

func _on_play_pressed(from_main:bool=false) -> void:
	get_tree().paused = false
	_cur_scene.free()
	_cur_scene = _Battle.instance()
	add_child(_cur_scene)
# warning-ignore:return_value_discarded
	_cur_scene.get_node("UI/GameOver/VBoxContainer/MainMenu").connect("pressed", self, "_on_main_menu_pressed", [], CONNECT_DEFERRED)
# warning-ignore:return_value_discarded
	_cur_scene.get_node("UI/GameOver/VBoxContainer/TryAgain").connect("pressed", self, "_on_play_pressed", [], CONNECT_DEFERRED)
	if from_main:
		_a_player.stream = load(_MUSIC[1])
		_a_player.play()


func _on_main_menu_pressed() -> void:
	_a_player.stream = load(_MUSIC[0])
	_a_player.play()
	get_tree().paused = false
	_cur_scene.free()
	_cur_scene = _Main_Menu.instance()
	add_child(_cur_scene)
	var play = $MainMenu/MarginContainer/VBoxContainer/Play
# warning-ignore:return_value_discarded
	play.connect("pressed", self, "_on_play_pressed", [true], CONNECT_DEFERRED)
	play.grab_focus()
