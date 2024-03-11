extends Node2D


@export var main_sprite : AnimatedSprite2D
@export var attack_sprite : AnimatedSprite2D

#signal here_animation_finished

func _ready():
	pass

func animate(_hit_wait):
	attack_sprite.sprite_frames.set_animation_speed("default", 1)
	attack_sprite.set_frame(0)
	main_sprite.visible = false
	attack_sprite.visible = true
	attack_sprite.play("", attack_sprite.sprite_frames.get_frame_count("default")/_hit_wait) 


func _on_attack_sprite_animation_finished():
	#print("signal!")
	#here_animation_finished.emit()
	main_sprite.visible = true
	attack_sprite.visible = false
	attack_sprite.stop()
