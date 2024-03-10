extends Node2D



var slime = preload("res://Scenes/slime.tscn") 
var goblin = preload("res://Scenes/goblin.tscn")

@onready var gold_label = %GoldLabel as Label
@onready var current_gold :=50
@onready var player = $PlayerCharacter as Player
@onready var creatures : Array[String] = ["None", "Slime", "Goblin"]
@onready var chosen_creature = creatures[0]

@onready var goblin_unlocked : bool = true

@onready var slime_button = %SlimeButton as TextureButton
@onready var goblin_button = %GoblinButton as TextureButton

@onready var slime_panel = %SlimePanel as Panel
@onready var goblin_panel = %GoblinPanel as Panel

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
			if chosen_creature == creatures[0]:
				return
			elif chosen_creature == creatures[1]:
				spawn_enemy(slime, 5)
			elif chosen_creature == creatures[2]:
				spawn_enemy(goblin, 10)
		else:
			print("not enough gold!")
	pass

func spawn_enemy(type, cost):
	print("spawn ", goblin, " for ", cost)
	var enemy_instance = type.instantiate()
	if player != null:
		enemy_instance.player = player
	enemy_instance.position = get_global_mouse_position()
	enemy_instance.is_static = false
	current_gold -= cost
	refresh_gold_lable()
	add_child(enemy_instance)
	pass


func _on_player_got_hit(value):
	current_gold += value
	refresh_gold_lable()
	

func button_toggle(button : TextureButton,panel : Panel , state: bool):
	button.button_pressed = state
	var color : int
	if state:
		color = 1
	else:
		color = 0
	panel.modulate.a = color
	#print(panel.self_modulate.a)
	
	pass
	
	
func buttons_refresh():
	active_refresh = true
	button_toggle(slime_button, slime_panel, false)
	button_toggle(goblin_button, goblin_panel, false)
	if chosen_creature == creatures[0]:
		pass
	elif chosen_creature == creatures[1]:
		button_toggle(slime_button, slime_panel, true)
	elif chosen_creature == creatures[2]:
		button_toggle(goblin_button, goblin_panel, true)
	else:
		chosen_creature == creatures[0]
	#print("Choice:  ",chosen_creature)
	active_refresh = false

func _on_goblin_button_toggled(toggled_on):
	#print("Goblin ", chosen_creature)
	if !goblin_unlocked:
		return
	if toggled_on and !active_refresh:
		chosen_creature = creatures[2]
		#print("Goblin chosen ", chosen_creature)
		buttons_refresh()
	elif chosen_creature == creatures[2] and !active_refresh:
		chosen_creature = creatures[0]
		buttons_refresh()



func _on_slime_button_toggled(toggled_on):
	#print("Slime " , chosen_creature)
	if toggled_on and !active_refresh:
		chosen_creature = creatures[1]
		#print("Slime chnosen ", chosen_creature)
		buttons_refresh()
	elif chosen_creature == creatures[1] and !active_refresh:
		chosen_creature = creatures[0]
		buttons_refresh()
