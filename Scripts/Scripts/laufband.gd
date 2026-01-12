extends Area2D
class_name ConveyorBelt2D


@export var horizontal_speed: float = 1.0
var objects_array: Array[Node2D] = []
var objects_speed: Array[float] = []
	
func _ready() -> void:
	set_physics_process(false)
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _physics_process(delta: float) -> void:
	for i in objects_array.size():
		if objects_array[i].is_on_floor() and objects_speed[i] != horizontal_speed:
			objects_array[i].conveyor_velocity += horizontal_speed
			objects_speed[i] = horizontal_speed
		elif !objects_array[i].is_on_floor() and objects_speed[i] != 0.0:
			objects_array[i].conveyor_velocity -= horizontal_speed
			objects_speed[i] = 0.0

func _on_body_entered(body: Node2D):
	if "conveyor_velocity" in body:
		objects_array.append(body)
		objects_speed.append(0.0)
		
	if !objects_array.is_empty():
		set_physics_process(true)
		
func _on_body_exited(body: Node2D) -> void:
	if "conveyor_velocity" in body and objects_array.has(body):
		var object_pos: int = objects_array.find(body)
		if objects_speed[object_pos] != 0.0:
			objects_array[object_pos].conveyor_velocity = 0
		objects_array.remove_at(object_pos)
		objects_array.remove_at(object_pos)
		
	if objects_array.is_empty():
		set_physics_process(false)
