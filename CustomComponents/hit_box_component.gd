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

const DEFAULT_POSITION = Vector2(0,0)
@onready var mouse_position := DEFAULT_POSITION

## Проверяем, что компонент атаки подключен. 
## иначе урон проходить не будет!
func _ready():
	PresenceCheck.check(attack_component, 'AttackComponent', self, true)

## Если компонент анимации подключен, посылаем сигнал анимации атаки
func animate(hit_wait):
	if hit_animation_object != null and hit_animation_object.has_method("animate"):
		hit_animation_object.animate(hit_wait)
		
## Если компонент анимации подключен, посылаем сигнал анимации задержки
func animate_delay(delay_wait, hit_wait):
	if hit_animation_object != null and hit_animation_object.has_method("animate_delay"):
		hit_animation_object.animate_delay(delay_wait, hit_wait)




func _process(_delta):
	if follow_coursor:
		position =  get_global_mouse_position() - get_parent().global_position
	if ray_coursor:
		look_at(get_global_mouse_position())
		rotation_degrees += add_rotation
	if ray_target != null:
		look_at(ray_target.global_position)
		rotation_degrees += add_rotation







func _on_attack_1_component_attack_finished():
	pass
