extends Polygon2D


func animate(_delay_wait, _hit_wait):
	await get_tree().create_timer(_delay_wait).timeout
	color.a = 1
	var fade_interval = _hit_wait/20
	for i in range(20):
		await get_tree().create_timer(fade_interval).timeout
		color.a -= 0.05 
