extends Node2D

class_name EnemyStationary

var attacking = false	
var hit = false

@export var animation : AnimationPlayer 
@export var death : Timer 
@export var dead: bool = false

func _process(delta: float) -> void:	
		if !hit:
			if attacking:
				animation.play("attack")
		
			if !attacking:
				animation.play("Idle")
		elif hit:
			animation.play("death")
func _on_area_2d_body_entered(_body):
	attacking = true
	$Timer.start()
		
func _on_timer_timeout() -> void:
	attacking = false
	
func die():
	hit = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		queue_free()
