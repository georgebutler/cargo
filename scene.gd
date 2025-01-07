extends Node

signal scene_changed(new_scene: String)

func main_menu() -> void:
	for child in $Environment.get_children():
		child.queue_free()
		
	var scene = preload("res://environments/main_menu.tscn").instantiate()
	$Environment.add_child(scene)
	
	scene_changed.emit("main_menu")
	
func new_game() -> void:
	for child in $Environment.get_children():
		child.queue_free()
		
	var scene = preload("res://environments/ship.tscn").instantiate()
	$Environment.add_child(scene)
	
	scene_changed.emit("ship")

func _ready() -> void:
	print("Scene Module: Loaded")
