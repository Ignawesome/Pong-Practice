extends Player

func _ready():
	screen_size = get_viewport_rect().size
	player_no = 2
	position.x = screen_size.x - 70
	position.y = screen_size.y/2
