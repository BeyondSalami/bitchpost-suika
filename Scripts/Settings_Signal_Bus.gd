extends Node

#signals

signal on_classic_3_combine_toggled(value : bool)

signal on_window_mode_selected(index : int)

signal on_resolution_selected(index : int)

signal on_master_sound_set(value : float)

signal on_music_sound_set(value : float)

signal on_sfx_sound_set(value : float)

signal set_settings_dictionary(settings_dict : Dictionary)

signal load_settings_data(settings_dict : Dictionary)

signal on_discord_rich_toggled(value : bool)

#functions

func emit_load_settings_data(settings_dict : Dictionary) -> void:
	load_settings_data.emit(settings_dict)
	SettingsContainer.on_settings_data_loaded(settings_dict)


func emit_set_settings_dictionary(settings_dict : Dictionary) -> void:
	set_settings_dictionary.emit(settings_dict)

func emit_on_classic_3_combine_toggled(value : bool) -> void:
	on_classic_3_combine_toggled.emit(value)

func emit_on_discord_rich_toggled(value : bool) -> void:
	on_discord_rich_toggled.emit(value)

func emit_on_window_mode_selected(index : int) -> void:
	on_window_mode_selected.emit(index)

func emit_on_resolution_selected(index : bool) -> void:
	on_resolution_selected.emit(index)

func emit_on_master_sound_set(value : float) -> void:
	on_master_sound_set.emit(value)

func emit_on_music_sound_set(value : float) -> void:
	on_music_sound_set.emit(value)

func emit_on_sfx_sound_set(value : float) -> void:
	on_sfx_sound_set.emit(value)
