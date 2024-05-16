extends Node
#ggg
var cherry = preload("res://balls/Mac.tscn")
var strawberry = preload("res://balls/itsafeature.tscn")
var grape = preload("res://balls/Kittrz.tscn")
var tang = preload("res://balls/Duckaccino.tscn")
var win_menu = preload("res://scenes/win_menu.tscn")

var spawn_location
@export var spawn_location_path: NodePath
var can_spawn = true
var rng = RandomNumberGenerator.new()
@onready var can_die = false
var first_spawn = true
@export var fruit_pick: float

func _ready():
	fruit_pick = rng.randfn(1.5,4)

func _process(_delta):
	spawn_location = get_node(spawn_location_path).global_position

@rpc("any_peer","call_local")
func drop_ball():
	if can_spawn == true:
		can_die = false
		if first_spawn == true:
			first_spawn = false
			var instance = cherry.instantiate()
			instance.position.x = spawn_location.x
			instance.position.y = spawn_location.y + 130
			add_child(instance)
			can_spawn = false
			fruit_pick = rng.randfn(1.5,4)
			await get_tree().create_timer(.5).timeout
			can_spawn = true
			can_die = true
			return
		if fruit_pick > 9:
			var instance = tang.instantiate()
			instance.position.x = spawn_location.x
			instance.position.y = spawn_location.y + 130
			add_child(instance)
			can_spawn = false
			fruit_pick = rng.randfn(1.5,4)
			await get_tree().create_timer(.7).timeout
			can_spawn = true
			can_die = true
		else:
			if fruit_pick > 7:
				var instance = grape.instantiate()
				instance.position.x = spawn_location.x
				instance.position.y = spawn_location.y + 130
				add_child(instance)
				can_spawn = false
				fruit_pick = rng.randfn(1.5,4)
				await get_tree().create_timer(.5).timeout
				can_spawn = true
				can_die = true
			else:
				if fruit_pick > 3:
					var instance = strawberry.instantiate()
					instance.position.x = spawn_location.x
					instance.position.y = spawn_location.y + 130
					add_child(instance)
					can_spawn = false
					fruit_pick = rng.randfn(1.5,4)
					await get_tree().create_timer(.5).timeout
					can_spawn = true
					can_die = true
				else:
					var instance = cherry.instantiate()
					instance.position.x = spawn_location.x
					instance.position.y = spawn_location.y + 130
					add_child(instance)
					can_spawn = false
					fruit_pick = rng.randfn(1.5,4)
					await get_tree().create_timer(.5).timeout
					can_spawn = true
					can_die = true
