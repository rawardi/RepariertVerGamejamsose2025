extends Control

func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Start.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	BG_MUSIC._play_ingame_music()


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_level3.tscn")
	BG_MUSIC._play_ingame_music()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_level4.tscn")
	BG_MUSIC._play_ingame_music()
