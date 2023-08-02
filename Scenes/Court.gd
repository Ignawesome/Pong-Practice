extends Node2D

signal goal_signal



func _on_player_1_goal_body_entered(body):
	goal_signal.emit(2)
	print("goal 1")


func _on_player_2_goal_body_entered(body):
	goal_signal.emit(1)
	print("goal 2")
