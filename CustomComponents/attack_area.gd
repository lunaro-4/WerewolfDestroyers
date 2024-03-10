class_name AttackArea extends Area2D


@onready var attack_component := $"../Attacks/AttackComponent" as AttackComponent


func _ready():
	attack_component.attack_finished.connect(_on_attack_component_attack_finished)

func _on_area_entered(area):
	if (area is HurtBoxComponent):
		attack_component.attack()
	pass 



func _on_attack_component_attack_finished():
	var filtered_areas = get_overlapping_areas().filter(func(area): 
		return area is HurtBoxComponent)
	#print(filtered_areas)
	if filtered_areas.size() > 0 :
		attack_component.attack()
	pass 
