extends Node

func _ready() -> void:
	print("Dialogue Module: Loaded")

func _on_scene_scene_changed(new_scene: String) -> void:
	if (new_scene != "ship"):
		print("Dialogue Module: Hiding UI")
		$Display.visible = false
