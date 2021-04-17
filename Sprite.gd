extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (float) var speed: float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	
	var right:bool = Input.is_action_pressed("ui_right")
	var left:bool = Input.is_action_pressed("ui_left")
	
	if right:
		position.x += speed * delta;
	if left:
		position.x -= speed * delta;
	
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
