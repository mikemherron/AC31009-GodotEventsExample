extends Area2D

class_name Bullet

var speed = 40
var direction : Vector2

func _ready():
	connect("body_entered", self, "on_body_entered")
	
func _physics_process(delta):
	position += direction * speed * delta

func on_body_entered(body):
	if body is Player:
		body.hit()
		queue_free()
