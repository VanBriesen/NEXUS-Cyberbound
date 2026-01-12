extends Node2D

@onready var camera: Camera2D = $Player/Camera2D

func _ready():
	camera.make_current()
	camera.limit_bottom = 300
	camera.limit_top = -300
