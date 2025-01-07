extends StaticBody3D

func _on_interaction_on_interact() -> void:
	get_tree().root.get_node("Game").get_node("Dialogue").load_dialogue_data("res://data/dialogue/test.json")
	get_tree().root.get_node("Game").get_node("Dialogue").start_dialogue("start")
