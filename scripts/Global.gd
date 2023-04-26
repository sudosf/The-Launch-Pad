extends Node

"""
	# global script for accessing variables from any scene
"""

var conn_status: bool = false

# questions from DB
var multi_choice
var multi_response
var T_F
var short_ans
var fill_blank


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_status():
	if (!conn_status): 
		return "API Status: connection failed."
		
	return "API Status: Connected, API Running."
