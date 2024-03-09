@icon("res://CustomComponents/CustomIcons/PLUS.svg")
class_name Player extends CharacterBody2D

@onready var attack_component = $Attacks/Attack1Component as AttackComponent

signal player_got_hit(value)



func _ready():
	attack_component.attack()
	$RegenerationComponent.regen_start()
	pass 


func _on_death():
	queue_free()
	pass 


func _on_timer_timeout():
	attack_component.attack()


func _on_health_component_on_health_decrease(value):
	player_got_hit.emit(value)
	pass 


func _on_attack_1_component_attack_finished():
	attack_component.attack()

