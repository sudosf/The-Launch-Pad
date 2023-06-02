extends Control


func _ready():
	$TextBubble/result.text = Network.error_status + " Error"
	pass

func _on_playBtn_pressed():
	Global.custom_change_scene("res://final/scenes/begin.tscn")
	
