extends Node

@export var BallManager : Node
@export var Score_Label : Label
var score

func _process(_delta):
	score = (BallManager.score)
	Score_Label.text = str(score)

func _unhandled_input(_event):
	if Input.is_physical_key_pressed(KEY_E):
		print_debug(score)
