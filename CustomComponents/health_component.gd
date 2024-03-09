class_name HealthComponent extends Node


## Максимальное количество здоровья
@export var max_health : int
## Здоровье на момент спавна объекта. При 0 приравнивается к максимальному
@export var start_health: float = 0
## Является ли объект "Живым" на момент спавна
@export var alive : bool = true


var current_health : float = start_health


signal on_death
signal on_health_decrease(value : float)


## 
func decrease(damage):
	current_health -= damage
	on_health_decrease.emit()
	if current_health <= 0:
		alive = false
		on_death.emit()
	pass

## 
func increase(heal):
	current_health += heal
	if current_health > max_health:
		current_health = max_health
	pass


## 
func _ready():
	if start_health == 0:
		current_health =max_health
	pass 



