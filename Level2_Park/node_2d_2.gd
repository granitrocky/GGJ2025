extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../StaticBody2D5/AudioStreamPlayer2D"
@onready var dialogue_bubble: Node2D = $"../Node2D/Dialogue_Bubble"
var enter = true
func _input(event):
	if event is InputEventMouseButton and event.pressed and enter:
		audio_stream_player_2d.stop()
		dialogue_bubble.queue_free()
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	enter = true
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	enter = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Level3_FarmersMarket/Level3_FarmersMarket.tscn")
