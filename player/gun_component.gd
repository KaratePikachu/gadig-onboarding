extends Node2D
class_name GunComponent

@export var bullet : PackedScene

@onready var bullet_container : Node = $BulletContainer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		var dir : Vector2 = get_local_mouse_position().normalized()
		shoot(dir)
	
func shoot(dir : Vector2) -> void:
	var new_bullet : Bullet = bullet.instantiate()
	bullet_container.add_child(new_bullet)
	new_bullet.global_position = global_position
	new_bullet.direction = dir
