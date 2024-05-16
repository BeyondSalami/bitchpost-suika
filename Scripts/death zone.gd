extends Area2D

@onready var Spawner = get_node("../move and spawn/collider/mover_controller/TestSpawner")
@onready var win_menu = preload("res://scenes/win_menu.tscn")
@onready var ballman = $"../Ball_Manager"

func _unhandled_input(_event):
	#if Input.is_physical_key_pressed(KEY_M):
	#	print(Spawner.can_die, get_node("."))
	#	print(SettingsContainer.get_classic_3_combine_state())
	#	print("nfm", NewFruitManager.three_combine)
	pass

func _process(_delta):
	if Spawner.can_die == true:
		if get_node(".").get_overlapping_areas():
			ballman.leave_menu()

func _on_area_entered(_area):
	if Spawner.can_die == true:
		ballman.leave_menu()
		print(Spawner.can_die," area entered")
	else:
		print_debug("in bubble")
