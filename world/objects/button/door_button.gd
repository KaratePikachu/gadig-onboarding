extends Area2D
class_name DoorButton

##The button doesn't know who is interested in it when it gets pressed/released
signal open
signal close

##bool to stop a key from being collected twice
var is_pressed : bool = false

@onready var button_top : Sprite2D = $Sprites/ButtonTop

##Called when a body enters the area
##This is only called if the entering body's collision layer matches this area2D's collision mask
func _on_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	
	if is_pressed:
		return
	
	button_top.position.y = 3
	is_pressed = true
	open.emit()



func _on_body_exited(body: Node2D) -> void:
	if not body is Player:
		return
	
	if not is_pressed:
		return
	
	##Current behavior is the button STAYS pressed after getting off the button
	#button_top.position.y = 0
	#is_pressed = false
	#close.emit()
