extends Control

const START_OF_GAME_ALERT = preload("res://scenes/start_of_game_alert.tscn")

var egg_is_yes = false

func hide_screen():
	hide()

func show_screen():
	show()

func funny_menu_egg():
	#no tickle monster here!
	if egg_is_yes:
		egg_is_yes = false
		$ColorRect/egg.visible = false
	egg_is_yes = true
	$ColorRect/egg.visible= true
	pass
