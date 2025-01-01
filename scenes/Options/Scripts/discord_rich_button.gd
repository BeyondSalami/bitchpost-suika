extends Control

@onready var check_button = $HBoxContainer/CheckButton as CheckButton
@onready var state_label = $HBoxContainer/Value as Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	check_button.toggled.connect(on_discord_rich_toggled)
	var state = SettingsContainer.get_discord_rich()
	if state != true:
		state_label.text = "Disabled"
		check_button.button_pressed = false
	else:
		state_label.text = "Enabled"
		check_button.button_pressed = true

func set_label_text(button_pressed : bool) -> void:
	if button_pressed != true:
		state_label.text = "Disabled"
	else:
		state_label.text = "Enabled"


func on_discord_rich_toggled(button_pressed : bool) -> void:
	set_label_text(button_pressed)
	SettingsSignalBus.emit_on_discord_rich_toggled(button_pressed)
