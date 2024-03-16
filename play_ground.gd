extends Node2D




@onready var travel_point = $Marker2D as Node2D
@onready var player = $Goblin as CharacterBody2D

const MOVE_RADIUS = 100


func generate_hero_path(length) -> Vector2:
	var path_point= Vector2(randf(),randf())
	path_point *= length
	return path_point
	
func move_marker():
	var point_new_pos = generate_hero_path(randf()*MOVE_RADIUS)
	travel_point.global_position = player.global_position + point_new_pos
	#print(travel_point.global_position)
	pass
	
	
