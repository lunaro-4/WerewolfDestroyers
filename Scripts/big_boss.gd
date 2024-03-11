class_name Boss extends CharacterBody2D




const SPEED = 300.0



@onready var pathfinder = $PathfindingLogic as PathfinderLogic

@onready var attack_hitbox = $Attacks/HitBoxComponent as HitBoxComponent

@onready var detection_area = $DetectionArea as DetectionArea

@onready var main_sprite = $MainSprite as AnimatedSprite2D
@onready var attack_sprite = $AttackSprite as AnimatedSprite2D

@export var is_static := false

@export var player : CharacterBody2D

# Путь, по которому будет следовать сущность
@onready var direction = pathfinder.target_path_vector








func _ready():
	pathfinder.target = player
	pathfinder.pathfinding_init()
	attack_hitbox.ray_target = player
	
	


func _physics_process(_delta):
	#print(is_static)
	if is_static == true:
		animate_sprite(false)
	elif is_static == false:
		animate_sprite(true)
		direction = pathfinder.target_path_vector as Vector2
		main_sprite.rotation =to_local(player.get_global_position()).angle()
		#look_at(direction)
		velocity = direction * SPEED
		
		
		move_and_slide()

func animate_sprite(swith : bool):
	if swith:
		main_sprite.play()
	elif swith == false:
		main_sprite.stop()

func _on_health_component_on_health_decrease(_value):
	#print(self, " got hit for ", value)
	pass # Replace with function body.


func _on_health_component_on_death():
	queue_free()


func _on_detection_area_target_detected():
	#print("go")
	is_static = false
	#print(is_static)
	pass # Replace with function body.
