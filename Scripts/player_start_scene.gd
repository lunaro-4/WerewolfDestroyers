extends Node2D


@onready var camera = $Camera2D as Camera2D
@onready var player = $PlayerCharacter as ControlablePlayer
@onready var Boss = $Boss

func _process(delta):
	if camera.global_position.y - 100 < player.global_position.y:
		camera.global_position.y += 5
	if camera.global_position.y + 100 > player.global_position.y:
		camera.global_position.y -= 5
		
