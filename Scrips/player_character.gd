@icon("res://CustomComponents/CustomIcons/PLUS.svg")
class_name Player extends CharacterBody2D





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_death():
	queue_free()
	pass # Replace with function body.
