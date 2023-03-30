extends Node

var playerScore = 0
var opponentScore = 0

func _on_Left_body_entered(body):
	opponentScore += 1
	score_achived()
	
func _on_Right_body_entered(body):
	playerScore += 1
	score_achived()
	
func _process(delta):
	$PlayerScore.text = str(playerScore)
	$OpponentScore.text = str(opponentScore)
	if $Ball.speed > 0:
		$CountdownLabel.text = ""
	else:
		$CountdownLabel.text = str(int($CountdownTimer.time_left)+1)
	
func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")

func score_achived():
	$Ball.position = Vector2(640,360)
	get_tree().call_group("BallGroup", "stop_ball")
	$CountdownTimer.start()
	$ScoreSound.play()
	$PLayer.position.y = (360)
	$PLayer.position.x = (45)
	$Opponent.position.y = (360)
	$Opponent.position.x = (1280 - 45)
