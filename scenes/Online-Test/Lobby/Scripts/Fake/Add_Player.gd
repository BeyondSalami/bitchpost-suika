extends Node

@onready var Player_List = $Player_List

func Add_Player_Name(Name):
	var name_label = Label.new()
	name_label.text = Name
	Player_List.add_child(name_label)
