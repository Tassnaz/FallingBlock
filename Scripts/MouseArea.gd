extends Area2D

@export var follow_speed: float = 10.0

func _physics_process(delta):
	var target_pos = get_global_mouse_position()
	global_position = global_position.lerp(target_pos, delta * follow_speed)

func _on_body_entered(body):
	if body.is_in_group("blocks") and Input.is_action_pressed("LeftClick"):
		Global.Score += 1
		$"Score SFX".play(0.00)
		body.queue_free()
