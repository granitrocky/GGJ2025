extends Area2D

func _process(_delta):
	if is_mouse_inside():
		print("Mouse is hovering over the shape!")
	else:
		print("")

func is_mouse_inside() -> bool:
	var mouse_pos = get_global_mouse_position()
	print(mouse_pos)
	return _is_point_in_polygons(mouse_pos)

# Function to check if a point is inside any of the collision polygons
func _is_point_in_polygons(point):
	for child in get_children():
		if child is CollisionPolygon2D:
			print("checking", child)
			if Geometry2D.is_point_in_polygon(point, child.polygon):
				return true
	return false
