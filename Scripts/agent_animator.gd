extends Node2D

class_name AgentAnimator

@export var player_controller : Charactercontroller 
@export var animationplayer : AnimationPlayer
@export var sprite  : Sprite2D 
@export var healt : KillZone

func _process(delta):
	if Input.is_action_just_pressed("attack"):
			attack()
	if player_controller.dashing:
		animationplayer.play("Dash") 
	if GameManager.death:
		animationplayer.play("Death")
		
	
	if !player_controller.attacking and !player_controller.dashing and !GameManager.death:
		if player_controller.direction == 1:
			sprite.flip_h = false
		elif player_controller.direction == -1:
			sprite.flip_h = true
	
		if abs(player_controller.velocity.x) > 0:
			animationplayer.play("walking")
		else:
			animationplayer.play("Idle")
			
		if player_controller.velocity.y < 0.0:
			animationplayer.play("Jump")
		elif player_controller.velocity.y > 0.0:
			animationplayer.play("Fall")

func attack():
	var overlapping_objects = $"../AttackZone".get_overlapping_areas()
	
	for area in overlapping_objects:
		var parent = area.get_parent()
		print(parent)
		if area.get_parent().is_in_group("Enemy"):
			area.get_parent().die()
	
	player_controller.attacking = true
	animationplayer.play("Attack")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Death":
		GameManager.restart()		
