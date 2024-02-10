extends Sprite2D

var score := 0 # player score
const PADDLE_SPEED: int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_timer_timeout():
	$Ball.new_ball()


func _on_score_left_body_entered(body):
	$HUD/ScoreLabel.text = str(int($HUD/ScoreLabel.text) - 1)
	
	if $BallTimer.is_stopped:
		$BallTimer.start()
