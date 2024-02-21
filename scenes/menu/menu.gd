extends Node2D

func _process(_delta):
	check_exit()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Test stuff/main.tscn")

func _on_settings_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()

func check_exit():
	if Input.is_action_pressed("ui_exit"):
		get_tree().quit()
