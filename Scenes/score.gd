extends CanvasLayer

var player_1_score : int = 0
var player_2_score : int = 0

signal restart_signal

@onready var score_player_1 = $score_player1
@onready var score_player_2 = $score_player2

func _ready():
	$WinText.hide()

func increase_score(player):
	if player == 1:
		player_1_score += 1
		score_player_1.set_text(str(player_1_score))
	if player == 2:
		player_2_score += 1
		score_player_2.set_text(str(player_2_score))

func show_end(player):
	$WinText/WinTextLabel.set_text("[center]Player " + str(player) + " Wins!!!")
	$WinText.show()


func _on_play_again_button_pressed():
	restart_signal.emit()
	$WinText.hide()
	player_1_score = 0
	player_2_score = 0
	score_player_1.set_text(str(player_1_score))
	score_player_2.set_text(str(player_2_score))

