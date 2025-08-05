class_name HotkeyRebindButton
extends Control

@onready var label = $HBoxContainer/Label as Label
@onready var button = $HBoxContainer/Button as Button

@export var action_name : String = ""

func _ready():
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()
	load_keybinds()

func load_keybinds() -> void:
	rebind_action_key(SettingsContainer.get_keybind(action_name))

func set_action_name() -> void:
	label.text = "Unassigned"
	
	match action_name:
		"p1_left":
			label.text = "Move Left"
		"p1_right":
			label.text = "Move Right"
		"p1_drop":
			label.text = "Drop Ball"
		"p1_quit":
			label.text = "Quit Match"
		"p2_left":
			label.text = "Move Left"
		"p2_right":
			label.text = "Move Right"
		"p2_drop":
			label.text = "Drop Ball"
		"p2_quit":
			label.text = "Quit Match"

func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode =  OS.get_keycode_string(action_event.physical_keycode)
	
	button.text = "%s" % action_keycode

func _on_button_toggled(toggled_on):
	if toggled_on:
		button.text = "Press Any Key..."
		set_process_unhandled_key_input(toggled_on)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
	else:
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
		
		set_text_for_key()

func _unhandled_key_input(event):
	rebind_action_key(event)
	button.toggle_mode = false

func rebind_action_key(event) -> void:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	SettingsContainer.set_keybind(action_name, event)
	
	set_process_unhandled_key_input(false)
	set_text_for_key()
	set_action_name()
