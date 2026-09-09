extends AnimatableBody2D
class_name MovingPlatform

##The speed at which the log should move (in px/sec)
@export var speed : float

##The direction the log should move in
var direction : Vector2 = Vector2.UP
	#set(val):
		#direction = val
		#constant_linear_velocity = direction * speed

func _physics_process(delta: float) -> void:
	move_and_collide(direction * speed * delta)
	#move_and_collide(direction * speed)
