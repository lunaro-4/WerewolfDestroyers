extends Node2D



var enemy_1 = preload("res://Scenes/enemy_1.tscn")

@onready var gold_label = %GoldLabel as Label
@onready var current_gold :=100.0



func _ready():
	set_gold_lable_text(current_gold)
	pass 

func set_gold_lable_text(text):
	gold_label.set_text(str(text))


func _process(_delta):
	if Input.is_action_just_pressed("SpawnEntity"):
		var enemy_instance = enemy_1.instantiate() as EnemyOne
		enemy_instance.player = $PlayerCharacter
		enemy_instance.position = get_global_mouse_position()
		add_child(enemy_instance)
	pass


func _on_player_got_hit(value):
	var cur_text = gold_label.get_text() as float
	gold_label.set_text(str(cur_text+value))
	pass # Replace with function body.



