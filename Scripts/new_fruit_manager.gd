extends Node

@onready var UserSettings = $".."


var strawberry = preload("res://balls/itsafeature.tscn")
var grape = preload("res://balls/Kittrz.tscn")
var tangerine = preload("res://balls/Duckaccino.tscn")
var orange = preload("res://balls/salami.tscn")
var apple = preload("res://balls/List.tscn")
var dekopan = preload("res://balls/WormDick.tscn")
var peach = preload("res://balls/Gilbert.tscn")
var pineapple = preload("res://balls/Toaster.tscn")
var melon = preload("res://balls/blueaura.tscn")
var watermelon = preload("res://balls/simpleflips.tscn")
var win_menu = preload("res://scenes/win_menu.tscn")

var cherry_pos_array: Array
var strawberry_pos_array: Array
var grape_pos_array: Array
var tangerine_pos_array: Array
var orange_pos_array: Array
var apple_pos_array: Array
var dekopan_pos_array: Array
var peach_pos_array: Array
var pineapple_pos_array: Array
var melon_pos_array: Array
var watermelon_pos_array: Array

var highest_fruit_seen = 1
var hider
var three_combine: bool
#singleplayer/multiplayer variable
var singleplayer : bool

@export var score: int
@export var high_score: int
@export var over_menu_pos: Node2D

func get_combine():
	if singleplayer == true:
		three_combine = SettingsContainer.get_classic_3_combine_state()
	else:
		three_combine = true

