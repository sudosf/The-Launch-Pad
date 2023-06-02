extends Control


func _ready():
	$overview.text = "Playing: Round " + str(Global.round_number)
	
	# set up round 1
	$Panel1/questions.text = str(Global.total_questions) + " Questions"
	$Panel1/QuestionNumber.text = str(Global.correct_answered) + " / " + str(Global.total_questions)


func _on_continueBtn_pressed():
	Global.add_next_scene()

func _on_backBtn_pressed():
	Global.custom_change_scene("res://final/scenes/begin.tscn")
