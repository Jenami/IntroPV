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
		
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
