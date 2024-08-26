extends CharacterBody2D

var speed: float = 100
var accel: float = 10
var directions: Vector2

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	
	velocity.x = move_toward(velocity.x, speed * dir.x, accel)
	velocity.y = move_toward(velocity.y, speed * dir.y, accel)
	
	move_and_slide()

func _process(_delta: float) -> void:
	var dir: Vector2 = Input.get_vector("left", "right", "up", "down")
	player_anim(dir)
	

# Player animation logic seems junky to me, so animation are put separate
func player_anim(dir: Vector2) -> void:
	$AnimatedSprite2D.flip_h = false
	if dir.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk_side")
		directions = dir
	elif dir.x > 0:
		$AnimatedSprite2D.play("walk_side")
		directions = dir
	elif dir.y < 0:
		$AnimatedSprite2D.play("walk_back")
		directions = dir
	elif dir.y > 0:
		$AnimatedSprite2D.play("walk_front")
		directions = dir
	else:
		if directions.x < 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("idle_side")
		elif directions.x > 0:
			$AnimatedSprite2D.play("idle_side")
		elif directions.y < 0:
			$AnimatedSprite2D.play("idle_back")
		elif directions.y > 0:
			$AnimatedSprite2D.play("idle_front")
	
