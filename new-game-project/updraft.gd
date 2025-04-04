extends Area2D

signal draft

func _process(delta: float) -> void:
	draft.emit()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		draft.connect(body.upwards_boost)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		draft.disconnect(body.upwards_boost)
