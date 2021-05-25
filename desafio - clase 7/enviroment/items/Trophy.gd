extends Area2D

onready var win_bell_audio = $WinBellAudio

func _on_Trophy_body_entered(body):
	print("You win!")
	win_bell_audio.play()
	GameState.notify_level_won()
