extends Node

signal on_interact()

func interact():
	on_interact.emit()
	print("Hello")
