extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if SettingsContainer.discord_rich == true:
		DiscordRPC.app_id = 1324050085377736817
		DiscordRPC.large_image = "lbs_temp_logo"
		#find appropriate area to set status as
		var owner_name = $"..".name
		DiscordRPCLoader.find_place(owner_name)
		##this is boolean if everything worked
		print("Discord working: " + str(DiscordRPC.get_is_discord_working()))
		DiscordRPC.refresh()
