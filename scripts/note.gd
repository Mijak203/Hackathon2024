extends Area2D
@onready var label: Label = $Label


func _on_body_entered(body: Node2D) -> void:
	Global.note_to_open = true
	
	label.show()

func _on_body_exited(body: Node2D) -> void:
	Global.note_to_open = false
	label.hide()


func _process(delta: float) -> void:
	changeText()
func changeText():
	if Global.showNote == true:
		label.text ="Kliknij E aby wyłączyć"
	elif Global.showNote == false:
		label.text ="Kliknij E aby zobaczyć"
