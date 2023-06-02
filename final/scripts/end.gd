extends Control


func _ready():
	$PanelScore/round.text = "Round " + str(Global.round_number)
	$PanelScore/score.text = "Score: " + str(Global.score) + " Points"

	$PanelScore/totalQuestions.text = "Correct: "+ str(Global.correct_answered) +" / "+ str(Global.total_questions)
	
	# 50% pass mark
	if Global.correct_answered > 0:
		if Global.total_questions / Global.correct_answered <= 2:
			$TextBubble/result.text = "You win!"
		else: $TextBubble/result.text = "Sorry, you didn't win."
	else: $TextBubble/result.text = "Sorry, you didn't win."
	
	# TODO 
	# Show feedback to user
	#	- add continue button

func _on_playBtn_pressed():
	Global.reset_progress()
	Global.custom_change_scene("res://final/scenes/begin.tscn")

