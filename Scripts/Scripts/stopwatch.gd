extends Node
class_name StopWatch

var time = 0.0
var stopped = false

func _process(delta):
	if stopped:
		return
	time += delta
	
func reset():
	time = 0.0
	
func time_to_string() -> String:
	#Ändert time variable von int zu String um es in einem Label anzuzeigen
	var msec = fmod(time, 1) * 1000
	var sec = fmod(time, 60)
	var minute = time/60
	#formatierung zu einer Stopuhr
	var format_string = "%02d : %02d : %02d"
	var actual_string = format_string % [minute, sec, msec]
	return actual_string
	
