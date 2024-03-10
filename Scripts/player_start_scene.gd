extends Node2D

@onready var enemy_one = preload("res://Scenes/enemy_1.tscn")

@onready var camera = $Camera2D as Camera2D
@onready var player = $PlayerCharacter as ControlablePlayer

@onready var boss_spawn_pos = $BossSpawn as Marker2D



@onready var boss = $"BF"
@onready var FMT = $"AudioStreamPlayer"

var game_paused: bool = false

signal on_on_boss_death



func _process(delta):
	if camera.global_position.y - 100 < player.global_position.y:
		camera.global_position.y += 5
	if camera.global_position.y + 100 > player.global_position.y:
		camera.global_position.y -= 5
	

func spawn_boss():
	var boss_instance = enemy_one.instantiate() as EnemyOne
	if player != null:
		boss_instance.player = player
	boss_instance.position = boss_spawn_pos.global_position
	boss_instance.is_static = false
	boss_instance.on_boss_death.connect(_on_boss_death)
	
	add_child(boss_instance)



func _on_slime_death():
	
	if get_children().filter(func(entity): 
		return entity.has_signal("on_slime_death")).size() < 2 :
		boss.play()
		FMT.stop()
		spawn_boss()
	pass 

func _on_boss_death():
	on_on_boss_death.emit()
	
	pass


