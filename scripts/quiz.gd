extends Control

onready var RestartButton = $VBoxContainer/next

func _ready():
	Network.get_status()

func _process(delta):
	if Network.request_complete: # check if status reqeust is completed
		Network.print_status()
	else: return

