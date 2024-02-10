extends StaticBody2D

var win_height: int
var player_height: int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	player_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ball_position = $"../Ball".position
	
	var target_position = ball_position.y

	var speed_variance = randf_range(0.5, 1)

	var speed = get_parent().ENEMY_PADDLE_SPEED * delta * speed_variance

	# project the next position 
	position.y = move_toward(position.y, target_position, speed)
		
	position.y = clamp(position.y, player_height / 2, win_height - player_height / 2)
