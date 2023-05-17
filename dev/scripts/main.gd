extends Control

# multiple choice
var multi_choice_qn: Array # question(s) from DB

func _ready():
	# Network.get_questions("multi-choice")
	pass

func _process(delta):
	if Network.request_complete: # check if status reqeust is completed
		Global.multi_choice_qn = Network.response
		print(multi_choice_qn)
		Network.request_complete = false
	else: return

func _on_Play_pressed():
	# multi_choice_scene.get_node("Panel/qn").text = "this"
	Global.add_next_scene()
	# get_tree().change_scene_to(multi_choice_scene)
	pass

func _on_Exit_pressed():
	get_tree().quit()
