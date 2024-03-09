class_name AttackComponent extends Node

@export var delay : float = 0
@export var hit_window : float
@export var speed_modifyer : float = 1
@export var hitbox : HitBoxComponent


signal attack_finished


func attack():
	print("Hit initialized")
	wait(delay * speed_modifyer)
	var hitbox_collisions_array := hitbox.get_children().filter(func(shape):
		return shape.get_class() == "CollisionShape2D")
	swich_hitbox_state(hitbox_collisions_array, false)
	await wait(hit_window * speed_modifyer)
	swich_hitbox_state(hitbox_collisions_array, true)
	print("Hit finished")
	attack_finished.emit()

func wait(time) -> void:
	#print("Timer started for ", time)
	await get_tree().create_timer(time).timeout
	#print("Timer ended.")
	



func swich_hitbox_state(array : Array, state : bool):
	for item in array:
		item.disabled = state

func _ready():
	if speed_modifyer == 0:
		speed_modifyer = 1
	else:
		speed_modifyer = 1 / speed_modifyer
	pass

