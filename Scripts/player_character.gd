@icon("res://CustomComponents/CustomIcons/PLUS.svg")
class_name Player extends CharacterBody2D

@onready var attack_component = $Attacks/AttackComponent as AttackComponent



# Called when the node enters the scene tree for the first time.
func _ready():
	attack_component.attack()
	pass # Replace with function body.


func _on_death():
	queue_free()
	pass # Replace with function body.


func _on_timer_timeout():
	attack_component.attack()


func _on_health_component_on_health_decrease(value):
	#print(self, " got hit for ", value)
	pass # Replace with function body.
