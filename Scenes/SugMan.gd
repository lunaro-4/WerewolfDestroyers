extends Node

@onready var boss = $"../BF"

@onready var eror = $"../Eror/Error/Er"
@onready var suget = $"../Eror/Control"
@onready var st = $"../ST"

var game_paused: bool = false
var sug = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	eror.hide()
	suget.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_paused == true:
		get_tree().paused = true
		eror.show()
	else:
		get_tree().paused = false
		eror.hide()
	if sug == 1:
		eror.hide()
		if game_paused == true:
			get_tree().paused = true
			suget.show()
		else:
			get_tree().paused = false
			suget.hide()


func _on_player_start_scene_on_on_boss_death():
	game_paused = !game_paused
	


func _on_eror_pressed():
	sug = 1
	st.play()
	pass # Replace with function body.


func _on_dalshe_pressed():
	get_tree().paused = true
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
