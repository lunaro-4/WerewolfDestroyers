extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 50 * delta
	if position.y >= 3000:
		get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
