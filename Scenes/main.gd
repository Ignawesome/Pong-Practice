extends Node2D

var ball_scene = preload("res://Scenes/Actors/ball.tscn")
var player2_scene = preload("res://Scenes/Actors/player_2.tscn")
var player1_scene = preload("res://Scenes/Actors/player_1.tscn")


func _ready():
	$Court.goal_signal.connect(scored)
	$Score.restart_signal.connect(start_game)
	
	
func start_game():
	add_child(player1_scene.instantiate())
	add_child(player2_scene.instantiate())
	add_child(ball_scene.instantiate())

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func scored(player_scoring):
	print(player_scoring)
	await get_tree().create_timer(1).timeout
	$Score.increase_score(player_scoring)
	if $Score.player_1_score >= 10:
		end_game(1)
	elif $Score.player_2_score >= 10:
		end_game(2)
	else:
		add_child(ball_scene.instantiate(), true )
		
func end_game(player : int):
	$Player1.queue_free()
	$Player2.queue_free()
	$Ball.queue_free()
	$Score.show_end(player)
	
