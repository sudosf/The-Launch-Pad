extends Path2D

var follower = preload("res://final/components/Follow2D.tscn")

var timer = 0
var spawnTime = 2.5
var spawnAmt = 1

func _ready():
	var new_fol = follower.instance()
	add_child(new_fol)

func _process(delta):
	if spawnAmt >= 4:
		return # only create 4 instances 
	timer = timer + delta
	
	if timer > spawnTime:
		var new_fol = follower.instance()
		add_child(new_fol)
		spawnAmt += 1
		timer = 0
