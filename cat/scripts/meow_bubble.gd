extends Node2D

@onready var meow: Sprite2D = $Meow
@onready var pop: Sprite2D = $Pop

@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"


signal is_meowing(meowing)
var meowing = false

func _ready():
	meow.visible = false
	pop.visible = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and !meowing:
		show_mew_bubble()


func show_mew_bubble():
	meowing = true
	is_meowing.emit(true)
	animated_sprite.play("me")
	await get_tree().create_timer(0.2).timeout
	animated_sprite.play("ow")
	meow.visible = true
	await get_tree().create_timer(0.2).timeout
	is_meowing.emit(false)
	await get_tree().create_timer(1.8).timeout
	meow.visible = false
	pop.visible = true
	await get_tree().create_timer(0.5).timeout
	pop.visible = false 
	meowing = false
