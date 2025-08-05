extends Control

var template = load("res://scenes/bio-bubbles/Template-Bio-Popup.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_item_list_item_activated(index):
	var instance = template.instantiate()
	instance.index_passthrough = index
	add_child(instance)
