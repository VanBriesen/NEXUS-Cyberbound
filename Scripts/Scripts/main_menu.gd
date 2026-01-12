extends Node2D

var button_type = null

func _on_start_pressed() -> void:
	button_type = "start"
	$ColorRect.show()
	$ColorRect/fadetimer.start()
	$ColorRect/AnimationPlayer.play("fade_in")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fadetimer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://Scenes/Areas/level_1.tscn")
	if button_type == "options":
		pass
