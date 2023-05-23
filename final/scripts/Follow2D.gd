extends PathFollow2D

var runSpeed = 70

func _process(delta):
	set_offset(get_offset() + runSpeed * delta)
