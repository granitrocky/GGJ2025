extends AnimatableBody2D

@onready var polygon_2d: CollisionPolygon2D = $CollisionPolygon2D3
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

#func _ready() -> void:
	#collision_shape_2d.connect("input_event", _on_input_event)
	#
#func _on_input_event(viewport, event, shape_idx):
	#if event is InputEventMouseMotion:
		#print("Mouse is over the sprite's collision shape!")
#
#func _process(_delta):
	#if is_mouse_inside():
		#print("Mouse is hovering over the shape!")
	#else:
		#print("")
#
#func is_mouse_inside() -> bool:
	#var mouse_pos = get_global_mouse_position()
	##print(mouse_pos)
	#return _is_point_in_polygons(mouse_pos)
#
#
## Function to check if a point is inside any of the collision polygons
#func _is_point_in_polygons(point):
	#if Geometry2D.is_point_in_polygon(point, polygon_2d.polygon):
		#return true
	#return false

@onready var animation_player: AnimationPlayer = $"../Button/AnimationPlayer"

func _on_button_mouse_entered() -> void:
	animation_player.play("new_animation", )
	print("In") # Replace with function body.




func _on_button_mouse_exited() -> void:
	animation_player.pause()
