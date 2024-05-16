extends Node

@onready var ballsman = $Board/Ball_Manager
@export var other_player: Node

func _ready():
	$MultiplayerSynchronizer.set_multiplayer_authority(str(name).to_int())
	print(name)
	NewFruitManager.get_combine()
	if self.name == str(1):
		var nodes = get_tree().get_nodes_in_group("Player_onilne")
		for i in nodes:
			if i.name != str(1):
				other_player = i
			else:
				pass
	else:
		var nodes = get_tree().get_nodes_in_group("Player_onilne")
		for i in nodes:
			if i.name == str(1):
				other_player = i
			else:
				pass

func Send_Game_Over():
	print("send game over")

func Get_Game_Over():
	print("get_game_over")
	ballsman.leave_menu_win()
