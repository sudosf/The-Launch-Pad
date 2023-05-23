extends Control

# multi-choice instances
onready var multi_choice = preload("res://final/scenes/multi_choice.tscn")
onready var option_scene = preload("res://final/components/icon_option_btn.tscn")


func _ready():
	Network.get_all_questions()
	pass

func _process(delta):
	if Global.response_collected:
		# store all questions
		Global.documents = Network.response
		instance_quiz()
		Global.response_collected = false
	
	if Network.request_complete: # check if status reqeust is completed
		Global.response_collected = true
		Network.request_complete = false
	else: return

func instance_quiz():
	for doc in Global.documents:
		if doc['type'] == "multi-choice":
			var mc_instance = multi_choice.instance()
			
			instance_mc_options(mc_instance, doc["options"])
			
			mc_instance.get_node("answer").text = doc["answer"]
			mc_instance.get_node("PanelQuestion/questionLbl").text = doc["question"]
			
			Global.quiz_scenes.push_back(mc_instance)

		elif doc['type'] == "left-right":
			pass
		elif doc['type'] == "up-down":
			pass
		elif doc['type'] == "circular":
			pass

func instance_mc_options(mc_scene, options):
	for opt in options:
		var opt_instance = option_scene.instance()
		opt_instance.text = opt
		opt_instance.connect("pressed", self, "_on_optionBtn_pressed", [opt])
		mc_scene.get_node("options").add_child(opt_instance)

func _on_playBtn_pressed():
	Global.add_next_scene()
