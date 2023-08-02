extends Player

func _ready():
	screen_size = get_viewport_rect().size
	player_no = 1
	position.x = 70
	position.y = screen_size.y/2
	
