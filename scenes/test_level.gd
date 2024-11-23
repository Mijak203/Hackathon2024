extends Node2D



@onready var bigNote: TextureRect = $Camera2D/HFlowContainer/TextureRect



func _process(delta: float) -> void:
	if Global.showNote == true:
		bigNote.show()
	if Global.showNote == false:
		bigNote.hide()
