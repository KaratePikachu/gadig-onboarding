@tool
extends StaticBody2D
class_name Door

##An external reference to the key that opens this door
@export var door_controller : Node:
	set(val):
		door_controller = val
		update_configuration_warnings()


func _ready() -> void:
	##Connecting a signal via code
	if door_controller == null:
		push_error("Missing door_controller")
		return
	if not door_controller.has_signal("open"):
		push_error("door_controller has no open signal")
		return
	if not door_controller.has_signal("close"):
		push_error("door_controller has no close signal")
		return
	
	door_controller.open.connect(_on_open)
	door_controller.close.connect(_on_close)
	
		

func _on_open() -> void:
	hide()
	collision_layer = 0

func _on_close() -> void:
	show()
	collision_layer = 1

func _get_configuration_warnings() -> PackedStringArray:
	if door_controller == null:
		return ["door_controller is null"]
	var warnings : Array[String] = []
	if not door_controller.has_signal("open"):
		warnings.append("door_controller has no signal 'open'")
	if not door_controller.has_signal("open"):
		warnings.append("door_controller has no signal 'close'")
	return warnings
