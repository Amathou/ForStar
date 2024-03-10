extends CharacterBody2D

@export var speed = 300
@onready var sprite_2d = $Sprite2D

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	

func _physics_process(_delta):
	get_input()
	move_and_slide()
	face_left()
	menu()
	check_exit()

func face_left():
	if Input.is_action_pressed("ui_left"):
		sprite_2d.flip_h = true
	if Input.is_action_pressed("ui_right"):
		sprite_2d.flip_h = false

func menu():
	if Input.is_action_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")

func check_exit():
	if Input.is_action_pressed("ui_exit"):
		get_tree().quit()
