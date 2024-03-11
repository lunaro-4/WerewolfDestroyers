extends Node

@onready var boss = $"../BF"

@onready var eror = $"../Eror/Error/Er"
@onready var suget = $"../Eror/Control"
@onready var st = $"../ST"
@onready var Che = $"../Eror/Error2/Erche"
@onready var ErorWind = $"../WindError"
@onready var pause_menu = $"../Eror/pausem"
@onready var settings = $"../Eror/settings"
@onready var richtl = $"../Eror/Error2/Erche/Panel/RichTextLabel"
@onready var sugetl = $"../Eror/Control/Panel/RichTextLabel"
@onready var klava = $"../AudioStreamPlayer2"

var sugetl_text = "Ну здравствуй! Я твой пк. И знаешь что? Я, пожалуй перейду сразу к делу.
Мне надоело, что ты постоянно убиваешь моих созданий. Нам пожалуй стоит
поменяться местами!"
var exapmple_text = "Ты что! Самый умный?"
var game_paused: bool = false
var sug = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	eror.hide()
	suget.hide()
	pause_menu.hide()
	Che.hide()
	settings.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		if st.playing == false:
			st.play()
		else:
			st.stop()
		game_paused = !game_paused
		sug = 2
		
	if sug ==3:
		if game_paused == true:
			get_tree().paused = true
			eror.show()
		else:
			get_tree().paused = false
			eror.hide()
		
	if sug == 1:
		eror.hide()
		Che.hide()
		suget_procces(sugetl_text)
		if game_paused == true:
			get_tree().paused = true
			suget.show()
		else:
			get_tree().paused = false
			suget.hide()
			
	if sug == 2:
		settings.hide()
		if game_paused == true:
			get_tree().paused = true
			pause_menu.show()
		else:
			get_tree().paused = false
			pause_menu.hide()
			
	if sug == 4:
		eror.hide()
		scroll_procces(exapmple_text)
		if game_paused == true:
			get_tree().paused = true
			Che.show()
		else:
			get_tree().paused = false
			Che.hide()
			
	if sug == 5:
		pause_menu.hide()
		if game_paused == true:
			get_tree().paused = true
			settings.show()
		else:
			get_tree().paused = false
			settings.hide()
		
func _on_player_start_scene_on_on_boss_death():
	sug = 3
	ErorWind.play()
	game_paused = !game_paused
	


func _on_dalshe_pressed():
	get_tree().paused = true
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")


func _on_button_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")




func _on_but_ok_pressed():
	sug = 1
	st.play()

func _on_but_krest_pressed():
	sug = 4
	klava.play()


func _on_but_ok_2_pressed():
	sug = 1
	st.play()



func _on_settings_pressed():
	sug = 5


func _on_nazad_pressed():
	sug = 2

func scroll_procces(input_text:String):
	richtl.visible_characters = 0
	richtl.text = input_text
	
	for i in input_text:
		richtl.visible_characters += 1
		
		await get_tree().create_timer(0.05).timeout

func suget_procces(input_text_2:String):
	sugetl.visible_characters = 0
	sugetl.text = input_text_2
	for i in input_text_2:
		sugetl.visible_characters += 1
		await get_tree().create_timer(0.04).timeout

	
	


func _on_return_bitton_pressed():
	st.stop()
	game_paused = !game_paused


func _on_exit_button_pressed():
	get_tree().quit()


func _on_texture_button_pressed():
	sug = 5


func _on_mm_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
