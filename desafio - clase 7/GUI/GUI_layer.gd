extends CanvasLayer

const hearth_scene = preload("res://GUI/HearthTexture.tscn")

onready var fade_tween = $Fade/Tween
onready var fade = $Fade/ScreenCover
onready var hearths_container = $HearthsContainer
onready var win_label = $WinLabel
onready var restart_label = $RestartLabel

onready var blink_anim = $BlinkTextAnimation

func _ready():
	fade.color.a = 0
	fade.hide()
	win_label.hide()
	restart_label.hide()
	
	PlayerData.connect("max_health_updated", self, "_on_player_max_health_updated")
	PlayerData.connect("health_updated", self, "_on_player_health_updated")
	GameState.connect("level_won", self, "_on_level_won")
	GameState.connect("game_over", self, "_on_game_over")

func fade_to_black():
	fade.show()
	fade_tween.interpolate_property(fade, "color", fade.color, Color.black, 1)
	fade_tween.start()

func _reset_hearths():
	var children:Array = hearths_container.get_children()
	for child in children:
		hearths_container.remove_child(child)
		child.queue_free()

func _on_player_max_health_updated(amount:int, current_health:int):
	_reset_hearths()
	for i in amount:
		var new_hearth = hearth_scene.instance()
		hearths_container.add_child(new_hearth)
		new_hearth.id = i+1
	_on_player_health_updated(current_health, amount)


func _on_player_health_updated(amount:int, max_health:int):
	for hearth in hearths_container.get_children():
		hearth.update_hearth(amount, max_health)
	if amount <= 0:
		fade_to_black()


func _on_level_won():
	win_label.show()
	fade_to_black()
	restart_label.margin_top = 50
	show_restart("Press R to play again")
	
func _on_game_over():
	show_restart("Press R to restart")
	
func show_restart(message):
	restart_label.text = message
	restart_label.show()
	blink_anim.play("blink")
	
	
