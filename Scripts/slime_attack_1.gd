extends Polygon2D


@export var main_sprite : AnimatedSprite2D
@export var attack_sprite : AnimatedSprite2D


func _ready():
	pass

func animate(_delay_wait, _hit_wait):
	main_sprite.visible = false
	attack_sprite.visible = true
	attack_sprite.play("", (6/_hit_wait)*3) 


func _on_attack_sprite_animation_finished():
	main_sprite.visible = true
	attack_sprite.visible = false
	attack_sprite.stop()
