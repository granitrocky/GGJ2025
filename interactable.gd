extends Node2D

class_name Interactable

signal interacted(interactable: Interactable)

@export var interactable_name: String

func _on_interact():
	emit_signal("interacted", self)

func receive_text(text: String):
	print(text)

func _collect():
	pass
