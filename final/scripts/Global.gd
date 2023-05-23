extends Node

"""
	# global script for accessing variables from any scene and...
"""

# questions from DB
var response_collected: bool = false
var documents # all documents in Collection('questions)

var quiz_scenes: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	# Network.get_all_questions()
	pass

func _process(delta):
	"""
	if response_collected:
		# instance_scene(multi_choice_scene, "multi-choice")
		# response_collected = false
		
	if Network.request_complete: # check if status reqeust is completed
		multi_choice_qn = Network.response[0]
		print(multi_choice_qn)
		response_collected = true
		Network.request_complete = false
	else: return
	"""
	pass

func add_next_scene():
	if not quiz_scenes.empty():
		get_tree().get_root().add_child(quiz_scenes.pop_front())

func instance_scene(scene, type):
	if type ==  "multi-choice":
		var scene_instance = scene.instance()
		quiz_scenes.push_back(scene_instance)
	else:
		pass
