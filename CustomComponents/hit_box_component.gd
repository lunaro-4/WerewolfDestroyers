class_name HitBoxComponent extends Area2D

## how much damage will HurtBox rescive
@export var damage :float
@export var attack_component :AttackComponent

func _ready():
	if attack_component == null:
		print("Attack component not attached at: ", self, " ", get_parent())
		assert(attack_component != null)
	pass 
