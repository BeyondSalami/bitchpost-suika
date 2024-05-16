extends Node2D

@export var PlayerScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var index = 0
	for i in OnlineGameManager.Players:
		var current_player = PlayerScene.instantiate()
		current_player.name = str(OnlineGameManager.Players[i].id)
		add_child(current_player)
		for spawn in get_tree().get_nodes_in_group("PlayerSpawnPoint"):
			if spawn.name == ("spawn" + str(index)):
				current_player.global_position = spawn.global_position
		index += 1
	NewFruitManager.singleplayer = false


