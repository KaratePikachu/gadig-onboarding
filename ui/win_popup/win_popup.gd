extends Panel
class_name WinPopup

func _on_finish_flag_end_game() -> void:
	show()

func _on_button_pressed() -> void:
	##Reloads the current scene
	get_tree().reload_current_scene()
	
	##You can also just close the game
	#get_tree().quit()
