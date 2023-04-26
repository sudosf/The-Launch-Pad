extends Control

onready var RestartButton = $VBoxContainer/next

func _ready():
	Network.getAll()
	# print(Global.get_status())
