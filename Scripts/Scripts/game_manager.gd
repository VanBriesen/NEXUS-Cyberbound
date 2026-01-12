extends Node

var current_area = 1
var area_path = "res://Scenes/Areas/"
var player_healt = 2
var death = false
var can_move = true

var timer_score1 : String
var timer_score2 : String 
var timer_score3 : String

func next_level():
	
	current_area += 1
	var full_path = area_path + "level_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print("Player Entered the Stage")

func restart():
	death = false
	player_healt = 2
	get_tree().reload_current_scene()
	
func hurt():
	print("damage")
	player_healt -= 1
	if player_healt == 1:
		death = true
	
func die():
	queue_free()
	
