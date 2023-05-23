extends Node2D

var direction := 0.0
var radius := 100.0
var speed := 2.0

var delay # default

func _process(delta):
	direction +=  delta
	
	# up and down
	position = int($neg_direction.text) * Vector2(
		sin(direction * speed) + radius,
		cos(direction * speed) * radius
	) + Vector2(int($offset.text), 200)












