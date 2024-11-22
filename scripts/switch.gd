extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and Input.is_action_just_pressed("interaction"):
		Global.acction_after_switch_pressed = true
