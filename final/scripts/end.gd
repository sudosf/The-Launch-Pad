extends Control


func _ready():
	$PanelScore/round.text = "Round " + str(Global.round_number)
	$PanelScore/score.text = "Score: " + str(Global.score) + " Points"

	$PanelScore/totalQuestions.text = "Correct: "+ str(Global.correct_answered) +" / "+ str(Global.total_questions)
	
	# TODO 
	# Show feedback to user
	#	- add continue button
	pass

func _on_playBtn_pressed():
	get_tree().change_scene("res://final/scenes/intro.tscn")
