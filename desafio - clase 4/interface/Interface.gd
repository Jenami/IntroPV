extends CanvasLayer

signal start_game

const text = "Lives: "

func initialize(nro):
	$Lives.text = text + str(nro)
	
func update(nro):
	if nro >= 0:
		$Lives.text = text + str(nro)
	

func show_message(msg):
	$Message.text = msg
	$Message.show()
	$MsgTimer.start()
	
func game_over(text):
	show_message(text)
	yield($MsgTimer, "timeout")
	$StartButton.show()

func _on_MsgTimer_timeout():
	$Message.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
