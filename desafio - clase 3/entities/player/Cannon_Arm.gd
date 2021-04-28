extends Sprite

onready var fire_position = $FirePosition

var container: Node
export (PackedScene) var projectile_scene:PackedScene

func fire():
	var new_projectile =  projectile_scene.instance()
	container.add_child(new_projectile)
	new_projectile.initialize(
		(fire_position.global_position - global_position).normalized(), 
		fire_position.global_position)
		

