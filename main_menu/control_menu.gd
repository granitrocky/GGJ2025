extends Control

@onready var control_menu: Control = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	control_menu.visible = false





func _on_texture_button_pressed() -> void:
	control_menu.visible = false


func _on_button_pressed() -> void:
	control_menu.visible = true
