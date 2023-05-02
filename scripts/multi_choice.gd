extends Control

onready var nextBtn = $Panel/nextBtn
onready var itemList = $Panel/ItemList

var opt_select # selected option by user

func _ready():
	Network.get_status()

func _process(delta):
	if Network.request_complete: # check if status reqeust is completed
		Network.print_status()
	else: return



func _on_ItemList_item_selected(index: int) -> void:
	opt_select = itemList.get_item_text(index)
	nextBtn.disabled = false

func _on_nextBtn_pressed():
	print(opt_select)
