class_name DetectionArea extends Area2D



@export var target: Node2D

signal target_detected

func _on_area_entered(area):
	if (area is HurtBoxComponent) and (area.get_parent() == target):
		target_detected.emit()
	pass 

