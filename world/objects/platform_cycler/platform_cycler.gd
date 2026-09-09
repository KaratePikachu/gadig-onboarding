extends Area2D

##The packed scene of the moving platform
@export var moving_platform_packed : PackedScene

##The amount of time between each platform spawning in
@export var time_between_platforms : float = 3.0

@export var platform_direction : Vector2 = Vector2.DOWN
@export var platform_speed : float = 10.0

##A reference to a node path
@onready var platform_spawn_timer : Timer = $PlatformSpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	platform_spawn_timer.wait_time = time_between_platforms
	platform_spawn_timer.timeout.emit()
	platform_spawn_timer.start()

##Called every time the timer finishes.
func _on_platform_spawn_timer_timeout() -> void:
	var new_platform : MovingPlatform = moving_platform_packed.instantiate()
	add_child(new_platform)
	new_platform.direction = platform_direction
	new_platform.speed = platform_speed

##Called when a body leaves the area
##This is only called if the leaving body's collision layer matches this area2D's collision mask
func _on_body_exited(body: Node2D) -> void:
	##HACK: this assumes that no other moving platforms, will be nearby.
	##Other platforms other than the ones this spawns might enter, exit, and be killed.
	if body is MovingPlatform:
		body.queue_free()
