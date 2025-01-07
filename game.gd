extends Node

var state = {
	"scene": "",
	"phase": -1
}

func _on_scene_scene_changed(new_scene: String) -> void:
	state["scene"] = new_scene
	
	if (state["scene"] == "main_menu"):
		state["phase"] = -1
	elif (state["scene"] == "ship"):
		state["phase"] = 0

func _ready() -> void:
	$Scene.main_menu()
