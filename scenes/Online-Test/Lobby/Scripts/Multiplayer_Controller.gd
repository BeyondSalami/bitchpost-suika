extends Control

@export var adress = "localhost"
@export var port = 55555
var peer
# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called on Server And Client
func peer_connected(id):
	print("player connected id: ", id)
	

# Called on Server And Client
func peer_disconnected(id):
	print("player disconnected id: ", id)
	OnlineGameManager.Players.erase(id)
	var players = get_tree().get_nodes_in_group("Player_onilne")
	for i in players:
		if i.name == str(id):
			i.queue_free()

# called only from client
func connected_to_server():
	print("connected to server")
	send_player_information.rpc_id(1, $LineEdit.text, multiplayer.get_unique_id())

# called only from client
func connection_failed():
	print("couldnt connect")

@rpc("any_peer")
func send_player_information(name, id):
	if !OnlineGameManager.Players.has(id):
		OnlineGameManager.Players[id] = {
			"name": name,
			"id": id,
		}
	
	if multiplayer.is_server():
		for i in OnlineGameManager.Players:
			send_player_information.rpc(OnlineGameManager.Players[i].name, i)

@rpc("any_peer","call_local")
func start_game():
	var scene = load("res://scenes/Online-Test/In-Game/multiplayer_online.tscn").instantiate()
	get_tree().root.add_child(scene)
	self.hide()

func host_game():
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port, 2)
	if error != OK:
		print("cannot host: ", error)
		return
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.set_multiplayer_peer(peer)
	print("waiting for players")

func _on_host_pressed():
	host_game()
	send_player_information($LineEdit.text, multiplayer.get_unique_id())

func _on_join_pressed():
	peer = ENetMultiplayerPeer.new()
	peer.create_client(adress, port)
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)


func _on_start_pressed():
	start_game.rpc()
