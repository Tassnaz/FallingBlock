extends Node

var Score = 0

func _physics_process(delta):
	if Input.is_action_just_pressed("Reset"):
		Score = 0
		
	if Score <= 0:
		Score = 0
