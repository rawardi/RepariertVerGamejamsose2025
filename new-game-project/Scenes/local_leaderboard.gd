extends Control

@onready var rankingtext = $RichTextLabel

var best_time_path_1 = "res://bestTime1.txt"
var best_time_name_path_1 = "res://bestTimeName1.txt"

var best_time : Array = [0, 0, 0, 0, 0]
var best_time_name : Array = ["", "", "", "", ""]

var best_time_path_2 = "res://bestTime2.txt"
var best_time_name_path_2 = "res://bestTimeName2.txt"


func _ready() -> void:
	_load_best_time1()
	_load_best_time_name1()
	
	rankingtext.text = "[center][font_size=64]Rankings[p][font_size=48][center]Level 1:[p]" 
	var r = 0
	while r < best_time.size():
		if best_time[r] != 0:
			rankingtext.text += "[center]" + str(best_time[r]) + " " + best_time_name[r] + "[p]"
		else:
			rankingtext.text += "[center]---[p]"
		r += 1
	
	_load_best_time2()
	_load_best_time_name2()
	
	rankingtext.text += "[font_size=48][center]Level 2:[p]" 
	r = 0
	while r < best_time.size():
		if best_time[r] != 0:
			rankingtext.text += "[center]" + str(best_time[r]) + " " + best_time_name[r] + "[p]"
		else:
			rankingtext.text += "[center]---[p]"
		r += 1
		

func _load_best_time1():
	if FileAccess.file_exists(best_time_path_1):
		var file = FileAccess.open(best_time_path_1, FileAccess.READ)
		best_time = file.get_var(true)
		file.close()

func _load_best_time_name1():
	if FileAccess.file_exists(best_time_name_path_1):
		var file = FileAccess.open(best_time_name_path_1, FileAccess.READ)
		best_time_name = file.get_var(true)
		file.close()

func _load_best_time2():
	if FileAccess.file_exists(best_time_path_2):
		var file = FileAccess.open(best_time_path_2, FileAccess.READ)
		best_time = file.get_var(true)
		file.close()

func _load_best_time_name2():
	if FileAccess.file_exists(best_time_name_path_2):
		var file = FileAccess.open(best_time_name_path_2, FileAccess.READ)
		best_time_name = file.get_var(true)
		file.close()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Start.tscn")
