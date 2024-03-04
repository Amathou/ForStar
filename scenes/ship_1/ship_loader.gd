extends Area2D

func _on_body_entered(body: CharacterBody2D):
	print("Body entered area")
	if body.is_in_group("player"):
		print("Changing scene")
		var interior_scene = preload("res://scenes/ship_1/interior/interior.tscn")
		if interior_scene:
			get_tree().change_scene(interior_scene)
		else:
			print("Failed to load scene")
