extends Node2D


# Called when the node enters the scene tree for the first time.


@export var main_sprite : AnimatedSprite2D
@export var attack_sprite : AnimatedSprite2D

@onready var local_hit_wait


func _ready():
	attack_sprite.animation_looped.connect(_on_attack_sprite_animation_finished)
	
	
func animate_after_delay(_hit_wait):
	pass
	
func animate(_hit_wait):
	attack_sprite.sprite_frames.set_animation_speed("default", 1)
	attack_sprite.set_frame(0)
	main_sprite.visible = false
	attack_sprite.visible = true
	var sprite_count =attack_sprite.sprite_frames.get_frame_count("default")
	attack_sprite.play("", sprite_count/_hit_wait)
	pass
	

func animate_delay(delay_wait, _hit_wait):
	local_hit_wait = _hit_wait
	pass

func _on_attack_sprite_animation_finished():
	#animate_after_delay(local_hit_wait)
	main_sprite.visible = true
	attack_sprite.visible = false
	attack_sprite.stop()
	pass





	
