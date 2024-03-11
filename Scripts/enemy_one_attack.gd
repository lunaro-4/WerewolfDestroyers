extends Polygon2D


@export var main_sprite : AnimatedSprite2D



func _ready():
	pass

func animate(_hit_wait):
	
	
	color.a = 0.8
	var fade_interval = _hit_wait/20
	for i in range(20):
		await get_tree().create_timer(fade_interval).timeout
		color.a -= 0.05 
