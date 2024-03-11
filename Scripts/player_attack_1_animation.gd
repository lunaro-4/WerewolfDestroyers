extends Node2D

@export var animation_polygon : Polygon2D
@export var main_sprite : AnimatedSprite2D
@export var attack_sprite : AnimatedSprite2D

@onready var local_hit_wait

func animate_after_delay(_hit_wait):
	animation_polygon.animate(_hit_wait)

func animate_delay(delay_wait, _hit_wait):
	attack_sprite.sprite_frames.set_animation_speed("default", 1)
	attack_sprite.set_frame(0)
	local_hit_wait = _hit_wait
	main_sprite.visible = false
	attack_sprite.visible = true
	var sprite_count =attack_sprite.sprite_frames.get_frame_count("default")
	#print(delay_wait)
	#print(sprite_count,"  ", attack_sprite.sprite_frames.get_frame_count("default")/delay_wait)
	attack_sprite.play("", sprite_count/delay_wait)
	
	

func _on_attack_sprite_animation_finished():

	main_sprite.visible = true
	attack_sprite.visible = false
	attack_sprite.stop()
	#print(local_hit_wait)
	animate_after_delay(local_hit_wait)


	
