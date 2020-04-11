extends Node2D

func _ready():
	Input.set_mouse_mode(1)
	pass

func _process(delta):
	set_position(get_global_mouse_position())