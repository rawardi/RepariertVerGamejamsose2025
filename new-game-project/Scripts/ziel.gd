extends Area2D

var leaderboard = "res://Scenes/success_screen.tscn"
@export var level_num:int

func _ready() -> void:
	if level_num == 0:
		leaderboard = "res://Scenes/Start.tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.last_level = level_num
		var load = load(leaderboard)
		$AnimatedSprite2D.play("end")
		await $AnimatedSprite2D.animation_finished
		get_tree().call_deferred("change_scene_to_file", leaderboard)
