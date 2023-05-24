extends Control


func _ready():
	$TextBubble/result.text = Network.error_status + " Error"
	pass

func _on_playBtn_pressed():
	get_tree().change_scene("res://final/scenes/intro.tscn")
