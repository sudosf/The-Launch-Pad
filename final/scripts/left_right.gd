extends Control

onready var option_scene = preload("res://final/components/left_right_option.tscn")

var options_data = [
	{"id": 1, "text": "number 1"},
	{"id": 2, "text": "number 2"},
	{"id": 3, "text": "number 3"},
]

var pos_offset = 100
func _ready():
	# populate_options(options_data)
	pass

func populate_options(data):
	var count = 0
	for option_data in data:
		var option_instance = option_scene.instance()
		option_instance.get_node("option").text = option_data['text']
		
		if count % 2 == 0:
			option_instance.get_node("neg_direction").text = str(-1)
			option_instance.get_node("offset").text = str(pos_offset)
		else: 
			option_instance.get_node("offset").text = str(pos_offset)
		
		pos_offset += 150
		count += 1
		
		$VBoxContainer.add_child(option_instance)


