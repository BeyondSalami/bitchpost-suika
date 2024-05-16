extends Control

@export var wait_time = 3.5


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(wait_time).timeout
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
