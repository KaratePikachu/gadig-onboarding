extends CharacterBody2D
class_name Player

##The speed the player should move in pixels per second.
@export var speed = 300.0

##The amount of velocity applied to the player when they jump
@export var jump_velocity = 550.0

##Called once when the node is first created.
##Player does not need to run any code when first created, so this can be left empty or deleted.
func _ready() -> void:
	##Since gdscript is a python-like language, empty function declarations & if statements need a "pass".
	## "pass" doesn't do anything, but helps the engine with parsing syntax when it would be ambiguous
	pass

##Called once every frame (This means frame rate dependant)
##delta is the time in seconds since the last frame.
func _process(delta: float) -> void:
	##Apply gravity if the player is in the air
	if not is_on_floor():
		velocity += get_gravity() * delta

	## Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_velocity

	## Get the input direction and handle the movement/deceleration.
	## Returns a value in the range [-1,1]
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction:
		##Acceleration
		##No need to multiply by delta since physics_process regulates the number of calls per second
		velocity.x = direction * speed
	else:
		##Decceleration
		velocity.x = move_toward(velocity.x, 0, speed)

##Called once every 1/60th of a second. 
func _physics_process(delta: float) -> void:
	##Built in function for character bodies to move & automatically handle physics stuff.
	##Because this is physics related, it's in _physics_process
	move_and_slide()
