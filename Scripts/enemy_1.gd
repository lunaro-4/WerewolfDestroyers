class_name EnemyOne  extends CharacterBody2D




const SPEED = 300.0



@onready var pathfinder = $PathfindingLogic as PathfinderLogic

@onready var attack_hitbox = $Attacks/HitBoxComponent as HitBoxComponent

@export var player : Player

# Путь, по которому будет следовать сущность
@onready var direction = pathfinder.target_path_vector





func _ready():
	pathfinder.target = player
	pathfinder.pathfinding_init()
	attack_hitbox.ray_target = player
	


func _physics_process(_delta : float):
	direction = pathfinder.target_path_vector
	velocity = direction * SPEED
	move_and_slide()


func _on_health_component_on_health_decrease(_value):
	#print(self, " got hit for ", value)
	pass # Replace with function body.


func _on_health_component_on_death():
	queue_free()
