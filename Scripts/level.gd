extends Node2D





const MOVE_RADIUS = 500



@onready var player = $PlayerCharacter as Player

@onready var active_refresh: bool = false 

@onready var camera = $Camera2D as Camera2D


func _ready():
	print(chosen_creature)
	refresh_gold_lable()
	$PauseMenulayer.visible = true
	$Shop.visible = true
	$Umri.visible = true
	update_choose_unit_frame()
	camera.limit_right = 1630
	camera.limit_left = -535
	camera.limit_bottom = 1150
	camera.limit_top = -220
	pass 


###########################################################
# Экономика
###########################################################

@onready var gold_label = %GoldLabel as Label
@onready var current_gold :=50


func set_gold_lable_text(text):
	gold_label.set_text(str(text))

func refresh_gold_lable():
	set_gold_lable_text(current_gold)


func _on_player_got_hit(value):
	current_gold += value
	refresh_gold_lable()
	

################################

func _process(_delta):
	summon_logic()
	update_container_state()
	var x = camera.get_local_mouse_position()
	if x[0] < -400:
		camera.position.x -= 8
	if x[0] > 500:
		camera.position.x += 8
	if x[1] < -220:
		camera.position.y -= 8
	if x[1] > 250:
		camera.position.y += 8
	
	pass

################################


###########################################################
# Переключение выбранного юнита
###########################################################

var slime = preload("res://Scenes/slime.tscn") 
var goblin = preload("res://Scenes/goblin.tscn")
var eye = preload("res://Scenes/big_boss.tscn")

@onready var creatures : Array[String] = ["None", "Slime", "Goblin", "Eye"]
@onready var chosen_creature = creatures[0]

@onready var slime_container = %SlimeContainer as MarginContainer
@onready var goblin_container = %GoblinContainer as MarginContainer
@onready var eye_container = %EyeContainer as MarginContainer


@onready var slime_button = %SlimeButton as TextureButton
@onready var goblin_button = %GoblinButton as TextureButton
@onready var eye_button = %EyeButton as TextureButton


@onready var slime_panel = %SlimePanel as Panel
@onready var goblin_panel = %GoblinPanel as Panel
@onready var eye_panel = %EyePanel as Panel


@onready var goblin_unlocked : bool = false
@onready var eye_unlocked : bool = false

@onready var mouse_over_button := false

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

func summon_logic():
	if Input.is_action_just_pressed("LMBclick")and !mouse_over_button:
		if current_gold >= 0:
			if chosen_creature == creatures[0]:
				return
			elif chosen_creature == creatures[1]:
				spawn_enemy(slime, 5)
			elif chosen_creature == creatures[2]:
				spawn_enemy(goblin, 10)
			elif chosen_creature == creatures[3]:
				spawn_enemy(eye, 20)
		else:
			print("not enough gold!")

func update_container_state():
	#print("checking:  ", goblin_unlocked, "  ", eye_unlocked )
	if goblin_unlocked:
		#print("Goblin:  ", goblin_unlocked )
		goblin_container.visible = true
	else:
		goblin_container.visible = false
	if eye_unlocked:
		#print("Eye ", eye_unlocked )
		eye_container.visible = true
	else:
		eye_container.visible = false


func buttons_refresh():
	active_refresh = true
	button_toggle(slime_button, slime_panel, false)
	button_toggle(goblin_button, goblin_panel, false)
	button_toggle(eye_button, eye_panel, false)
	if chosen_creature == creatures[0]:
		pass
	elif chosen_creature == creatures[1]:
		button_toggle(slime_button, slime_panel, true)
	elif chosen_creature == creatures[2]:
		button_toggle(goblin_button, goblin_panel, true)
	elif chosen_creature == creatures[3]:
		button_toggle(eye_button, eye_panel, true)
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


func _on_eye_button_toggled(toggled_on):
	if !eye_unlocked:
		return
	if toggled_on and !active_refresh:
		chosen_creature = creatures[3]
		buttons_refresh()
	elif chosen_creature == creatures[3] and !active_refresh:
		chosen_creature = creatures[0]
		buttons_refresh()
	pass

func _on_mouse_entered():
	#print("enter")
	mouse_over_button = true


func _on_mouse_exited():
	#print("exit")
	mouse_over_button = false



func spawn_enemy(type, cost):
	#print("spawn ", goblin, " for ", cost)
	var enemy_instance = type.instantiate()
	if player != null:
		enemy_instance.player = player
	enemy_instance.position = get_global_mouse_position()
	enemy_instance.is_static = false
	current_gold -= cost
	refresh_gold_lable()
	add_child(enemy_instance)
	pass

func update_choose_unit_frame():
	goblin_container.visible = false
	
	slime_container.visible = true
	if goblin_unlocked:
		goblin_container.visible = true


###########################################################
# Перемещение героя
###########################################################

@onready var travel_point = $HeroTravelPoint as Node2D


func generate_hero_path(length) -> Vector2:
	var path_point= Vector2(randf(),randf())
	path_point *= length
	return path_point
	
func move_marker():
	#var point_new_pos = generate_hero_path(randf()*MOVE_RADIUS)
	#travel_point.global_position = player.global_position + point_new_pos
	#print(travel_point.global_position)
	pass
	
	

	

