extends Node2D



var slime = preload("res://Scenes/slime.tscn") 

@onready var gold_label = %GoldLabel as Label
@onready var current_gold :=50
@onready var player = $PlayerCharacter as Player
@onready var creatures : Array[String] = ["None", "Slime", "Goblin"]
@onready var chosen_creature = creatures[0]

@onready var slime_button = %SlimeButton as TextureButton
@onready var goblin_button = %GoblinButton as TextureButton
@onready var active_refresh: bool = false 

func _ready():
	print(chosen_creature)
	refresh_gold_lable()
	$PauseMenulayer.visible = true
	$Shop.visible = true
	$Umri.visible = true
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
	
func buttons_refresh():
	active_refresh = true
	slime_button.button_pressed = false
	goblin_button.button_pressed = false
	if chosen_creature == creatures[0]:
		pass
	elif chosen_creature == creatures[1]:
		slime_button.button_pressed = true
	elif chosen_creature == creatures[2]:
		goblin_button.button_pressed = true
	else:
		chosen_creature == creatures[0]
	print("Final choice:  ",chosen_creature)
	active_refresh = false

func _on_goblin_button_toggled(toggled_on):
	print("Goblin ", chosen_creature)
	if toggled_on and !active_refresh:
		chosen_creature = creatures[2]
		print("Goblin chosen ", chosen_creature)
	elif chosen_creature == creatures[2] and !active_refresh:
		chosen_creature = creatures[0]
		buttons_refresh()



func _on_slime_button_toggled(toggled_on):
	print("Slime " , chosen_creature)
	if toggled_on and !active_refresh:
		chosen_creature = creatures[1]
		print("Slime chnosen ", chosen_creature)
		buttons_refresh()
	elif chosen_creature == creatures[1] and !active_refresh:
		chosen_creature = creatures[0]
