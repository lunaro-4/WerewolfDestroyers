class_name HitBoxComponent extends Area2D

## how much damage will HurtBox rescive
@export var damage :float
@export var attack_component :AttackComponent
@export var hit_animation_object : Node

func _ready():
	if attack_component == null:
		print("Attack component not attached at: ", self, " ", get_parent())
		assert(attack_component != null)
	pass 


func animate(delay_wait, hit_wait):
	if hit_animation_object != null and hit_animation_object.has_method("animate"):
		hit_animation_object.animate(delay_wait, hit_wait)
