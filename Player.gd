extends KinematicBody2D

class_name Player

export(NodePath) var ui_controller_path
onready var ui_controller : UIController = get_node(ui_controller_path)

export(NodePath) var turrets_path
onready var turrets : Node2D = get_node(turrets_path)

export(NodePath) var game_over_sound_path
onready var game_over_sound : AudioStreamPlayer = get_node(game_over_sound_path)

var speed : int = 30
var health : int = 10
var movement : Vector2

onready var animation : AnimatedSprite = $AnimatedSprite

func _ready():
	ui_controller.set_health(health)
	
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
	if health<=0:
		ui_controller.hide_health()
		ui_controller.game_over()
		game_over_sound.play()
		turrets.queue_free()
		queue_free()
	else:
		$HitSound.play()
		ui_controller.set_health(health)

