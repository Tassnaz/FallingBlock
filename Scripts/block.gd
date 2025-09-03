extends RigidBody2D

var can_click = false


func _ready():
	
	randomize()
	
	var colors = [
		Color(1, 0, 0),       # Red
		Color(1, 0.5, 0),     # Orange
		Color(1, 1, 0),       # Yellow
		Color(0, 1, 0),       # Green
		Color(0, 0, 1),       # Blue
	]
	
	modulate = colors.pick_random()
	
	freeze = false
	
func _physics_process(delta):
	
	
	
	if Input.is_action_just_pressed("LeftClick") && can_click == true:
		queue_free()
	
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
	
	#print(global_position)

func _on_mouse_box_mouse_entered():
	can_click = true
	
func _on_mouse_box_mouse_exited():
	can_click = false
