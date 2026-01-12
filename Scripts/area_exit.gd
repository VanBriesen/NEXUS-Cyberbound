extends Area2D

class_name AreaExit

@export var player: Charactercontroller
@export var menu: Sprite2D
@export var stopwatch: StopWatch
@export var stopwatch_lable: Label
@export var lable_text1: Label
@export var lable_text2: Label



func _on_body_entered(body):
	if body is Charactercontroller:
		print("Level Cleared")
		GameManager.can_move = false
		menu.show()
		stopwatch.stopped = true	
		stopwatch_lable.text = stopwatch.time_to_string()
		if GameManager.current_area == 1:
			GameManager.timer_score1 = stopwatch.time_to_string()
		elif GameManager.current_area == 2:
			GameManager.timer_score2 = stopwatch.time_to_string()
		elif GameManager.current_area == 3:
			lable_text1.text = GameManager.timer_score1
			lable_text2.text = GameManager.timer_score2
	
func sort_by_time(a, b):
	if a["time"] < b["time"]:
		return true
	return false

	
func _on_next_pressed() -> void:
	stopwatch.reset()
	GameManager.can_move = true
	GameManager.next_level()

func _on_restart_pressed() -> void:
	GameManager.can_move = true
	get_tree().reload_current_scene()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
