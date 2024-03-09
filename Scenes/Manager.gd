extends Node

@onready var pause_menu = $"../PauseMenulayer/pausem"

var game_paused: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		game_paused = !game_paused
	
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()


func _on_button_pressed():
	game_paused = !game_paused


func _on_button_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_button_3_pressed():
	get_tree().quit()
