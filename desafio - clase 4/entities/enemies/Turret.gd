extends StaticBody2D

onready var fire_position = $FirePosition
onready var fire_timer = $FireTimer

export (PackedScene) var projectile_scene

var player
var projectile_container

func initialize(container, turret_pos, player, projectile_container):
	
	container.add_child(self)
	show()
	global_position = turret_pos
	self.player = player
	self.projectile_container = projectile_container
	fire_timer.connect("timeout", self, "fire_at_player")
	fire_timer.start()

func fire_at_player():
	var proj_instance = projectile_scene.instance()
	proj_instance.initialize(
		projectile_container, 
		fire_position.global_position, 
		fire_position.global_position.direction_to(player.global_position),
		false)

func _on_Area2D_body_entered(body):
	if body.has_method("notify_hit"):
		fire_timer.start()
	
	
func _on_Area2D_body_exited(body):
	if body.has_method("notify_hit"):
		fire_timer.stop()
		
func notify_hit(is_player_projectile):
	if(is_player_projectile):
		projectile_container.remove_child(self)
		queue_free()
	else:
		fire_timer.stop()
	
