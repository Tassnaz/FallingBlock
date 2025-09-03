extends RigidBody2D

var can_click = false

func _ready():
	freeze = false
	
func _physics_process(delta):
	if Input.is_action_just_pressed("LeftClick") && can_click == true:
		queue_free()
	
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()

func _on_mouse_box_mouse_entered():
	can_click = true
	
func _on_mouse_box_mouse_exited():
	can_click = false
