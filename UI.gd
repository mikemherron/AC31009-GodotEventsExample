extends Control

class_name UIController

onready var _label : Label = $Label
onready var _game_over : Label = $GameOver

func _ready():
	_game_over.hide()
	
func set_health(health : int) -> void:
	_label.text = "Health "	+ String(health)

func hide_health() -> void:
	_label.hide()

func game_over() -> void:
	_game_over.show()
