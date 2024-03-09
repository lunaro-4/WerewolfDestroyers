class_name AttackArea extends Area2D


@onready var attack_component := $"../Attacks/AttackComponent" as AttackComponent



func _on_area_entered(area):
	if (area is HurtBoxComponent):
		attack_component.attack()
	pass 



func _on_attack_component_attack_finished():
	if get_overlapping_areas().find(func(area): 
		return area.get_class() == "HurtBoxComponent"):
		attack_component.attack()
	pass 
