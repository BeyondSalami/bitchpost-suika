extends CharacterBody2D

var move_speed = 500
@onready var Spawner = get_node("./TestSpawner")
@export var controls : Resource = null
@onready var ballsman = $"../../../Ball_Manager"
@onready var multi_sync = $"../../../../MultiplayerSynchronizer"

func _physics_process(_delta):
	if multi_sync.get_multiplayer_authority() == multiplayer.get_unique_id():
		var input_direction = Vector2(
			Input.get_action_strength(controls.right) - Input.get_action_strength(controls.left),
			0
		)
		velocity = input_direction * move_speed
		move_and_slide()

func _unhandled_input(_event):
	if multi_sync.get_multiplayer_authority() == multiplayer.get_unique_id():
		if Input.is_action_just_pressed(controls.drop):
			Spawner.drop_ball.rpc()
		if Input.is_action_just_pressed(controls.leave):
			ballsman.leave_menu.rpc()
