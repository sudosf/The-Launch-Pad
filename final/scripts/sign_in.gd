extends Control


func _ready():
	pass

func _on_signInBtn_pressed():
	Global.custom_change_scene("res://final/scenes/begin.tscn")

func _on_signUpBtn_pressed():
	Global.custom_change_scene("res://final/scenes/sign_up.tscn")

func _on_backBtn_pressed():
	Global.custom_change_scene("res://final/scenes/intro.tscn")
