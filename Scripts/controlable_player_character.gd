@icon("res://CustomComponents/CustomIcons/PLUS.svg")
class_name ControlablePlayer extends CharacterBody2D

@onready var attack_component = $Attacks/Attack1Component as AttackComponent

@onready var level: float = 1.0

var attack_1_can_attack : bool = true

signal player_got_hit(value)



const speed = 300

func player_movement(_delta):
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("right"):
		velocity.x +=speed
	if Input.is_action_pressed("left"):
		velocity.x -=speed
	if Input.is_action_pressed("up"):
		velocity.y -=speed
	if Input.is_action_pressed("down"):
		velocity.y +=speed
	
	
	
	
	"""
	if abs(velocity.x) + abs(velocity.y) == 0:
		_animated_sprite.stop()
	else:
		_animated_sprite.play("PlayerAnimUp")
	"""
	
	
	move_and_slide()


func _physics_process(delta):
	player_movement(delta)


func _ready():
	#attack_component.attack()
	#$RegenerationComponent.regen_start()
	pass 


func _on_death():
	queue_free()
	pass 


func _on_health_component_on_health_decrease(value):
	player_got_hit.emit(value)
	pass 


func _on_attack_1_component_attack_finished():
	#attack_component.attack()
	attack_1_can_attack =true
	pass



func _process(delta):
	if Input.is_action_just_pressed("LMBclick") and attack_1_can_attack:
		attack_component.attack()
		attack_1_can_attack =false
	pass
