extends Node2D



var enemy_1 = preload("res://Scenes/enemy_1.tscn")

@onready var gold_label = %GoldLabel as Label
@onready var current_gold :=5



func _ready():
	refresh_gold_lable()
	pass 

func set_gold_lable_text(text):
	gold_label.set_text(str(text))

func refresh_gold_lable():
	set_gold_lable_text(current_gold)

func _process(_delta):
	if Input.is_action_just_pressed("SpawnEntity"):
		if current_gold >= 0:
			var enemy_instance = enemy_1.instantiate() as EnemyOne
			enemy_instance.player = $PlayerCharacter
			enemy_instance.position = get_global_mouse_position()
			current_gold -=5
			add_child(enemy_instance)
		else:
			print("not enough gold!")
	pass


func _on_player_got_hit(value):
	current_gold += value
	refresh_gold_lable()
