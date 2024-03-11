extends Node

@onready var pause_menu = $"../PauseMenulayer/pausem"
@onready var shop_menu = $"../Shop/Shop"
@onready var ticho = $"../Umri/Ticho"
@onready var st = $"../ST"
@onready var MMT = $"../MMTHEme"
@onready var settings = $"../PauseMenulayer/settings"
@onready var tichol = $"../Umri/Ticho/Panel/RichTextLabel"

var tichol_text = "ПОДУМАЙ НАД СВОИМ ПОВЕДЕНИЕМ"
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
		settings.hide()
	



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
		settings.hide()
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
		settings.hide()
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
		suget_procces(tichol_text)
		if game_paused == true:
			get_tree().paused = true
			ticho.show()
		else:
			get_tree().paused = false
			ticho.hide()
	
	if menuuu == 6:
		pause_menu.hide()	
		if game_paused == true:
			get_tree().paused = true
			settings.show()
		else:
			get_tree().paused = false
			settings.hide()
			


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
	


func _on_settings_pressed():
	menuuu = 6


func _on_nazad_pressed():
	menuuu = 1

func suget_procces(input_text_2:String):
	tichol.visible_characters = 0
	tichol.text = input_text_2
	for i in input_text_2:
		tichol.visible_characters += 1
		
		await get_tree().create_timer(0.04).timeout
