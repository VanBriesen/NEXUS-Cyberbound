extends CharacterBody2D

class_name Charactercontroller

var direction = 0
@export var speed = 10
@export var jump = 8
@export var attacking = false



const SPEED_multiplier = 30.0
const JUMP_VELOCITY_multiplier = -50.0
const dash = 3

var dashing = false
var can_dash = true
var jump_count = 0

var healt = 3
var death = false


var conveyor_velocity: float = 0.0

func _physics_process(delta: float) -> void:
	
	if !GameManager.death and GameManager.can_move:
	# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		if is_on_floor():
			jump_count = 0
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and jump_count < 2:
			jump_count += 1
			velocity.y = JUMP_VELOCITY_multiplier * jump
		if Input.is_action_pressed("Down"):
			set_collision_mask_value(9, false)
		else:
			set_collision_mask_value(9, true)

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED_multiplier * speed 
			$AttackZone.position.x = abs($AttackZone.position.x) * direction 
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED_multiplier * speed )
		if dashing:
			velocity.x = direction * SPEED_multiplier * speed  * dash
			velocity.y = 0
		
		if Input.is_action_pressed("dash") and can_dash:
			_dashing()
		
		velocity.x += conveyor_velocity 
		
		move_and_slide()
	elif GameManager.death:
		velocity += get_gravity() * delta
	
		if Input.is_action_just_pressed("restart"):
			get_tree().reload_current_scene()
			GameManager.death = false
func _on_dash_timer_timeout() -> void:
	dashing = false

func _on_dash_again_timer_timeout() -> void:
	can_dash = true
	
func _dashing():
	can_dash = false
	dashing = true
	$dash_timer.start()
	$dash_again_timer.start()
