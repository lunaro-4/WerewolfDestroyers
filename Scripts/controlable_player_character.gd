@icon("res://CustomComponents/CustomIcons/PLUS.svg")
class_name ControlablePlayer extends CharacterBody2D

@onready var attack_component = $Attacks/Attack1Component as AttackComponent

@onready var level: float = 1.0

var attack_1_can_attack : bool = true

signal player_got_hit(value)



func _ready():
	attack_component.attack()
	#$RegenerationComponent.regen_start()
	pass 


func _on_death():
	queue_free()
	pass 


func _on_health_component_on_health_decrease(value):
	player_got_hit.emit(value)
	pass 


func _on_attack_1_component_attack_finished():
	#attack_component.attack()
	attack_1_can_attack =true
	pass



func _process(delta):
	if Input.is_action_just_pressed("LMBclick") and attack_1_can_attack:
		attack_component.attack()
		attack_1_can_attack =false
	pass
