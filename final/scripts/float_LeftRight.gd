extends Control

"""
	# option data (for $options VBoxContainer) is set in "intro.gd" script
"""

var correct_ans 
var selected_ans

func _ready():
	$PanelProgress/continueBtn.disabled = true
	correct_ans = $answer.text
	
	# set up all options to detect correct answers
	for opt in $LeftRight/options.get_children():
		# [opt.text] contains option data
		var opt_text = opt.get_node("option").text
		opt.get_node("option").connect("pressed", self, "_on_optionBtn_pressed", [opt_text])

func check_answer():
	
	if selected_ans == correct_ans:
		Global.score += 10
		Global.correct_answered += 1
		print("corrrect!")
	else: print("incorrrect")
	
	
func _on_optionBtn_pressed(text):
	selected_ans = text # update current answer selected by user
	$PanelProgress/continueBtn.disabled = false

func _on_continueBtn_pressed():
	check_answer()
	Global.add_next_scene()
