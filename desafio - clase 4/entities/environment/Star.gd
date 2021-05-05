extends Area2D

func initialize():
	show()

func _on_Star_body_entered(body):
	if body.has_method("star_touched"): 
		body.star_touched()
		hide()
