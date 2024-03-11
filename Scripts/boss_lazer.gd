extends Line2D


func animate(hit_wait): 
	default_color.a = 0.9
	var fade_interval = hit_wait/20
	for i in range(20):
		await get_tree().create_timer(fade_interval).timeout
		default_color.a -= 0.05 
