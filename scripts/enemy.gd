extends CharacterBody2D

var speed: int = 60
var player_chase: bool = false
var player: Node2D = null

func _process(_delta: float) -> void:
	if player_chase:
		position += (player.position -position) / speed
		$AnimatedSprite2D.play("walk_front")
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle_front")
		
func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(_body: Node2D) -> void:
	player_chase = false
	player = null
