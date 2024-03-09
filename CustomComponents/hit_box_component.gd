class_name HitBoxComponent extends Area2D

## how much damage will HurtBox rescive
@export var damage :float
## Указатель компонента атаки для данной атаки
@export var attack_component :AttackComponent
## Указатель компонента анимации данной атаки
@export var hit_animation_object : Node

@onready var base_damage = damage

## Проверяем, что компонент атаки подключен. 
## иначе урон проходить не будет!
func _ready():
	if attack_component == null:
		print("Attack component not attached at: ", self, " ", get_parent())
		assert(attack_component != null)
	pass 

## Если компонент анимации подключен, посылаем сигнал анимации
func animate(delay_wait, hit_wait):
	if hit_animation_object != null and hit_animation_object.has_method("animate"):
		hit_animation_object.animate(delay_wait, hit_wait)








