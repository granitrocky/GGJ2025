extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var enter1 = false
@onready var dialogue_bubble: Node2D = $"../Dialogue_Bubble"

@onready var dialogue_bubble_2: Node2D = $"../Dialogue_Bubble2"

@onready var dialogue_bubble_3: Node2D = $"../Dialogue_Bubble3"

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if enter1:
			dialogue_bubble_3.visible = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	enter1 = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	enter1 = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	dialogue_bubble_2.visible = true


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	dialogue_bubble.visible = true
