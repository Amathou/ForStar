extends Area2D


var entered = false

func _on_body_entered(_body: PhysicsBody2D):
	entered = true


func _on_body_exited(_body):
	entered = false


func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/ship_1/Ship_1.tscn")
