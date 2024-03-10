extends Node2D



var slime = preload("res://Scenes/slime.tscn")

@onready var gold_label = %GoldLabel as Label
@onready var current_gold :=50
@onready var player = $PlayerCharacter as Player



func _ready():
	refresh_gold_lable()
	pass 

func set_gold_lable_text(text):
	gold_label.set_text(str(text))

func refresh_gold_lable():
	set_gold_lable_text(current_gold)

func _process(_delta):
	if Input.is_action_just_pressed("LMBclick"):
		if current_gold >= 0:
			var enemy_instance = slime.instantiate() as Slime
			if player != null:
				enemy_instance.player = player
			enemy_instance.position = get_global_mouse_position()
			enemy_instance.is_static = false
			current_gold -=5
			refresh_gold_lable()
			add_child(enemy_instance)
		else:
			print("not enough gold!")
	pass


func _on_player_got_hit(value):
	current_gold += value
	refresh_gold_lable()
