extends Control


func _ready():
	pass


func _on_continueBtn_pressed():
	get_tree().change_scene("res://final/scenes/multi_choice.tscn")
