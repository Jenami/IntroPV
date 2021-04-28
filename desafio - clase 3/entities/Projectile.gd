extends Node2D

onready var timer = $Timer

export (float) var  speed

var direction:Vector2

func initialize(fire_direction:Vector2, initial_position:Vector2):
	global_position = initial_position
	direction = fire_direction
	
func _physics_process(delta):
	position +=  direction * speed * delta 


func _on_Timer_timeout():
	get_parent().remove_child(self)
	queue_free()
	
	

