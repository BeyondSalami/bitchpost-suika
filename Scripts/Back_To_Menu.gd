extends Button

@export var win_quote_array = []
@export var solo:= true
var score = NewFruitManager.score
@export var Score_Label: Label

func _ready():
	var score_str = var_to_str(score)
	Score_Label.text = str("Score: " + score_str)
	if NewFruitManager.singleplayer == false:
		solo = false
		randomize()
		var random_win_quote = win_quote_array[randi() % win_quote_array.size()]
		Score_Label.text = (random_win_quote)
		if random_win_quote == "Scorn: 985":
			$"../../AudioStreamPlayer".play()
	if solo == false:
		$"../Score".show()

func _on_pressed():
	if solo == true:
		if score > NewFruitManager.high_score:
			NewFruitManager.high_score = score
			NewFruitManager.score = 0
			SaveManager.mm_hs = NewFruitManager.high_score
		else:
			NewFruitManager.score = 0
		for n in get_node("/root/NewFruitManager").get_children():
			get_node("/root/NewFruitManager").remove_child(n)
			n.queue_free()
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
	else:
		NewFruitManager.singleplayer = true
		for n in get_node("/root/NewFruitManager").get_children():
			get_node("/root/NewFruitManager").remove_child(n)
			n.queue_free()
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
	if solo == false:
		NewFruitManager.score = 0
