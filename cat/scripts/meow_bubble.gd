extends Node2D

@onready var meow: Sprite2D = $Meow
@onready var pop: Sprite2D = $Pop

func _ready():
	meow.visible = false
	pop.visible = false

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		show_mew_bubble()

func show_mew_bubble():
	meow.visible = true
	await get_tree().create_timer(2.0).timeout
	meow.visible = false
	pop.visible = true
	await get_tree().create_timer(0.5).timeout
	pop.visible = false 
