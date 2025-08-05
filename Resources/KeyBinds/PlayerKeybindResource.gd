class_name PlayerKeybindsResource
extends Resource

const P1_MOVE_LEFT : String = "p1_left"
const P1_MOVE_RIGHT : String = "p1_right"
const P1_DROP : String = "p1_drop"
const P1_QUIT : String = "p1_quit"
const P2_MOVE_LEFT : String = "p2_left"
const P2_MOVE_RIGHT : String = "p2_right"
const P2_DROP : String = "p2_drop"
const P2_QUIT : String = "p2_quit"


@export var DEFAULT_P1_LEFT_KEY = InputEventKey.new()
@export var DEFAULT_P1_RIGHT_KEY = InputEventKey.new()
@export var DEFAULT_P1_DROP_KEY = InputEventKey.new()
@export var DEFAULT_P1_QUIT_KEY = InputEventKey.new()
@export var DEFAULT_P2_LEFT_KEY = InputEventKey.new()
@export var DEFAULT_P2_RIGHT_KEY = InputEventKey.new()
@export var DEFAULT_P2_DROP_KEY = InputEventKey.new()
@export var DEFAULT_P2_QUIT_KEY = InputEventKey.new()

var p1_left_key = InputEventKey.new()
var p1_right_key = InputEventKey.new()
var p1_drop_key = InputEventKey.new()
var p1_quit_key = InputEventKey.new()
var p2_left_key = InputEventKey.new()
var p2_right_key = InputEventKey.new()
var p2_drop_key = InputEventKey.new()
var p2_quit_key = InputEventKey.new()
