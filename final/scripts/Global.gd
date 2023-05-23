extends Node

"""
	# global script for accessing variables from any scene and...
"""

# player/user stats
var score: int = 0

# check if http request is complete to store documents from DB
var response_collected: bool = false
var documents # all documents in Collection('questions)

var quiz_scenes: Array # all quiz scenes

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# add next quiz question
func add_next_scene():
	if not quiz_scenes.empty():
		get_tree().get_root().add_child(quiz_scenes.pop_front())
	else:
		get_tree().change_scene("res://final/scenes/end.tscn")
