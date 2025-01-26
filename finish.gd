extends Label


func complete():
	show()
	await get_tree().create_timer(5.0).timeout
	get_tree().quit()
