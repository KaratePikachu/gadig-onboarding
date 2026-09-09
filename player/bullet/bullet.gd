extends Area2D
class_name Bullet

##The speed at which the log should move (in px/sec)
@export var speed : float

##The direction the bullet should move in
var direction : Vector2 = Vector2.UP

func _process(delta: float) -> void:
	position += direction*speed

##When the bullet runs into something. NOTE: The collision mask determine what this can detect
func _on_body_entered(body: Node2D) -> void:
	queue_free()
