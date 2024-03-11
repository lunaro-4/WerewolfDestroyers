extends Node2D



@export var main_sprite : AnimatedSprite2D

@onready var shapes_array = $"../Shapes".get_children() as Array[Polygon2D]

@onready var local_hit_wait


const ROTATION_FRAMES =50

func _ready():
	pass
	
func animate_after_delay(_hit_wait):
	pass
	
func animate(hit_wait):
	########code########
	
	rotate_hitbox(hit_wait)
	for shape in shapes_array:
		shape.animate(hit_wait)
	pass
	
func rotate_hitbox(hit_wait):
	var rotation_wait = hit_wait/ROTATION_FRAMES
	for i in range(ROTATION_FRAMES):
		get_parent().rotation_degrees += 90/ROTATION_FRAMES
		await get_tree().create_timer(rotation_wait).timeout
	

func animate_delay(delay_wait, _hit_wait):
	local_hit_wait = _hit_wait
	pass

func _on_attack_sprite_animation_finished():
	animate_after_delay(local_hit_wait)
	pass





	
