extends Sprite

var speed = 200 #Pixeles
var friction_weight = 0.5
var velocity = Vector2.ZERO
var acceleration = 0.5

onready var cannonArm = $Cannon_Arm

func initialize (projectile_container):
	cannonArm.container = projectile_container

func _physics_process(delta):
	#position.x += direction * speed * delta
	
	var mouse_position:Vector2=get_local_mouse_position()
	#mouse_position - cannonArm.global_position
	cannonArm.rotation = mouse_position.normalized().angle()
	
	if Input.is_action_just_pressed("fire"): 
		cannonArm.fire()
		
	# Manera optimizada
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
		
	#if direction_optimized != 0:
	#	velocity.x = clamp(velocity.x + (direction_optimized * acceleration), -speed, speed)
	#else:
	#	velocity.x = lerp(velocity.x, 0, friction_weight) if abs(velocity.x) > 1 else 0
	
	position.x += direction_optimized * speed * delta
	
