extends Area2D

signal slowed

func _process(delta: float) -> void:
	slowed.emit()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		slowed.connect(body.slow_down)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		slowed.disconnect(body.slow_down)
