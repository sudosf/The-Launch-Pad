extends Control

"""
	# option data (mutli-choice options) is set in "intro.gd" script
"""
onready var options = $Circle/Panel/Node2D/Path2D

var correct_ans 
var selected_ans

var saved_options
var total_options = 0
var timer = 0
var spawnTime = 2
var spawnAmt = 1

func _ready():
	$PanelProgress/stats/QuestionNumber.text = str(Global.question_number) + " / " + str(Global.total_questions)
	$PanelProgress/continueBtn.disabled = true
	correct_ans = $answer.text
	
	# save all circle options
	var options_data = options.get_children()
	Global.saved_circle_options = options_data.duplicate()
	total_options = Global.saved_circle_options.size()
	
	# clear all instanced options
	# reset to enable circle animation
	for opt in options_data:
		options.remove_child(opt)
	
	# add first option
	add_circle_option()

func _process(delta):
	if spawnAmt >= total_options:
		return # don't exceed option instances limit
		
	timer = timer + delta
	if timer > spawnTime:
		add_circle_option()
		spawnAmt += 1
		timer = 0

func add_circle_option():
	var opt = Global.saved_circle_options.pop_front()
	var opt_text = opt.get_node("option").text
	opt.get_node("option").connect("pressed", self, "_on_optionBtn_pressed", [opt_text])
	options.add_child(opt)

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
