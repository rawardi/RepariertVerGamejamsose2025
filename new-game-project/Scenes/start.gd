extends Node2D

@export var leaderboard="res://Scenes/Leaderboardtest.tscn"

var level = preload("res://Scenes/level_1.tscn")
var credits = preload("res://Scenes/credits.tscn")
var rankings = preload("res://Scenes/local_leaderboard.tscn")


var leaderboardisshown=false

func _ready() -> void:
	BG_MUSIC._play_menu_music()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(level)


func _on_leaderboard_pressed() -> void:
	get_tree().change_scene_to_packed(rankings)
#	if leaderboardisshown :
#		$LeaderboardUI.hide()
#		leaderboardisshown=false
#	else :
#		$LeaderboardUI.show()
#		leaderboardisshown=true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_packed(credits)
