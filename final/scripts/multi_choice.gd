extends Control

"""
	# option data (for $options VBoxContainer) is set in "intro.gd" script
"""

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
	
	# set up all options to detect correct answers
	for opt in $options.get_children():
		# [opt.text] contains option data
		opt.connect("pressed", self, "_on_optionBtn_pressed", [opt.text])

func check_answer():
	# TODO 
	# Update user score
	# Show feedback to user
	#	- add check button
	#	- add continue button
	
	if selected_ans != correct_ans:
		print("incorrrect")
	else: 
		print("corrrect!")

func _on_optionBtn_pressed(text):
	# update current answer selected by user
	selected_ans = text

func _on_continueBtn_pressed():
	check_answer()
	Global.add_next_scene()
