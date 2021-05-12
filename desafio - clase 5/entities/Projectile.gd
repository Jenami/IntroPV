extends Sprite

onready var lifetime_timer = $LifetimeTimer
onready var hitbox = $Hitbox
onready var animTurretProj = $AnimationTurretProjectile
onready var animPlayerProj = $AnimationPlayerProjectile

export (float) var VELOCITY:float = 800.0

var direction:Vector2
var _turret = null

var is_player_projectile = false

func initialize(container, spawn_position:Vector2, direction:Vector2, isplayerprojectile):
	container.add_child(self)
	self.direction = direction
	global_position = spawn_position
	lifetime_timer.connect("timeout", self, "_on_lifetime_timer_timeout")
	lifetime_timer.start()
	is_player_projectile = isplayerprojectile
	_play_animation()

func _physics_process(delta):
	position += direction * VELOCITY * delta

func _on_lifetime_timer_timeout():
	if(is_player_projectile && animPlayerProj.is_playing()):
		animPlayerProj.stop()
	elif (_turret && animTurretProj.is_playing()):
		animTurretProj.stop()
	call_deferred("_remove")

func _remove():
	get_parent().remove_child(self)
	queue_free()
	
func _play_animation():
	
	_turret = get_node("Turret")
	if(is_player_projectile):
		animPlayerProj.play("roll fish")
	else:
		if _turret:
			animTurretProj.play("hairball")

func _on_Hitbox_body_entered(body):
	if body.has_method("notify_hit"):
		body.notify_hit()
	hitbox.collision_mask = 0
	call_deferred("_remove")

