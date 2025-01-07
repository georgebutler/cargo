extends CanvasLayer

func _on_new_game_button_pressed() -> void:
	$"../Scene".new_game()

func _on_scene_scene_changed(new_scene: String) -> void:
	if (new_scene != "main_menu"):
		print("Main Menu: Hiding UI")
		visible = false
