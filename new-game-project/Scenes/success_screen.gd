extends Control

var playername :String
var playertime :float

@onready var endtext = $RichTextLabel
@onready var rankingtext = $RichTextLabel2
@onready var lineedit = $LineEdit

var best_time_path_1 = "res://bestTime1.txt"
var best_time_name_path_1 = "res://bestTimeName1.txt"
var best_time_path_2 = "res://bestTime2.txt"
var best_time_name_path_2 = "res://bestTimeName2.txt"

var best_time : Array = [0, 0, 0, 0, 0]
var best_time_name : Array = ["", "", "", "", ""]

var i = 6

func _ready() -> void:
	playertime = Global.speed_runtime
	playertime *= 1000
	playertime = int(playertime)
	playertime /= 1000
	BG_MUSIC._play_menu_music()


	endtext.text = "[center][font_size=128]WICKED FINISH![/font_size][p][center][font_size=32]Your Time: " + str(playertime) + " seconds"
	lineedit.placeholder_text = "SUBMIT NAME"
	lineedit.grab_focus()

	if Global.last_level == 1:
		
		_load_best_time1()
		_load_best_time_name1()
	
	elif Global.last_level == 2:
		
		_load_best_time2()
		_load_best_time_name2()

	Global.speed_runtime=0

	display_ranking()


func _on_line_edit_text_submitted(new_text: String) -> void:
	playername = new_text

	i = 0
	while i < best_time.size():
		if best_time[i] > playertime or best_time[i] == 0:
			best_time.insert(i, playertime)
			best_time_name.insert(i, playername)
			best_time.pop_back()
			best_time_name.pop_back()
			break
		i += 1
	lineedit.text = ""
	lineedit.queue_free()
	$Button.visible = true

	if Global.last_level == 1:
		
		_save_best_time1()
		_save_best_time_name1()
	
	elif Global.last_level == 2:
		
		_save_best_time2()
		_save_best_time_name2()
	
	display_ranking()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Start.tscn")


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

func _save_best_time1():
	var file = FileAccess.open(best_time_path_1, FileAccess.WRITE)
	file.store_var(best_time)
	file.close()

func _save_best_time_name1():
	var file = FileAccess.open(best_time_name_path_1, FileAccess.WRITE)
	file.store_var(best_time_name)
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

func _save_best_time2():
	var file = FileAccess.open(best_time_path_2, FileAccess.WRITE)
	file.store_var(best_time)
	file.close()

func _save_best_time_name2():
	var file = FileAccess.open(best_time_name_path_2, FileAccess.WRITE)
	file.store_var(best_time_name)
	file.close()


func display_ranking():
	rankingtext.text = "[center][font_size=64]Rankings[p][font_size=32]" 
	var r = 0
	while r < 5:
		if r == i:
			rankingtext.text += "[color=yellow]"
		if best_time[r] != 0:
			rankingtext.text += "[center]" + str(best_time[r]) + " " + best_time_name[r] + "[p]"
		else:
			rankingtext.text += "[center]---[p]"
		if r == i:
			rankingtext.text += "[color=white]"
		r += 1
