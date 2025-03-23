extends Control

@onready var rankingtext = $RichTextLabel

var best_time_path = "res://bestTime.txt"
var best_time_name_path = "res://bestTimeName.txt"

var best_time : Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var best_time_name : Array = ["", "", "", "", "", "", "", "", "", ""]


func _ready() -> void:
	_load_best_time()
	_load_best_time_name()
	
	rankingtext.text = "[center][font_size=64]Rankings[p][font_size=48]" 
	var r = 0
	while r < best_time.size():
		if best_time[r] != 0:
			rankingtext.text += "[center]" + str(best_time[r]) + " " + best_time_name[r] + "[p]"
		else:
			rankingtext.text += "[center]---[p]"
		r += 1


func _load_best_time():
	if FileAccess.file_exists(best_time_path):
		var file = FileAccess.open(best_time_path, FileAccess.READ)
		best_time = file.get_var(true)
		file.close()

func _load_best_time_name():
	if FileAccess.file_exists(best_time_name_path):
		var file = FileAccess.open(best_time_name_path, FileAccess.READ)
		best_time_name = file.get_var(true)
		file.close()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Start.tscn")
