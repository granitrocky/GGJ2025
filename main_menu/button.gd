extends TextureButton
	
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_mouse_entered() -> void:
	animation_player.play("new_animation")
	audio_stream_player_2d.play()
	
	
func _on_mouse_exited() -> void:
	animation_player.pause()
