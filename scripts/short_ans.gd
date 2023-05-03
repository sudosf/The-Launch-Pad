extends Control

onready var nextBtn = $Panel/nextBtn
onready var itemList = $Panel/ItemList

# True/False
var short_ans_qn: Array # question(s) from DB

var opt_select # selected option by user

func _ready():
	Network.get_questions("short-answer")

func _process(delta):
	if Network.request_complete: # check if status reqeust is completed
		short_ans_qn = Network.response
		print(short_ans_qn[0])
		Network.request_complete = false
	else: return

func _on_nextBtn_pressed():
	Global.add_next_scene()


func _on_LineEdit_text_changed(new_text):
	nextBtn.disabled = false
