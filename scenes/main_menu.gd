extends Control


onready var _i_pop = $IPop


func _on_instructions_pressed() -> void:
	_i_pop.popup_centered()
