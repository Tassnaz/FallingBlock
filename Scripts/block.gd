extends RigidBody2D

var can_click = false


func _ready():
	
	add_to_group("blocks")
	
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
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()

func _on_mouse_box_mouse_entered():
	can_click = true
	
func _on_mouse_box_mouse_exited():
	can_click = false

# Deletes cube if not on screen for optimization
func _on_visible_on_screen_notifier_2d_screen_exited():
	Global.Score -= 1
	print("holy optimized")
	queue_free()
