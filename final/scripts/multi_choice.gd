extends Control

"""
	# option data (mutli-choice options) is set in "intro.gd" script
"""

var correct_ans 
var selected_ans

func _ready():
	$PanelProgress/stats/QuestionNumber.text = str(Global.question_number) + " / " + str(Global.total_questions)
	
	$PanelProgress/continueBtn.disabled = true
	correct_ans = $answer.text
	
	# set up all options to detect correct answers
	for opt in $options.get_children():
		# [opt.text] contains option data
		opt.connect("pressed", self, "_on_optionBtn_pressed", [opt.text])

func check_answer():
	
	if selected_ans == correct_ans:
		Global.score += 10
		Global.correct_answered += 1
		print("corrrect!")
	else: print("incorrrect")
	
	Global.question_number += 1
	
	
func _on_optionBtn_pressed(text):
	selected_ans = text # update current answer selected by user
	$PanelProgress/continueBtn.disabled = false

func _on_continueBtn_pressed():
	check_answer()
	queue_free()
	Global.add_next_scene()

func _on_backBtn_pressed():
	Global.update_quiz_progress()
