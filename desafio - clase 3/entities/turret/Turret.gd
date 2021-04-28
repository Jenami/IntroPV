extends Sprite

onready var t_fire_position = $TurretFirePosition

var player_position

var container: Node
export (PackedScene) var t_projectile_scene:PackedScene

func initialize (projectile_container, the_player_position):
	
	container = projectile_container
	player_position = the_player_position
	
func _fire():
	var new_projectile =  t_projectile_scene.instance()
	container.add_child(new_projectile)
	new_projectile.initialize(
		(player_position.global_position - global_position).normalized(), 
		t_fire_position.global_position)
		
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
	#_fire()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#_fire
