extends Node2D

@onready var camera: Camera2D = $CharacterBody2D/Camera2D

func _ready():
	$ColorRect/AnimationPlayer.play("fade_out")
	camera.make_current()
	camera.limit_left = -1440
