extends Sprite

var speed = 200 #Pixeles

onready var cannonArm = $Cannon_Arm

func initialize (projectile_container):
	cannonArm.container = projectile_container

func _physics_process(delta):
	
	var mouse_position:Vector2=get_local_mouse_position()
	#mouse_position - cannonArm.global_position
	cannonArm.rotation = mouse_position.normalized().angle()
	
	if Input.is_action_just_pressed("fire"): 
		cannonArm.fire()
		
	# Manera optimizada
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	

	position.x += direction_optimized * speed * delta
	
