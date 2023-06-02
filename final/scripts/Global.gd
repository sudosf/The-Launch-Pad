extends Node

"""
	# global script for accessing variables from any scene and...
"""

# round stats
var round_number = 1
var question_number = 0
var total_questions = 0

# player/user stats
var score: int = 0
var correct_answered = 0

# check if http request is complete to store documents from DB
var response_collected: bool = false
var documents: Array # all documents in Collection('questions)

var saved_circle_options

var quiz_scenes: Array # all quiz scenes

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# add next quiz question
func add_next_scene():
	# print("Score: ", score)
	# print("questions: ", correct_answered)
	
	randomize()
	quiz_scenes.shuffle() # add scenes randomly
	if not quiz_scenes.empty():
		get_tree().get_root().add_child(quiz_scenes.pop_front())
	else:
		var error_code = get_tree().change_scene("res://final/scenes/end.tscn")
		if error_code != 0:
			print("Change scene Error: ", error_code)

func update_quiz_progress():
	total_questions = quiz_scenes.size()
	question_number = 0
	var error_code = get_tree().change_scene("res://final/scenes/main.tscn")
	if error_code != 0:
		print("Change scene Error: ", error_code)

func reset_progress():
	round_number = 1
	question_number = 0
	total_questions = 0
	
	# user stats
	score = 0
	correct_answered = 0

func custom_change_scene(scene_path):
	var error_code = get_tree().change_scene(scene_path)
	if error_code != 0:
		print("Change scene Error: ", error_code)
