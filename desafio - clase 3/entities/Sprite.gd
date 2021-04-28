extends Sprite
onready var timer = $Timer
var direction : Vector2

export (float) var  speed

func intialize(fire_direction:Vector2, initial_position:Vector2):
	global_position = initial_position
	direction = fire_direction
	timer.connect("timeout", self,  "_on_Timer_timeout")
	timer.start()	
func _physics_process(delta):
	position +=  direction * speed * delta 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
