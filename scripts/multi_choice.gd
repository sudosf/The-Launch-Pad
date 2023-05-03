extends Control

onready var nextBtn = $Panel/nextBtn
onready var itemList = $Panel/ItemList

# multiple choice
var multi_choice_qn: Array # question(s) from DB

var opt_select # selected option by user

func _ready():
	Network.get_questions("multi-choice")

func _process(delta):
	if Network.request_complete: # check if status reqeust is completed
		multi_choice_qn = Network.response
		print(multi_choice_qn)
		Network.request_complete = false
	else: return

func _on_ItemList_item_selected(index: int) -> void:
	opt_select = itemList.get_item_text(index)
	nextBtn.disabled = false

func _on_nextBtn_pressed():
	Global.add_next_scene()
