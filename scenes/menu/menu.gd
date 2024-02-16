extends Node2D

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Test stuff/main.tscn")

func _on_settings_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
