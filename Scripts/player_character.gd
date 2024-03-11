@icon("res://CustomComponents/CustomIcons/PLUS.svg")
class_name Player extends CharacterBody2D

@onready var attack_component = $Attacks/Attack1Component as AttackComponent

@onready var level: float = 1.0

@onready var difficulty_scale : float = 1

@onready var not_second_level : bool = true

@onready var pathfinder = $PathfindingLogic as PathfinderLogic

@onready var main_sprite = $MainSprite as AnimatedSprite2D


@onready var direction = Vector2(0,0)


@export var target_location : Node2D

const DIFFICULTY_RAMP := 0.01

const SPEED = 100

signal player_got_hit(value)



func _ready():
	main_sprite.play()
	attack_component.attack()
	$RegenerationComponent.regen_start()
	if target_location:
		pathfinder.target = target_location
		#pathfinder.pathfinding_init()
	

	pass 


func _on_death():
	queue_free()

func _physics_process(_delta):
	direction = direction.normalized()
	velocity = direction * SPEED* randf()
	if direction.x< 0:
		main_sprite.flip_h = true
	else:
		main_sprite.flip_h = false
		
	move_and_slide()




func _on_health_component_on_health_decrease(value):
	player_got_hit.emit(value)
	pass 


func _on_attack_1_component_attack_finished():
	attack_component.attack()



func _process(delta):
	var difficulty_level = level*(DIFFICULTY_RAMP* difficulty_scale)*delta
	level = level + difficulty_level
	$PanelContainer/HBoxContainer/LevelText.set_text(str(snapped(level, 0.001)))
	attack_component.tweak_damage(level)
	if floor(level) >= 2 and not_second_level:
		$HealthComponent.multiply_health(2)
		not_second_level = false
		pass



func _on_move_timer_timeout():
	direction = target_location.global_position - global_position
	pass # Replace with function body.
