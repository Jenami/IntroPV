extends KinematicBody2D

onready var cannon = $Cannon

export (float) var ACCELERATION:float = 20.0
export (float) var H_SPEED_LIMIT:float = 600.0
export (float) var FRICTION_WEIGHT:float = 0.1
export (float) var gravity:float = 10
export (float) var jump_speed:float = 500
const FLOOR_NORMAL := Vector2.UP  # Igual a Vector2(0, -1)
const SNAP_DIRECTION := Vector2.UP
const SNAP_LENGHT := 32.0
const SLOPE_THRESHOLD := deg2rad(46)

var velocity:Vector2 = Vector2.ZERO
var snap_vector:Vector2 = SNAP_DIRECTION * SNAP_LENGHT
var projectile_container

var game_over = true
var init_position

func _ready():
	hide()
	add_to_group("player")
	init_position = position
	
func initialize(projectile_container):
	self.projectile_container = projectile_container
	cannon.projectile_container = projectile_container
	

func _physics_process(delta):
	if(! game_over):
	
		# Cannon rotation
		var mouse_position:Vector2 = get_global_mouse_position()
		cannon.look_at(mouse_position)
		
		# Cannon fire
		if Input.is_action_just_pressed("fire_cannon"):
			if projectile_container == null:
				projectile_container = get_parent()
				cannon.projectile_container = projectile_container
			cannon.fire()
		
		# Player movement
		var h_movement_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
		
		if h_movement_direction != 0:
			velocity.x = clamp(velocity.x + (h_movement_direction * ACCELERATION), -H_SPEED_LIMIT, H_SPEED_LIMIT)
		else:
			velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0
			
		velocity.y += gravity

		velocity = move_and_slide(velocity, FLOOR_NORMAL)

		if(Input.is_action_pressed("ui_up") && is_on_floor()): 
			velocity.y -= jump_speed
		
#Ends game
func notify_hit(is_player_hit):
	if(!is_player_hit):
		projectile_container.hit()
		
func is_game_over():
	hide()
	position = init_position
	game_over = true

func star_touched():
	projectile_container.game_won()
	is_game_over()

func start():
	show()
	game_over = false
	

	
