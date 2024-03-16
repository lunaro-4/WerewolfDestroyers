class_name Goblin  extends CharacterBody2D







@onready var pathfinder = $PathfindingLogic as PathfinderLogic

@onready var attack_hitbox = $Attacks/AttackComponent as AttackComponent

@onready var detection_area = $DetectionArea as DetectionArea

@onready var main_sprite = $MainSprite as AnimatedSprite2D
@onready var attack_sprite = $AttackSprite as AnimatedSprite2D

@export var is_static := false

@export var player : Node2D

@export var SPEED: float = 300.0

# Путь, по которому будет следовать сущность
@onready var direction = pathfinder.target_path_vector








func _ready():
	pathfinder.target = player
	pathfinder.pathfinding_init()
	attack_hitbox.ray_target = player
	detection_area.target=player
	
	


func _physics_process(_delta):
	#print(is_static)
	if is_static == true:
		$AnimationComponent.animate(false)
	elif is_static == false:
		direction = pathfinder.target_path_vector
		$AnimationComponent.animate(true, direction)
		velocity = direction * SPEED
		
		
		move_and_slide()

func _on_health_component_on_health_decrease(_value):
	pass


func _on_health_component_on_death():
	queue_free()


func _on_detection_area_target_detected():
	is_static = false
	pass
