extends Sprite

onready var t_fire_position = $TurretFirePosition
onready var turretTimer = $TurretTimer

#var player_position:Vector2
var player

var container: Node

export (PackedScene) var t_projectile_scene:PackedScene

func initialize (projectile_container, the_player):
	container = projectile_container
	player = the_player
	turretTimer.start()
	
func _on_TurretTimer_timeout():
	_fire()
	
func _fire():
	var new_projectile =  t_projectile_scene.instance()
	container.add_child(new_projectile)
	new_projectile.initialize(
		(player.position - global_position).normalized(), 
		t_fire_position.global_position)
		
