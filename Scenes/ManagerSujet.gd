extends Node

@onready var eror = $"../Suget/Error/Er"
@onready var suj = $"../Suget/Control"

var sujet = 0
var ent = 0

var game_paused: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if sujet == 0:
		eror.hide()
		suj.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Suget"):
		sujet = 1
		ent += 1
		if ent <= 1:
			game_paused = !game_paused

	if sujet == 1:
		if game_paused == true:
			get_tree().paused = true
			eror.show()
		else:
			get_tree().paused = false
			eror.hide()
		
	if ent > 1:
		eror.hide()
		if game_paused == true:
			get_tree().paused = true
			suj.show()
		else:
			get_tree().paused = false
			suj.hide()
	if ent > 2:
		get_tree().paused = true
		get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
	
func _on_eror_pressed():
	ent += 1


func _on_dalshe_pressed():
	get_tree().paused = true
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
