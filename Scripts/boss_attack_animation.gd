extends Node2D

@export var animation_polygon : Line2D
@export var main_sprite : AnimatedSprite2D
@export var attack_sprite : AnimatedSprite2D

@onready var local_hit_wait

func animate(_hit_wait):
	animation_polygon.animate(_hit_wait)

func animate_delay(delay_wait, _hit_wait):
	pass
	
	

#func _on_attack_sprite_animation_finished():
#
	#main_sprite.visible = true
	#attack_sprite.visible = false
	#attack_sprite.stop()
	##print(local_hit_wait)

	
