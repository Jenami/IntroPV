extends Sprite

var friction_weight = 0.5
var velocity = Vector2.ZERO
var acceleration = 8
var h_speed_limit = 1000

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
	
	var h_movement_direction = direction_optimized
	
	if h_movement_direction != 0:
		velocity.x = clamp(velocity.x + (h_movement_direction * acceleration), -h_speed_limit, h_speed_limit)
	else:
		velocity.x = lerp(velocity.x, 0, friction_weight) 
		
	#cambio de posicion por funcion
	#position.x +=  direction_optimized * velocity.x * delta
	self.translate(velocity * delta)
	
