extends Node

onready var player = $Player
onready var turret_spawner = $TurretsSpawner
onready var interface = $Interface
onready var star = $Star


var lives:int = 3

func _ready():
	randomize()
	interface.initialize(lives)

func hit():
	lives -= 1
	interface.update(lives)
	if lives <= 0:
		player.is_game_over()
		game_over()
		
		
func game_over():
	interface.game_over("Game over")
	
func game_won():
	interface.game_over("You won!")

func start_game():
	player.initialize(self)
	turret_spawner.initialize(self, player)
	player.start()
	star.initialize()
