extends Node2D

@export var niveau: int = 1

func _on_area_2d_body_entered(_body: Node2D) -> void:
	# call_deferred tells Godot to wait until the end of the current frame 
	get_tree().call_deferred("change_scene_to_file", "res://exemple/niveaux/niveau%s.tscn" % niveau)
