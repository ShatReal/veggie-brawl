extends Area2D


signal enemy_killed
signal player_killed


func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		emit_signal("player_killed")
	else:
		emit_signal("enemy_killed")
		body.queue_free()
