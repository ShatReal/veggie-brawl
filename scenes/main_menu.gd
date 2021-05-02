extends Control


onready var _i_pop = $IPop
onready var _c_pop = $CPop
onready var _m_pop = $MPop


func _on_instructions_pressed() -> void:
	_i_pop.popup_centered()


func _on_credits_pressed() -> void:
	_c_pop.popup_centered()


func _on_more_info_pressed() -> void:
	_m_pop.popup_centered()


func _on_meta_clicked(meta) -> void:
	OS.shell_open(meta)
