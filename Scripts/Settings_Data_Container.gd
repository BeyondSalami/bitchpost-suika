extends Node

@onready var DEFAULT_SETTINGS : DefaultSettingsResource = preload("res://Resources/Settings/Default_Settings.tres")
var keybind_resource: PlayerKeybindsResource = preload("res://Resources/KeyBinds/Player_Keybinds_Default.tres")

var window_mode_index : int = 0
var resolution_index : int = 0
var master_volume : float = 0.0
var music_volume : float = 0.0
var sfx_volume : float = 0.0
var discord_rich : bool = false
var classic_3_combine_state : bool = false

var loaded_data : Dictionary = {}

func _ready():
	handle_signals()
	create_storage_dictionary()

func create_storage_dictionary() -> Dictionary:
	var settings_container_dict : Dictionary = {
		"window_mode_index" : window_mode_index,
		"resolution_index" : resolution_index,
		"master_volume" : master_volume,
		"music_volume" : music_volume,
		"sfx_volume" : sfx_volume,
		"discord_rich" : discord_rich,
		"classic_3_combine_state" : classic_3_combine_state,
		"keybinds" : create_keybinds_dictionary(),
		}
	return settings_container_dict

func create_keybinds_dictionary() -> Dictionary:
	var keybinds_container_dict = {
		keybind_resource.P1_MOVE_LEFT : keybind_resource.p1_left_key,
		keybind_resource.P1_MOVE_RIGHT : keybind_resource.p1_right_key,
		keybind_resource.P1_DROP : keybind_resource.p1_drop_key,
		keybind_resource.P1_QUIT : keybind_resource.p1_quit_key,
		keybind_resource.P2_MOVE_LEFT : keybind_resource.p2_left_key,
		keybind_resource.P2_MOVE_RIGHT : keybind_resource.p2_right_key,
		keybind_resource.P2_DROP : keybind_resource.p2_drop_key,
		keybind_resource.P2_QUIT : keybind_resource.p2_quit_key,
	}
	return keybinds_container_dict

## GETTING FUNCTIONS, FOR GETTING

func get_window_mode_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_WINDOW_MODE_INDEX
	return window_mode_index

func get_resolution_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_RESOLUTION_INDEX
	return resolution_index

func get_master_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MASTER_VOLUME
	return master_volume

func get_music_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MUSIC_VOLUME
	return music_volume

func get_sfx_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_SFX_VOLUME
	return sfx_volume

func get_discord_rich() -> bool:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_CLASSIC_3_COMBINE_STATE
	return discord_rich

func get_classic_3_combine_state() -> bool:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_CLASSIC_3_COMBINE_STATE
	return classic_3_combine_state

func get_keybind(action : String):
	if !loaded_data.has("keybinds"):
		match action:
			keybind_resource.P1_MOVE_LEFT:
				return keybind_resource.DEFAULT_P1_LEFT_KEY
			keybind_resource.P1_MOVE_RIGHT:
				return keybind_resource.DEFAULT_P1_RIGHT_KEY
			keybind_resource.P1_DROP:
				return keybind_resource.DEFAULT_P1_DROP_KEY
			keybind_resource.P1_QUIT:
				return keybind_resource.DEFAULT_P1_QUIT_KEY
			keybind_resource.P2_MOVE_LEFT:
				return keybind_resource.DEFAULT_P2_LEFT_KEY
			keybind_resource.P2_MOVE_RIGHT:
				return keybind_resource.DEFAULT_P2_RIGHT_KEY
			keybind_resource.P2_DROP:
				return keybind_resource.DEFAULT_P2_DROP_KEY
			keybind_resource.P2_QUIT:
				return keybind_resource.DEFAULT_P2_QUIT_KEY
	else:
		match action:
			keybind_resource.P1_MOVE_LEFT:
				return keybind_resource.p1_left_key
			keybind_resource.P1_MOVE_RIGHT:
				return keybind_resource.p1_right_key
			keybind_resource.P1_DROP:
				return keybind_resource.p1_drop_key
			keybind_resource.P1_QUIT:
				return keybind_resource.p1_quit_key
			keybind_resource.P2_MOVE_LEFT:
				return keybind_resource.p2_left_key
			keybind_resource.P2_MOVE_RIGHT:
				return keybind_resource.p2_right_key
			keybind_resource.P2_DROP:
				return keybind_resource.p2_drop_key
			keybind_resource.P2_QUIT:
				return keybind_resource.p2_quit_key

