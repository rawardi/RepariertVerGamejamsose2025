extends Control

var playername :String
var playertime :float

@onready var endtext = $RichTextLabel
@onready var rankingtext = $RichTextLabel2
@onready var lineedit = $LineEdit

var best_time_path = "res://bestTime.txt"
var best_time_name_path = "res://bestTimeName.txt"

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

	_load_best_time()
	_load_best_time_name()

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

	_save_best_time()
	_save_best_time_name()

	display_ranking()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Start.tscn")


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

func _save_best_time():
	var file = FileAccess.open(best_time_path, FileAccess.WRITE)
	file.store_var(best_time)
	file.close()

func _save_best_time_name():
	var file = FileAccess.open(best_time_name_path, FileAccess.WRITE)
	file.store_var(best_time_name)
	file.close()


func display_ranking():
	rankingtext.text = "[center][font_size=64]Rankings[p][font_size=32]" 
	var r = 0
	while r < best_time.size():
		if r == i:
			rankingtext.text += "[color=yellow]"
		if best_time[r] != 0:
			rankingtext.text += "[center]" + str(best_time[r]) + " " + best_time_name[r] + "[p]"
		else:
			rankingtext.text += "[center]---[p]"
		if r == i:
			rankingtext.text += "[color=white]"
		r += 1
