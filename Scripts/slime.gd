class_name Slime extends CharacterBody2D




const SPEED = 200



@onready var pathfinder = $PathfindingLogic as PathfinderLogic

@onready var attack_hitbox = $Attacks/HitBoxComponent as HitBoxComponent

@onready var detection_area = $DetectionArea as DetectionArea

@onready var main_sprite = $MainSprite as AnimatedSprite2D
@onready var attack_sprite = $AttackSprite as AnimatedSprite2D

@export var is_static := false

@export var player : CharacterBody2D

# Путь, по которому будет следовать сущность
@onready var direction = pathfinder.target_path_vector





signal on_slime_death


func _ready():
	pathfinder.target = player
	pathfinder.pathfinding_init()
	attack_hitbox.ray_target = player
	detection_area.target=player
	
	


func _physics_process(_delta):
	#print(is_static)
	if is_static == true:
		animate_sprite(false)
	elif is_static == false:
		animate_sprite(true)
		direction = pathfinder.target_path_vector
		if direction.x< 0:
			main_sprite.flip_h = false
			attack_sprite.flip_h = false
		else:
			main_sprite.flip_h = true
			attack_sprite.flip_h = true
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
	on_slime_death.emit()
	queue_free()


func _on_detection_area_target_detected():
	#print("go")
	is_static = false
	#print(is_static)
	pass # Replace with function body.
