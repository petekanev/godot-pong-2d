extends CharacterBody2D

const SPEED = 5.0
const MAX_SPEED = 15
const ACCELERATION = 0.1
var direction = Vector2.ZERO
var win_size: Vector2
var current_speed: float

func _ready():
	win_size = get_viewport_rect().size
	current_speed = SPEED

func new_ball():
	direction.x = [-1, 1].pick_random()
	direction.y = [-1, 1].pick_random()
	position.x = win_size.x / 2
	position.y = win_size.y / 2
	
	# reset the ball speed
	current_speed = SPEED

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	var collission := move_and_collide(velocity)
	var collider: CollisionObject2D
	
	if collission:
		collider = collission.get_collider()
		
		direction = direction.bounce(collission.get_normal())
		current_speed += ACCELERATION
	
	if collider:
		print(collider)

	var speed = min(current_speed, MAX_SPEED)

	# no direction on ball spawn
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
		
		
	print(velocity)
	
