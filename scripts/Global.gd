extends Node

"""
	# global script for accessing variables from any scene and...
"""

# questions from DB
var multi_choice_qn
var response_collected: bool = false

# scenes preload
var multi_choice_scene = preload("res://scenes/multi_choice.tscn")
var multi_response_scene = preload("res://scenes/multi_response.tscn")
var TF_scene = preload("res://scenes/T-F.tscn")
var short_ans_scene = preload("res://scenes/short_ans.tscn")

var scene_instances: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	Network.get_questions("multi-choice")
	# var scenes = [ multi_choice_scene, multi_response_scene, TF_scene, short_ans_scene ]
	pass # Replace with function body.

func _process(delta):
	if response_collected:
		instance_scene(multi_choice_scene, "multi-choice")
		instance_scene(multi_response_scene, "multi-response")
		instance_scene(TF_scene, "T-F")
		instance_scene(short_ans_scene, "short-answer")
		response_collected = false
		
	if Network.request_complete: # check if status reqeust is completed
		multi_choice_qn = Network.response[0]
		print(multi_choice_qn)
		response_collected = true
		Network.request_complete = false
	else: return

func add_next_scene():
	if(not scene_instances.empty()):
		get_tree().get_root().add_child(scene_instances.pop_front())

func instance_scene(scene, type):
	if type ==  "multi-choice":
		var scene_instance = scene.instance()
		
		scene_instance.get_node("Panel/qn").text = multi_choice_qn["question"]
		var item_list = scene_instance.get_node("Panel/ItemList")
		
		var i = 0
		for opt in multi_choice_qn['options']:
			item_list.set_item_text(i, opt)
			i += 1
		
		scene_instances.push_back(scene_instance)
	else:
		var scene_instance = scene.instance()
		scene_instances.push_back(scene_instance)





