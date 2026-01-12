extends Area2D

@export var character : Charactercontroller


func _process(delta):
	if character.direction == -1:
		Area2D.scale.x 
	elif !character.direction == -1:
		position.x = 17
	
