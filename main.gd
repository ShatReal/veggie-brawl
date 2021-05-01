extends Node


func _on_play_pressed() -> void:
	$UI.free()
	add_child(preload("res://battle.tscn").instance())
