extends KinematicBody

export var maxSpeed = 18
export var minSpeed = 10

var velocity = Vector3.ZERO

func _physics_process(_delta):
	move_and_slide(velocity)
	

