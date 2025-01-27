extends Node2D
@onready var animation_player: AnimationPlayer = $"../Node2D/BirdTheif/AnimationPlayer"
@onready var radio_music: AudioStreamPlayer2D = $"../RadioMusic"
@onready var dialogue_bubble: Node2D = $"../Dialogue_Bubble"


var fly = false
var enter = false
		
func _input(event):
	if event is InputEventMouseButton and event.pressed and enter:
		radio_music.play()
		dialogue_bubble.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	enter = true
	if fly == false:
		animation_player.play("FlyAway")
		fly = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	enter = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Level2_Park/Level2_Park.tscn")
