extends Node

@onready var pause_menu = $"../PauseMenulayer/pausem"
@onready var shop_menu = $"../Shop/Shop"
@onready var ticho = $"../Umri/Ticho"
@onready var st = $"../ST"
@onready var MMT = $"../MMTHEme"

var game_paused: bool = true
var menuuu = 0
var ent = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if menuuu == 0:
		if game_paused == true:
			get_tree().paused = true
		st.play()
		pause_menu.hide()
		shop_menu.hide()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		if st.playing == false:
			st.play()
		else:
			st.stop()
		
		if MMT.playing == true:
			MMT.stop()
		else:
			MMT.play()	
		
		ticho.hide()
		shop_menu.hide()
		game_paused = !game_paused
		menuuu = 1
	
	if Input.is_action_just_pressed("Shop"):
		if st.playing == false:
			st.play()
		else:
			st.stop()
		if MMT.playing == true:
			MMT.stop()
		else:
			MMT.play()	
		menuuu = 2
		game_paused = !game_paused
		
	if Input.is_action_just_pressed("Suget"):
		ent += 1

	
	if menuuu == 1:
		if game_paused == true:
			get_tree().paused = true
			pause_menu.show()
		else:
			get_tree().paused = false
			pause_menu.hide()
			
	if menuuu == 2:
		if game_paused == true:
			get_tree().paused = true
			shop_menu.show()
		else:
			get_tree().paused = false
			shop_menu.hide()
	
	if menuuu == 3:
		if game_paused == true:
			get_tree().paused = true
			ticho.show()
		else:
			get_tree().paused = false
			ticho.hide()
	
	
			


func _on_button_pressed():
	st.stop()
	game_paused = !game_paused
	
func _on_button_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_button_3_pressed():
	get_tree().quit()

func _on_exit_pressed():
	game_paused = !game_paused

func _on_a_pressed():
	st.stop()
	game_paused = !game_paused
	menuuu = 3
	
