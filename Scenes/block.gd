extends RigidBody2D

func _ready():
	freeze = true

func _physics_process(delta):
	if Input.is_action_just_pressed("Drop"):
		freeze = false
 
