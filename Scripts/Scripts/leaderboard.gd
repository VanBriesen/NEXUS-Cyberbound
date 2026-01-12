extends Node2D

class_name LeaderBoard

var scores = {
	"V" = 16,
	"DaquaviousT" = 19,
	"Karl_Kirche" = 22
	
}

func board():
	scores.sort()
	
