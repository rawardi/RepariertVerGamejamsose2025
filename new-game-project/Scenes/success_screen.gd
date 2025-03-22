extends Control

var playername :String
var playertime :float

@onready var endtext = $RichTextLabel
@onready var lineedit = $LineEdit

func _ready() -> void:
	playertime = Global.speed_runtime
	playertime = 1.234
	playertime *= 1000
	playertime = int(playertime)
	playertime /= 1000
	BG_MUSIC._play_menu_music()



	endtext.text = "[center][font_size=128]WICKED FINISH![/font_size][p][center][font_size=32]Your Time: " + str(playertime) + " seconds"
	lineedit.placeholder_text = "SUBMIT NAME"
	lineedit.grab_focus()

func _on_line_edit_text_submitted(new_text: String) -> void:
	playername = new_text
	Global.speed_runtime=0
	await Leaderboards.post_guest_score("marchsosegamejam2025-leaderboard-G93R", playertime, playername)
	lineedit.text = ""
	lineedit.queue_free()
	$Button.visible = true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Start.tscn")
