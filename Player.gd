extends KinematicBody

# Player moving speed
export var speed = 14

# Gravity in meters per second square
export var gravity = 75

# Initial jump speed
export var jumpSpeed = 15

var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("MoveRight"):
		direction.x += 1
	if Input.is_action_pressed("MoveLeft"):
		direction.x -= 1
	if Input.is_action_pressed("MoveForward"):
		direction.z -= 1
	if Input.is_action_pressed("MoveBack"):
		direction.z += 1
	
	# Normalize and apply direction
	if direction != Vector3.ZERO:
		direction = direction.normalized();
		$Pivot.look_at(translation + direction, Vector3.UP)
		
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	if is_on_floor() and Input.is_action_pressed("Jump"):
		velocity.y += jumpSpeed
		
	velocity.y -= gravity * delta
	velocity = move_and_slide(
		velocity,
		Vector3.UP
	)
	
