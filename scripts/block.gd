extends CharacterBody2D


var animation_speed = 20
var moving = false
var tile_size = 16

var is_coliding = false

var inputs = {
	"go_right": Vector2.RIGHT,
	"go_left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size / 2
	
func _unhandled_input(event):
	if Global.build_mode == true and Global.placing == true and !is_in_group("already_placed"):
		get_node("CollisionShape2D").disabled = true 
		if moving:
			return
		for dir in inputs.keys():
			if event.is_action_pressed(dir):
				move(dir)
		if Input.is_action_just_pressed("enter") and !is_coliding:
			Global.placing = false
			for n in Global.blocks_id:
				#var temp = instance_from_id(Global.blocks_id[n])
				#temp.add_to_group("already_placed")
				
				instance_from_id(n).add_to_group("already_placed")
				
				#var temp = instance_from_id(Global.block_id)
				#temp.add_to_group("already_placed")
			get_node("CollisionShape2D").disabled = false
			
func move(dir):
	#position += inputs[dir] * tile_size
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
	moving = true
	await tween.finished
	moving = false


#setting var is_colidnig
func _on_area_entered(area: Area2D) -> void:
	is_coliding = true
func _on_area_exited(area: Area2D) -> void:
	is_coliding = false
func _on_body_entered(body: Node2D) -> void:
	is_coliding = true
func _on_body_exited(body: Node2D) -> void:
	is_coliding = false
