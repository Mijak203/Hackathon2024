extends Area2D

func _process(delta: float) -> void:
	#jeżeli klucz podniesiony ustaw animację na "door-open"
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and Input.is_action_just_pressed("interaction") and Global.is_key_collected == true:
		#get tree i przejdz do następnego poziomu
		#ustaw animację na "door-opening"
		pass