func _process(_delta):
	if cherry_pos_array.size() == 2:
		var pos_1 = cherry_pos_array.pop_front()
		var pos_2 = cherry_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = strawberry.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_strawberry()
		if highest_fruit_seen == 1:
			highest_fruit_seen += 1
	
	if cherry_pos_array.size() >= 2:
		var pos_1 = cherry_pos_array.pop_front()
		var pos_2 = cherry_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		cherry_pos_array.clear()
		if three_combine == false:
			var instance = grape.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_strawberry()
			hider.unhide_grape()
			if highest_fruit_seen == 1:
				highest_fruit_seen += 1
		if three_combine == true:
			var instance = strawberry.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_strawberry()
			if highest_fruit_seen == 1:
				highest_fruit_seen += 1
	
	if strawberry_pos_array.size() == 2:
		var pos_1 = strawberry_pos_array.pop_front()
		var pos_2 = strawberry_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = grape.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_grape()
		if highest_fruit_seen == 2:
			highest_fruit_seen += 1
	
	if strawberry_pos_array.size() >= 2:
		var pos_1 = strawberry_pos_array.pop_front()
		var pos_2 = strawberry_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		strawberry_pos_array.clear()
		if three_combine == false:
			var instance = tangerine.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_grape()
			hider.unhide_tangerine()
			if highest_fruit_seen == 2:
				highest_fruit_seen += 2
		if three_combine == true:
			var instance = grape.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_grape()
			if highest_fruit_seen == 2:
				highest_fruit_seen += 1
	
	if grape_pos_array.size() == 2:
		var pos_1 = grape_pos_array.pop_front()
		var pos_2 = grape_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = tangerine.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_tangerine()
		if highest_fruit_seen == 3:
			highest_fruit_seen += 1
	
	if grape_pos_array.size() >= 2:
		var pos_1 = grape_pos_array.pop_front()
		var pos_2 = grape_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		grape_pos_array.clear()
		if three_combine == false:
			var instance = orange.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_tangerine()
			hider.unhide_orange()
			if highest_fruit_seen == 3:
				highest_fruit_seen += 2
		if three_combine == true:
			var instance = tangerine.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_tangerine()
			if highest_fruit_seen == 3:
				highest_fruit_seen += 1
	
	if tangerine_pos_array.size() == 2:
		var pos_1 = tangerine_pos_array.pop_front()
		var pos_2 = tangerine_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = orange.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_orange()
		if highest_fruit_seen == 4:
			highest_fruit_seen += 1
	
	if tangerine_pos_array.size() >= 2:
		var pos_1 = tangerine_pos_array.pop_front()
		var pos_2 = tangerine_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		tangerine_pos_array.clear()
		if three_combine == false:
			var instance = apple.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_orange()
			hider.unhide_apple()
			if highest_fruit_seen == 4:
				highest_fruit_seen += 2
		if three_combine == true:
			var instance = orange.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_orange()
			if highest_fruit_seen == 4:
				highest_fruit_seen += 1
	
	if orange_pos_array.size() == 2:
		var pos_1 = orange_pos_array.pop_front()
		var pos_2 = orange_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = apple.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_apple()
		if highest_fruit_seen == 5:
			highest_fruit_seen += 1
	
	if orange_pos_array.size() >= 2:
		var pos_1 = orange_pos_array.pop_front()
		var pos_2 = orange_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		orange_pos_array.clear()
		if three_combine == false:
			var instance = dekopan.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_apple()
			hider.unhide_dekopan()
			if highest_fruit_seen == 5:
				highest_fruit_seen += 2
		if three_combine == true:
			var instance = apple.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_apple()
			if highest_fruit_seen == 5:
				highest_fruit_seen += 1
	
	if apple_pos_array.size() == 2:
		var pos_1 = apple_pos_array.pop_front()
		var pos_2 = apple_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = dekopan.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_dekopan()
		if highest_fruit_seen == 6:
			highest_fruit_seen += 1
	
	if apple_pos_array.size() >= 2:
		var pos_1 = apple_pos_array.pop_front()
		var pos_2 = apple_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		apple_pos_array.clear()
		if three_combine == false:
			var instance = peach.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_peach()
			hider.unhide_dekopan()
			if highest_fruit_seen == 6:
				highest_fruit_seen += 2
		if three_combine == true:
			var instance = dekopan.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_dekopan()
			if highest_fruit_seen == 6:
				highest_fruit_seen += 1
	
	if dekopan_pos_array.size() == 2:
		var pos_1 = dekopan_pos_array.pop_front()
		var pos_2 = dekopan_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = peach.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_peach()
		if highest_fruit_seen == 7:
			highest_fruit_seen += 1
	
	if dekopan_pos_array.size() >= 2:
		var pos_1 = dekopan_pos_array.pop_front()
		var pos_2 = dekopan_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		dekopan_pos_array.clear()
		if three_combine == false:
			var instance = pineapple.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_peach()
			hider.unhide_pineapple()
			if highest_fruit_seen == 7:
				highest_fruit_seen += 2
		if three_combine == true:
			var instance = peach.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_peach()
			if highest_fruit_seen == 7:
				highest_fruit_seen += 1
	
	if peach_pos_array.size() == 2:
		var pos_1 = peach_pos_array.pop_front()
		var pos_2 = peach_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = pineapple.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_pineapple()
		if highest_fruit_seen == 8:
			highest_fruit_seen += 1
	
	if peach_pos_array.size() >= 2:
		var pos_1 = peach_pos_array.pop_front()
		var pos_2 = peach_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		peach_pos_array.clear()
		if three_combine == false:
			var instance = melon.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_melon()
			hider.unhide_pineapple()
			if highest_fruit_seen == 8:
				highest_fruit_seen += 2
		if three_combine == true:
			var instance = pineapple.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_pineapple()
			if highest_fruit_seen == 8:
				highest_fruit_seen += 1
	
	if pineapple_pos_array.size() == 2:
		var pos_1 = pineapple_pos_array.pop_front()
		var pos_2 = pineapple_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = melon.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_melon()
		if highest_fruit_seen == 9:
			highest_fruit_seen += 1
	
	if pineapple_pos_array.size() >= 2:
		var pos_1 = pineapple_pos_array.pop_front()
		var pos_2 = pineapple_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		pineapple_pos_array.clear()
		if three_combine == false:
			var instance = watermelon.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_melon()
			hider.unhide_watermelon()
			if highest_fruit_seen == 9:
				highest_fruit_seen += 2
		if three_combine == true:
			var instance = melon.instantiate()
			instance.position.x = new_ball_spawn_pos.x
			instance.position.y = new_ball_spawn_pos.y
			add_child(instance)
			hider.unhide_melon()
			if highest_fruit_seen == 9:
				highest_fruit_seen += 1
	
	if melon_pos_array.size() == 2:
		var pos_1 = melon_pos_array.pop_front()
		var pos_2 = melon_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		var instance = watermelon.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_watermelon()
		if highest_fruit_seen == 10:
			highest_fruit_seen += 1
	
	if melon_pos_array.size() >= 2:
		var pos_1 = melon_pos_array.pop_front()
		var pos_2 = melon_pos_array.pop_front()
		var new_ball_spawn_pos = (pos_1 + pos_2)/2
		melon_pos_array.clear()
		var instance = watermelon.instantiate()
		instance.position.x = new_ball_spawn_pos.x
		instance.position.y = new_ball_spawn_pos.y
		add_child(instance)
		hider.unhide_watermelon()
		if highest_fruit_seen == 10:
			highest_fruit_seen += 1
	
	if watermelon_pos_array.size() == 2:
		score += 200
	
	if watermelon_pos_array.size() >= 2:
		score += 1000

func _unhandled_input(_event):
	if Input.is_physical_key_pressed(KEY_X):
		clear_arrays()

@rpc("any_peer","call_local")
func leave_menu():
	if singleplayer == true:
		var instance = win_menu.instantiate()
		instance.position.x = over_menu_pos.position.x + 210
		instance.position.y = over_menu_pos.position.y
		add_child(instance)
	else:
		var root_Game = $"../.."
		root_Game.Send_Game_Over()

func leave_menu_win():
	var instance = win_menu.instantiate()
	instance.position.x = over_menu_pos.position.x + 210
	instance.position.y = over_menu_pos.position.y
	add_child(instance)

func clear_arrays():
	cherry_pos_array.clear()
	strawberry_pos_array.clear()
	grape_pos_array.clear()
	tangerine_pos_array.clear()
	orange_pos_array.clear()
	apple_pos_array.clear()
	dekopan_pos_array.clear()
	peach_pos_array.clear()
	pineapple_pos_array.clear()
	melon_pos_array.clear()
	watermelon_pos_array.clear()

