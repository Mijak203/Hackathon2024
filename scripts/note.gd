extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Global.note_to_open = true


func _on_body_exited(body: Node2D) -> void:
	Global.note_to_open = false
