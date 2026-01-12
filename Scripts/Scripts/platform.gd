extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var enabled: Timer = $Enabled
@onready var disabled: Timer = $Disabled

@export var appearence: float = 1
const default_timer: float = 5.0
var movement: Vector2 = Vector2(100, 100)
var start_position: Vector2

func _ready() -> void:
	enabled.start(default_timer * appearence)

func _process(delta):
	start_position = collision_shape_2d.position
	#enabled.wait_time = default_timer *  appearence
	#enabled.one_shot = true	
	#disabled.wait_time = default_timer * appearence
	#disabled.one_shot = true	
	animation_player.speed_scale = 1 / appearence

func _on_enabled_timeout() -> void:
	collision_shape_2d.position = Vector2(10000, 10000)
	disabled.start(default_timer *appearence)

func _on_disabled_timeout() -> void:
	collision_shape_2d.position = Vector2(0,10)
	enabled.start(default_timer * appearence)
	
