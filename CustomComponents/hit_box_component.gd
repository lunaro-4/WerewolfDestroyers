class_name HitBoxComponent extends Area2D

## how much damage will HurtBox rescive
@export var damage :float
## Указатель компонента атаки для данной атаки
@export var attack_component :AttackComponent
## Указатель компонента анимации данной атаки
@export var hit_animation_object : Node

@export var knockback : float

## Перемещать Хитбокс под курсор?
@export var follow_coursor : bool = false

## Направлять хитбокс в сторону курсора?
@export var ray_coursor : bool = false

## Дополнительный угол к направлению на курсор
@export var add_rotation: float = 0

## Опциональная цель атаки [br]
## !!использование с ray_coursor опасно!!
@export var ray_target : Node2D

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


func _process(_delta):
	if follow_coursor:
		position = get_global_mouse_position()
	if ray_coursor:
		look_at(get_global_mouse_position())
		rotation_degrees += add_rotation
	if ray_target != null:
		look_at(ray_target.global_position)
		rotation_degrees += add_rotation





