class_name HurtBoxComponent extends Area2D


@export var health_component : HealthComponent

@onready var got_hit_by_list : Array


func hurt(damage: float):
	#print("got hurt for ", damage)
	health_component.decrease(damage)
	pass


func _ready():
	pass

func _process(_delta):
	pass
	

func _on_attack_finished(finished_attack):
	#print("Entity deleted")
	got_hit_by_list.erase(finished_attack)
	#print(got_hit_by_list)

func _on_area_entered(area):
	#print("area detected ", area)
	if (area is HitBoxComponent):
		area = area as HitBoxComponent
		if got_hit_by_list.find(area) == -1:
			got_hit_by_list.append(area)
			#var this_thing = selfd
			var area_owner = area.attack_component as AttackComponent
			area_owner.attack_finished.connect(_on_attack_finished.bind(area), 4)
			#print(area_owner.attack_finished, " bind ", area, " ", _on_attack_finished)
			#print("Array is : ", got_hit_by_list)
			hurt(area.damage)
	
	
	pass # Replace with function body.
#for button in $Buttons.get_children():
	#button.pressed.connect(_on_pressed.bind(button))
#
#func _on_pressed(button):
	#print(button.name, " was pressed")

