extends Area2D

var leaderboard = "res://Scenes/success_screen.tscn"
@export var level_num = null

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.last_level = level_num
		var load = load(leaderboard)
		get_tree().call_deferred("change_scene_to_file", leaderboard)
