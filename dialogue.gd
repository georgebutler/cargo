extends Node

var dialogue_data = {}
var current_node = null

func load_dialogue_data(file_path: String) -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	dialogue_data = JSON.parse_string(file.get_as_text())
	file.close()
	
func _on_choice_pressed(next_node: String) -> void:
	start_dialogue(next_node)

func hide_dialogue() -> void:
	$Display.visible = false

func show_dialogue(text: String, choices: Array) -> void:
	$Display.visible = true
	$Display/Dialogue/Container/RichTextLabel.text = text
	
	for child in $Display/Dialogue/Container/Choices.get_children():
		child.queue_free()
	
	for choice in choices:
		var button = Button.new()
		button.text = choice["text"]
		button.pressed.connect(self._on_choice_pressed.bind(choice["next"]))
		$Display/Dialogue/Container/Choices.add_child(button)
	
func start_dialogue(node_name: String) -> void:
	current_node = dialogue_data.get(node_name)
	
	if current_node:
		show_dialogue(current_node["text"], current_node["choices"])
	else:
		hide_dialogue()

func _ready() -> void:
	print("Dialogue Module: Loaded")

func _on_scene_scene_changed(new_scene: String) -> void:
	if (new_scene != "ship"):
		print("Dialogue Module: Hiding UI")
		hide_dialogue()
