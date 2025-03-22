extends AudioStreamPlayer

var menu_music = load("res://menu_muisc.mp3")
var ingame_music = load("res://ingame_music.mp3")


func _play_menu_music() -> void:
	volume_db = 0
	if stream != menu_music: #checks if menu music is playing
		stream = menu_music #sets stream(played music) to the menu music
		play() #plays the music in the stream

func _play_ingame_music() -> void:
	volume_db = -20
	if stream != ingame_music: #checks if menu music is playing
		stream = ingame_music #sets stream(played music) to the menu music
		play() #plays the music in the stream
