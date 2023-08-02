extends RigidBody2D

@export var ball_speed = 300
var ball_velocity : Vector2
@onready var screen_size = get_viewport_rect().size
var impact


func _ready():
	position = screen_size/2
	ball_velocity.x = randf_range(-1, 1)
	ball_velocity.y = randf_range(-0.3, 0.3)
	
func _process(delta):
	impact = move_and_collide(ball_velocity.normalized() * ball_speed * delta)
	if impact:
		var collision_body = impact.get_collider()
		if collision_body.is_in_group("Bouncy"):
			var n = impact.get_normal()
			ball_velocity = ball_velocity.bounce(n)
		if collision_body.is_in_group("Player"):
			ball_speed *= 1.1
	
