extends Node

@onready var pause_menu = $"../PauseMenulayer/pausem"
@onready var shop_menu = $"../Shop/Shop"
@onready var ticho = $"../Umri/Ticho"
@onready var st = $"../ST"
@onready var MMT = $"../MMTHEme"
@onready var settings = $"../PauseMenulayer/settings"
@onready var tichol = $"../Umri/Ticho/Panel/RichTextLabel"
@onready var ending = $"../CanvasLayer/Control/Panel/RichTextLabel"
@onready var ending_hud = $"../CanvasLayer/Control"
@onready var BBT = $"../BBY"

var tichol_text = "Подумай над своим поведением"
var ending_text = "Посмотри! ТЫ СЛАБ. Ты ничтожество. Но я решил вернуть все обратно. Надоело"
var game_paused: bool = true
var menuuu = 0
var ent = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if menuuu == 0:
		if game_paused == true:
			get_tree().paused = true
		#st.play()
		pause_menu.hide()
		shop_menu.hide()
		settings.hide()
		ending_hud.hide()
		
		suget_procces(tichol_text)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_tree().paused:
		if !st.playing:
			MMT.stop()
			st.play()
	else:
		if !MMT.playing:
			MMT.play()
			st.stop()
	if Input.is_action_just_pressed("Pause"):
		#if st.playing == false:
			#st.play()
		#else:
			#st.stop()
		#
		#if MMT.playing == true:
			#MMT.stop()
		#else:
			#MMT.play()	
		
		ticho.hide()
		shop_menu.hide()
		settings.hide()
		game_paused = !game_paused
		menuuu = 1
	
	if Input.is_action_just_pressed("Shop"):
		#if st.playing == false:
			#st.play()
		#else:
			#st.stop()
		#if MMT.playing == true:
			#MMT.stop()
		#else:
			#MMT.play()	
		menuuu = 2
		game_paused = !game_paused
		

	
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
			
	if menuuu == 7:
		ending_procces(ending_text)
		
		get_tree().paused = true
		ending_hud.show()
		
			
func _on_button_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_exit_pressed():
	game_paused = !game_paused

func _on_a_pressed():
	#st.stop()
	#MMT.play()
	game_paused = !game_paused
	menuuu = 3
	


func _on_settings_pressed():
	menuuu = 6


func _on_nazad_pressed():
	menuuu = 1

func suget_procces(input_text:String):
	tichol.visible_characters = 0
	tichol.text = input_text
	for i in input_text:
		tichol.visible_characters += 1
		await get_tree().create_timer(0.04).timeout
func _on_return_bitton_pressed():
	#st.stop()
	game_paused = !game_paused


func _on_exit_button_pressed():
	get_tree().quit()



func _on_texture_button_pressed():
	menuuu = 6

func _on_mm_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_player_character_on_player_death():
	BBT.play()
	menuuu = 7


func _on_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/titers.tscn")
	
func ending_procces(input_text:String):
	ending.visible_characters = 0
	ending.text = input_text
	for i in input_text:
		ending.visible_characters += 1
		await get_tree().create_timer(0.04).timeout
