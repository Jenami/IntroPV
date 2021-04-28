extends Node

onready var  player = $Player
onready var turret = $Turret

export (Vector2) var turret1:Vector2
export (Vector2) var turret2:Vector2
export (Vector2) var turret3:Vector2

export (PackedScene) var turret_scene:PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	player.initialize(self)
	
	var positions= []
	positions.append(turret1)
	positions.append(turret2)
	positions.append(turret3)
	
	for i in range (0, 2):
		var turretScene = turret_scene.instance()
		turretScene.position.x = positions[i].x;
		turretScene.position.y = positions[i].y;
		add_child(turretScene)
		turret.initialize(self, player.position)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
