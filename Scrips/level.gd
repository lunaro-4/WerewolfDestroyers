extends Node2D



var enemy_1 = preload("res://Scenes/enemy_1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("SpawnEntity"):
		var enemy_instance = enemy_1.instantiate() as EnemyOne
		enemy_instance.player = $PlayerCharacter
		enemy_instance.position = get_global_mouse_position()
		add_child(enemy_instance)
	pass
