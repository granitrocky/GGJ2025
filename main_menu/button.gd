extends TextureButton
	
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_mouse_entered() -> void:
	animation_player.play("new_animation")
	
func _on_mouse_exited() -> void:
	animation_player.pause()
