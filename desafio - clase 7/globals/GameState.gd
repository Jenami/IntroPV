extends Node

signal level_won()
signal game_over()

func notify_level_won():
	emit_signal("level_won")
	
func notify_game_over():
	emit_signal("game_over")
