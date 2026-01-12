extends Area2D

class_name KillZone

@onready var timer: Timer = $Timer
@onready var character: Charactercontroller
@onready var player = get_node("res://Scenes/Areas/practice.tscn")



func _on_body_entered(body: Node2D):
	GameManager.hurt()
	if GameManager.death == true:
		print("You died")
