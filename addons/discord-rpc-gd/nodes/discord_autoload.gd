## This is a GDscript Node wich gets automatically added as Autoload while installing the addon.
## 
## It can run in the background to comunicate with Discord.
## You don't need to use it. If you remove it make sure to run [code]DiscordRPC.run_callbacks()[/code] in a [code]_process[/code] function.
##
## @tutorial: https://github.com/vaporvee/discord-rpc-godot/wiki
extends Node

var first_launch

func _ready() -> void:
	first_launch = true

func  _process(_delta) -> void:
	DiscordRPC.run_callbacks()

func find_place(owner_name):
	if owner_name == "MainMenu":
		#SET WHEN THIS IS IMPLIMENTED!!!
		#DiscordRPC.state = "Sitting at the menu."
		
		#TEMP:
		DiscordRPC.state = "Playing with balls."
	if owner_name == "canvas":
		DiscordRPC.state = "Playing with balls (alone)."
	if owner_name == "Multiplayer":
		DiscordRPC.state = "Playing with balls (with a friend)."
