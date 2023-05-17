extends Control

onready var nextBtn = $Panel/nextBtn
onready var itemList = $Panel/ItemList

# True/False
var TF_qn: Array # question(s) from DB

var opt_select # selected option by user

func _ready():
	Network.get_questions("T-F")

func _process(delta):
	if Network.request_complete: # check if status reqeust is completed
		TF_qn = Network.response
		print(TF_qn[0])
		Network.request_complete = false
	else: return

func _on_ItemList_item_selected(index: int) -> void:
	opt_select = itemList.get_item_text(index)
	nextBtn.disabled = false

func _on_nextBtn_pressed():
	Global.add_next_scene()
