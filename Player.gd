extends KinematicBody2D

signal player_hit

class_name Player

var speed : int = 30
var health : int = 10
var movement : Vector2

onready var animation : AnimatedSprite = $AnimatedSprite

	
func _process(delta):
	var last_movement : Vector2 = movement
	movement = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		movement.y=-1
	if Input.is_action_pressed("ui_down"):
		movement.y=1
	if Input.is_action_pressed("ui_left"):
		movement.x=-1
	if Input.is_action_pressed("ui_right"):
		movement.x=1
	movement = movement.normalized()
	if movement != last_movement:
		_update_animation()
	move_and_slide(movement * speed)

func _update_animation() -> void:
	if movement.y > 0:
		animation.play("down")
	elif movement.y < 0:
		animation.play("up")
	elif movement.x > 0:
		animation.play("right")
	elif movement.x < 0:
		animation.play("left")
	else:
		animation.play("idle")

func hit() -> void:
	health-=1
	emit_signal("player_hit", health)
	if health>0:
		$HitSound.play()

