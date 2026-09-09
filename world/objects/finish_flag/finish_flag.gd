extends Area2D

signal end_game

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		end_game.emit()
