@icon("res://CustomComponents/CustomIcons/EMPTY BLANK.svg")
class_name BaseEnemy  extends CharacterBody2D




var SPEED = 300.0



@onready var pathfinder = $PathfindingLogic as PathfinderLogic

@export var player : Player

## Путь, по которому будет следовать сущность
@onready var direction = pathfinder.target_path_vector





func _ready():
	pathfinder.target = player
	pathfinder.pathfinding_init()


func _physics_process(_delta : float):
	direction = pathfinder.target_path_vector
	velocity = direction * SPEED
	move_and_slide()
