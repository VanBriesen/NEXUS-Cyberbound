extends CharacterBody2D


@export var sprite : Sprite2D
@export var animation :AnimationPlayer
@export var body: CollisionShape2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft


var direction = 1
var hurting = false


func _process(delta:) :
	
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	
	var speed = 80 * delta * direction
	
	position.x += speed
	
	if direction == -1:
		sprite.flip_h = true
	else: 
		sprite.flip_h = false
