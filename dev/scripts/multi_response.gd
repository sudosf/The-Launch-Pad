extends Control

onready var nextBtn = $Panel/nextBtn
onready var itemList = $Panel/ItemList

# multiple choice
var multi_response_qn: Array # question(s) from DB

var selected: Array = []
var opt_select # selected option by user

func _ready():
	Network.get_questions("multi-choice")

func _process(delta):
	if Network.request_complete: # check if status reqeust is completed
		multi_response_qn = Network.response
		print(multi_response_qn[0])
		Network.request_complete = false

func _on_ItemList_item_selected(index: int) -> void:
	opt_select = itemList.get_item_text(index)
	
	if (selected.has(opt_select)):
		itemList.set_item_custom_bg_color(index, Color(0.662745, 0.662745, 0.662745, 1) )
		selected.erase(opt_select)
	else:
		itemList.set_item_custom_bg_color(index, Color(0.498039, 1, 0.831373, 1) )
		selected.push_back(opt_select)
	
	nextBtn.disabled = false

func _on_nextBtn_pressed():
	Global.add_next_scene()
