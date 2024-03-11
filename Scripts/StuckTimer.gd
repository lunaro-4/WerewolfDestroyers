extends Timer

const EMPTY_VECTOR = Vector2(0,0)
const DIFF_MARGIN = 3

@onready var current_hero_pos =EMPTY_VECTOR
@onready var last_hero_pos =EMPTY_VECTOR
@export var hero : Node2D
@export var hero_move_target : Node2D



func _on_timeout():
	if last_hero_pos != EMPTY_VECTOR and current_hero_pos != EMPTY_VECTOR:
		if (last_hero_pos - current_hero_pos).length() < DIFF_MARGIN:
			hero_move_target.global_position = EMPTY_VECTOR
		pass
	last_hero_pos = current_hero_pos
	current_hero_pos = hero.global_position
