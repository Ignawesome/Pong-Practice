extends RigidBody2D
class_name Player

@export var speed = 600
var screen_size : Vector2
var player_no : int

func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)
	
	
func _process(delta):
	var direction = Vector2.ZERO
	if player_no == 1:
		if Input.is_action_pressed("move_up_1"):
			direction.y -= 1
		if Input.is_action_pressed("move_down_1"):
			direction.y += 1
	if player_no == 2:
		if Input.is_action_pressed("move_up_2"):
			direction.y -= 1
		if Input.is_action_pressed("move_down_2"):
			direction.y += 1
	position += direction * speed * delta
	position.y = clamp(global_position.y, 50, screen_size.y-50)
	
