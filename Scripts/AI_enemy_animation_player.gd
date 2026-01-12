extends AnimationPlayer


@export var player: AIenemy
var kill: bool = false
var attacking :bool = false
var hit = false

func _process(delta: float) -> void:
	
	if player.dead:
		play("Hurt")
	if attacking:
		play("attack")
	if kill:
		play("Idle")
	if !attacking and !kill and !player.dead:
		play("walk")

func _on_area_2d_body_entered(body: Node2D) -> void:
		attacking = true
		$attacktimer.start()
		
func _on_attacktimer_timeout() -> void:
	attacking = false
	kill = true


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Hurt":
		player.death()
