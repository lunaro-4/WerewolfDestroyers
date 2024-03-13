extends Node

const lines: Array[String] = [
	"Мяу",
	"Че за х"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

"""
func _unhandled_input(event):
	if event.is_action_pressed("Suget"):
		DialogManager.start_dialog(global_position, lines)
# Called every frame. 'delta' is the elapsed time since the previous frame.
"""


func _on_text_box_finished_displaying():
	
	pass # Replace with function body.
