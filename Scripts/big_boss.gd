class_name Boss extends CharacterBody2D




const SPEED = 150



@onready var pathfinder = $PathfindingLogic as PathfinderLogic

@onready var attack_hitbox = $Attacks/HitBoxComponent as HitBoxComponent

@onready var detection_area = $DetectionArea as DetectionArea

@onready var main_sprite = $MainSprite as AnimatedSprite2D
@onready var attack_sprite = $AttackSprite as AnimatedSprite2D

@export var is_static := false

@export var player : CharacterBody2D

# Путь, по которому будет следовать сущность
@onready var direction = pathfinder.target_path_vector


signal on_boss_death





func _ready():
	pathfinder.target = player
	pathfinder.pathfinding_init()
	attack_hitbox.ray_target = player
	
	


func _physics_process(_delta):
	#print(is_static)
	direction = pathfinder.target_path_vector as Vector2
	if is_static == true:
		animate_sprite(false)
	elif is_static == false and (player.global_position - global_position).length() > 300:
		velocity = direction * SPEED
		move_and_slide()
	elif is_static == false and (player.global_position - global_position).length() < 300:
		velocity = -direction * SPEED
		move_and_slide()
	if is_static == false:
		animate_sprite(true)
		main_sprite.rotation =to_local(player.get_global_position()).angle()

func animate_sprite(swith : bool):
	if swith:
		main_sprite.play()
	elif swith == false:
		main_sprite.stop()

func _on_health_component_on_health_decrease(_value):
	#print(self, " got hit for ", _value, " of ", $HealthComponent.current_health)
	pass # Replace with function body.


func _on_health_component_on_death():
	on_boss_death.emit()
	queue_free()


func _on_detection_area_target_detected():
	#print("go")
	is_static = false
	#print(is_static)
	pass # Replace with function body.
