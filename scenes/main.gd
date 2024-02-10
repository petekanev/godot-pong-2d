extends Sprite2D

const PLAYER_PADDLE_SPEED: int = 500
const ENEMY_PADDLE_SPEED: int = PLAYER_PADDLE_SPEED

var player_score: int = 0
var enemy_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_timer_timeout():
	$Ball.show_ball()

	$Ball.reset_ball()


func reset_ball():
	$Ball.hide_ball()
	$GameTimer.start()


func _on_score_left_body_entered(body):
	enemy_score += 1
	
	$HUD/EnemyScoreLabel.text = str(enemy_score)
	reset_ball()


func _on_score_right_body_entered(body):
	player_score += 1

	$HUD/ScoreLabel.text = str(player_score)
	reset_ball()
