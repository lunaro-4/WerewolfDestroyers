class_name HurtBoxComponent extends Area2D


@export var health_component : HealthComponent

@export var knockback_component : KnockBackComponent

@onready var got_hit_by_list : Array

## 
func hurt(damage: float):
	health_component.decrease(damage)

func knockback(value : float, area_owner: Node2D):
	#print(value )
	if knockback_component:
		knockback_component.knockback(value, area_owner.global_position)
	pass


## Проверяем, что компонент здоровья подключен. 
## иначе урон проходить не будет!
func _ready():
	if health_component == null:
		print("Health component not attached at: ", self, " ", get_parent())
		assert(health_component != null) 
	




func _on_area_entered(area):
	#print("area detected ", area)
	if (area is HitBoxComponent):
		area = area as HitBoxComponent
		## проверяем, что этот хитбокс уже нанес урон в этой атаке
		### (на случай если сущность будет крутится 
		### и хитбокс попадет несколько раз)
		if got_hit_by_list.find(area) == -1:
			## добавляем в массив игнорируемых хитбоксов
			got_hit_by_list.append(area)
			
			#var this_thing = selfd
			## привязываем сигнал об окончании атаки к удалению из массива
			## чтобы хитбокс мог снова наносить урон
			var area_owner = area.attack_component as AttackComponent
			area_owner.attack_finished.connect(_on_attack_finished.bind(area), 4)
			
			#print(area_owner.attack_finished, " bind ", area, " ", _on_attack_finished)
			#print("Array is : ", got_hit_by_list)
			
			hurt(area.damage)
			knockback(area.knockback, area)

## удаляем объект из массива перед тем, как атака повторится
func _on_attack_finished(finished_attack):
	#print("Entity deleted")
	got_hit_by_list.erase(finished_attack)
	#print(got_hit_by_list)
