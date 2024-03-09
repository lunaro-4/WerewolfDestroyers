class_name EnemyOne  extends CharacterBody2D




const SPEED = 300.0



@onready var pathfinder = $PathfindingLogic as PathfinderLogic

@export var player : Player

# Путь, по которому будет следовать сущность
@onready var direction = pathfinder.target_path_vector





func _ready():
	pathfinder.target = player
	pathfinder.pathfinding_init()


func _physics_process(_delta : float):
	direction = pathfinder.target_path_vector
	velocity = direction * SPEED
	move_and_slide()


func _on_health_component_on_health_decrease(value):
	#print(self, " got hit for ", value)
	pass # Replace with function body.


func _on_health_component_on_death():
	queue_free()
