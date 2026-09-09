extends StaticBody2D
class_name Door

##An external reference to the key that opens this door
@export var button : DoorButton


func _ready() -> void:
	##Connecting a signal via code
	button.pressed.connect(open)


func open() -> void:
	hide()
	collision_layer = 0
