extends StaticBody2D

export(NodePath) var target_path
export(Resource) var bullet_scene

onready var fireDelay = rand_range(1.0, 2.0)

func _ready():
	_set_fire_timer()
	
func _on_fire() -> void:
	#var s = preload("res://Bullet.tscn")
	var bullet : Bullet = bullet_scene.instance()
	owner.add_child(bullet)
	bullet.direction = position.direction_to(get_node(target_path).position)
	bullet.modulate = Color.red
	bullet.global_position = global_position
	_set_fire_timer()
	
func _set_fire_timer() -> void:
	get_tree().create_timer(fireDelay).connect("timeout", self, "_on_fire")
