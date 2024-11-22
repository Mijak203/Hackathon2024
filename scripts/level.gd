extends Node2D

const BLOCK = preload("res://scenes/block.tscn")

@onready var counter_1: Label = $BuildMenu/Elements/HBoxContainer1/Counter1
@onready var counter_2: Label = $BuildMenu/Elements/HBoxContainer2/Counter2
@onready var terrain: TileMapLayer = $Terrain
@onready var choser: Sprite2D = $BuildMenu/Choser

var block_number = 1

func _ready() -> void:
	choser.position = Vector2(22,11)
	choser.hide()


func _process(delta: float) -> void:
	counter_1.text = str(Global.collected_blocks1)
	counter_2.text = str(Global.collected_blocks2)
	
	if Input.is_action_just_pressed("build"):
		buildMenu()
		
	moveAndChose()

func buildMenu():
	if Global.placing == false:
		if Global.build_mode == true:
			Engine.time_scale = 1
			terrain.material.set_shader_parameter("s_enable", false) 
			Global.build_mode = false
			choser.hide()
		else:
			Engine.time_scale = 0.2
			terrain.material.set_shader_parameter("s_enable", true)
			Global.build_mode = true
			choser.show()


func moveAndChose():
	if Global.build_mode == true and Global.placing == false:
		if Input.is_action_just_pressed("go_right") and block_number < 2:
			choser.position += Vector2(34,0)
			block_number += 1
		elif Input.is_action_just_pressed("go_left") and block_number > 1:
			choser.position -= Vector2(34,0)
			block_number -= 1
		elif Input.is_action_just_pressed("apply"):
			insertNodes()
		
func insertNodes():
	Global.placing = true
	if block_number == 1 and Global.collected_blocks1 > 0:
		Global.collected_blocks1 -= 1
		var instance1 = BLOCK.instantiate()
		Global.blocks_id.append(instance1.get_instance_id())
		Global.block_id = instance1.get_instance_id()
		add_child(instance1)
		
		instance1.position = Vector2(64,64)
		instance1.position += Vector2.ONE * 16 / 2 
		
	elif block_number == 2 and Global.collected_blocks2 > 0:
		Global.collected_blocks2 -= 1
		var instance2 = BLOCK.instantiate()
		Global.blocks_id.append(instance2.get_instance_id())
		var instance3 = BLOCK.instantiate()
		Global.blocks_id.append(instance3.get_instance_id())
		add_child(instance2)
		add_child(instance3)
		
		instance2.position = Vector2(64,64)
		instance3.position = Vector2(80,64)
		instance2.position += Vector2.ONE * 16 / 2 
		instance3.position += Vector2.ONE * 16 / 2 
		
	else:
		#brak dostępnych klockow
		Global.placing = false


	
