extends Node2D

var direction := 0.0
var radius := 100.0
var speed := 2.0


func _process(delta):
	direction += delta
	
	position = int($neg_direction.text) * Vector2(
		sin(direction * speed) * radius,
		cos(direction * speed)
	) + Vector2(200, int($offset.text))












