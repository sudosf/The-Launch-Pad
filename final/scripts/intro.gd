extends Control

# multi-choice instances
onready var multi_choice = preload("res://final/scenes/multi_choice.tscn")
onready var mc_option = preload("res://final/components/icon_option_btn.tscn")

# float left-right instances
onready var left_right = preload("res://final/scenes/float_LeftRight.tscn")
onready var lr_option = preload("res://final/components/left_right_option.tscn")

# float up-down instances
onready var up_down = preload("res://final/scenes/float_UpDown.tscn")
onready var up_option = preload("res://final/components/up_down_option.tscn")

# float circle instances
onready var circle = preload("res://final/scenes/float_circle.tscn")
onready var circle_option = preload("res://final/components/option_btn.tscn")

func _ready():
	$playBtn.disabled = true # wait for quiz_scenes to load
	Network.get_all_questions()

func _process(delta):
	
	# TODO
	# 	- set total questions
	
	if Global.response_collected:
		Global.documents = Network.response # store all questions
		# Global.total_questions = Global.documents.size()

		Global.response_collected = false
		instance_quiz() # set up quiz scenes
		$playBtn.disabled = false
	
	if Network.request_complete: # check if status reqeust is completed
		Global.response_collected = true
		Network.request_complete = false
	else: return

func instance_quiz():
	for doc in Global.documents:
		
		if doc['type'] == "multi-choice": # set up multi-choice quiz questions
			Global.total_questions += 1
			var mc_instance = multi_choice.instance()
			instance_mc_opt(mc_instance, doc["options"]) # add multi-choice options to scene
			
			mc_instance.get_node("answer").text = doc["answer"]
			mc_instance.get_node("PanelQuestion/questionLbl").text = doc["question"]
			
			Global.quiz_scenes.push_back(mc_instance) # add scene to quiz-scene list

		elif doc['type'] == "left-right": # set up left-right quiz questions
			Global.total_questions += 1
			var lr_instance = left_right.instance()
			
			instance_left_right_opt(lr_instance, doc['options'])
			
			lr_instance.get_node("answer").text = doc["answer"]
			lr_instance.get_node("PanelQuestion/questionLbl").text = doc["question"]
			
			Global.quiz_scenes.push_back(lr_instance)
			
		elif doc['type'] == "up-down": # set up up-down quiz questions
			pass
			
		elif doc['type'] == "circular": # set up circular quiz questions
			pass

func instance_mc_opt(mc_scene, options):
	for opt in options:
		var opt_instance = mc_option.instance()
		opt_instance.text = opt
		mc_scene.get_node("options").add_child(opt_instance)

func instance_left_right_opt(lr_scene, options):
	var pos_offset = 100
	var count = 0
	for opt in options:
		var opt_instance = lr_option.instance()
		opt_instance.get_node("option").text = opt
		
		if count % 2 == 0:
			opt_instance.get_node("neg_direction").text = str(-1)
			opt_instance.get_node("offset").text = str(pos_offset)
		else: 
			opt_instance.get_node("offset").text = str(pos_offset)
		
		pos_offset += 100
		count += 1
		
		lr_scene.get_node("LeftRight/options").add_child(opt_instance)

func instance_up_down_opt(up_scene, options):
	pass

func instance_circle_opt(circle_scene, options):
	pass

func _on_playBtn_pressed():
	get_tree().change_scene("res://final/scenes/main.tscn")