#SETTING FUNC FOR SETTING

func on_window_mode_selected(index : int) -> void:
	window_mode_index = index

func on_resolution_selected(index : int) -> void:
	resolution_index = index

func on_master_sound_set(value : float) -> void:
	master_volume = value

func on_music_sound_set(value : float) -> void:
	music_volume = value

func on_sfx_sound_set(value : float) -> void:
	sfx_volume = value

func on_discord_rich_toggled(value : bool) -> void:
	discord_rich = value
	print(discord_rich)

func on_classic_3_combine_toggled(value : bool) -> void:
	classic_3_combine_state = value

func set_keybind(action: String, event: InputEventKey) -> void:
	match action:
		keybind_resource.P1_MOVE_LEFT:
			keybind_resource.p1_left_key = event
		keybind_resource.P1_MOVE_RIGHT:
			keybind_resource.p1_right_key = event
		keybind_resource.P1_DROP:
			keybind_resource.p1_drop_key = event
		keybind_resource.P1_QUIT:
			keybind_resource.p1_quit_key = event
		keybind_resource.P2_MOVE_LEFT:
			keybind_resource.p2_left_key = event
		keybind_resource.P2_MOVE_RIGHT:
			keybind_resource.p2_right_key = event
		keybind_resource.P2_DROP:
			keybind_resource.p2_drop_key = event
		keybind_resource.P2_QUIT:
			keybind_resource.p2_quit_key = event

func on_keybinds_loaded(data : Dictionary) -> void:
	#snitch
	var loaded_p1_left = InputEventKey.new()
	var loaded_p1_right = InputEventKey.new()
	var loaded_p1_drop = InputEventKey.new()
	var loaded_p1_quit = InputEventKey.new()
	var loaded_p2_left = InputEventKey.new()
	var loaded_p2_right = InputEventKey.new()
	var loaded_p2_drop = InputEventKey.new()
	var loaded_p2_quit = InputEventKey.new()
	
	loaded_p1_left.set_physical_keycode(int(data.p1_left))
	loaded_p1_right.set_physical_keycode(int(data.p1_right))
	loaded_p1_drop.set_physical_keycode(int(data.p1_drop))
	loaded_p1_quit.set_physical_keycode(int(data.p1_quit))
	loaded_p2_left.set_physical_keycode(int(data.p2_left))
	loaded_p2_right.set_physical_keycode(int(data.p2_right))
	loaded_p2_drop.set_physical_keycode(int(data.p2_drop))
	loaded_p2_quit.set_physical_keycode(int(data.p2_quit))
	
	keybind_resource.p1_left_key = loaded_p1_left
	keybind_resource.p1_right_key = loaded_p1_right
	keybind_resource.p1_drop_key = loaded_p1_drop
	keybind_resource.p1_quit_key = loaded_p1_quit
	keybind_resource.p2_left_key = loaded_p2_left
	keybind_resource.p2_right_key = loaded_p2_right
	keybind_resource.p2_drop_key = loaded_p2_drop
	keybind_resource.p2_quit_key = loaded_p2_quit

func on_settings_data_loaded(data : Dictionary) -> void:
	loaded_data = data
	on_window_mode_selected(loaded_data.window_mode_index)
	on_resolution_selected(loaded_data.resolution_index)
	on_master_sound_set(loaded_data.master_volume)
	on_music_sound_set(loaded_data.music_volume)
	on_sfx_sound_set(loaded_data.sfx_volume)
	on_discord_rich_toggled(loaded_data.discord_rich)
	on_classic_3_combine_toggled(loaded_data.classic_3_combine_state)
	on_keybinds_loaded(loaded_data.keybinds)


func handle_signals() -> void:
	SettingsSignalBus.on_window_mode_selected.connect(on_window_mode_selected)
	SettingsSignalBus.on_resolution_selected.connect(on_resolution_selected)
	SettingsSignalBus.on_master_sound_set.connect(on_master_sound_set)
	SettingsSignalBus.on_music_sound_set.connect(on_music_sound_set)
	SettingsSignalBus.on_sfx_sound_set.connect(on_sfx_sound_set)
	SettingsSignalBus.on_discord_rich_toggled.connect(on_discord_rich_toggled)
	SettingsSignalBus.on_classic_3_combine_toggled.connect(on_classic_3_combine_toggled)
	SettingsSignalBus.load_settings_data.connect(on_settings_data_loaded)
