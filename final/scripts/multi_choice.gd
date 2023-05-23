extends Control

onready var option_scene = preload("res://final/components/icon_option_btn.tscn")

var correct_ans 
var selected_ans

var options_data = [
	{"id": 1, "text": "number 1"},
	{"id": 2, "text": "number 2"},
	{"id": 3, "text": "number 3"},
	{"id": 4, "text": "number 4"},
]

func _ready():
	correct_ans = $answer.text
	print(correct_ans)
	# populate_options(options_data)

func populate_options(data):

	for option_data in data:
		var option_instance = option_scene.instance()
		option_instance.text = option_data['text']
		option_instance.connect("pressed", self, "_on_optionBtn_pressed", [option_data['text']])
		
		$options.add_child(option_instance)

func check_answer():
	if selected_ans != correct_ans:
		print("incorrrect")
	else: 
		print("corrrect!!!")

func _on_optionBtn_pressed(text):
	selected_ans = text
	print(selected_ans)
	pass

func _on_continueBtn_pressed():
	check_answer()
	
	# TODO
	# Global gets next question
	# get_tree().change_scene("res://final/scenes/end.tscn")
