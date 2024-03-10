extends Node

@onready var boss = $"../BF"

@onready var eror = $"../Eror/Error/Er"
@onready var suget = $"../Eror/Control"
@onready var st = $"../ST"
@onready var Che = $"../Eror/Error2/Erche"
@onready var ErorWind = $"../WindError"
@onready var pause_menu = $"../Eror/pausem"
@onready var settings = $"../Eror/settings"

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
	

func _on_eror_pressed():
	sug = 1
	st.play()
	pass # Replace with function body.

func _on_dalshe_pressed():
	get_tree().paused = true
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")

func _on_button_pressed():
	st.stop()
	game_paused = !game_paused

func _on_button_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func _on_button_3_pressed():
	get_tree().quit()


func _on_but_ok_pressed():
	sug = 1
	st.play()

func _on_but_krest_pressed():
	sug = 4

func _on_but_ok_2_pressed():
	sug = 1
	st.play()


func _on_settings_pressed():
	sug = 5


func _on_nazad_pressed():
	sug = 2
