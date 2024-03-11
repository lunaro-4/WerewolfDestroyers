extends Node2D

@onready var big_boss = preload("res://Scenes/big_boss.tscn")

@onready var camera = $Camera2D as Camera2D
@onready var player = $PlayerCharacter as ControlablePlayer

@onready var boss_spawn_pos = $BossSpawn as Marker2D
@onready var count_slime = %CountSlimeKill
@onready var boss = $"BF"
@onready var FMT = $"AudioStreamPlayer"
@onready var count_boss = $Counter/Panel/VBoxContainer/Label
@onready var max_count = $Counter/Panel/VBoxContainer/HBoxContainer/MaxSlimeKill
@onready var erorwind = $WindError

var game_paused: bool = false
var count_kill = 0
var max_count_boss = 1
var count_boss_label = "Убей его!"

signal on_on_boss_death

func _process(delta):
	if camera.global_position.y - 100 < player.global_position.y:
		camera.global_position.y += 5
	if camera.global_position.y + 100 > player.global_position.y:
		camera.global_position.y -= 5
	
	

func spawn_boss():
	count_boss.text = count_boss_label
	count_kill = 0
	count_slime.text = str(count_kill)
	max_count.text = str(max_count_boss)
	var boss_instance = big_boss.instantiate() as Boss
	if player != null:
		boss_instance.player = player
	boss_instance.position = boss_spawn_pos.global_position
	boss_instance.is_static = false
	boss_instance.on_boss_death.connect(_on_boss_death)
	
	add_child(boss_instance)




func _on_slime_death():
	count_kill += 1
	count_slime.text = str(count_kill)
	if get_children().filter(func(entity): 
		return entity.has_signal("on_slime_death")).size() < 2 :
		boss.play()
		FMT.stop()
		spawn_boss()
	pass 

func _on_boss_death():
	erorwind.play()
	on_on_boss_death.emit()
	pass




func _on_slime_on_slime_death():
	pass
