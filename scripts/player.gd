extends CharacterBody2D

var speed: float = 100
var accel: float = 10

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	
	velocity.x = move_toward(velocity.x, speed * dir.x, accel)
	velocity.y = move_toward(velocity.y, speed * dir.y, accel)
	
	move_and_slide()
