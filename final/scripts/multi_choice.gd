extends Control

var optionBtns: Array
var correct_ans = "ans 4"
var current_answer

func _ready():
	for btn in $options.get_children():
		optionBtns.push_back(btn)

func check_answer():
	if current_answer != correct_ans:
		print("incorrrect")
	else: 
		print("corrrect!!!")

func _on_option1_pressed():
	current_answer = $options/option1.text
	print(current_answer)	

func _on_option2_pressed():
	current_answer = $options/option2.text
	print(current_answer)	

func _on_option3_pressed():
	current_answer = $options/option3.text
	print(current_answer)

func _on_option4_pressed():
	current_answer = $options/option4.text
	print(current_answer)
	# $options/option4["custom_styles/normal"].bg_color = Color("#bada55")

func _on_continueBtn_pressed():
	check_answer()
	get_tree().change_scene("res://final/scenes/end.tscn")
