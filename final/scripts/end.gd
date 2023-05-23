extends Control


func _ready():
	# TODO 
	# Show feedback to user
	#	- add check button
	#	- add continue button
	pass

func _on_playBtn_pressed():
	get_tree().change_scene("res://final/scenes/main.tscn")
