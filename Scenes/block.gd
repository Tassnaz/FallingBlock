extends RigidBody2D

var BlockStartPos = Vector2()
var should_reset = false

func _ready():
	BlockStartPos = self.position
	freeze = true

func _physics_process(delta):
	if Input.is_action_just_pressed("Drop"):
		freeze = false
		
	if Input.is_action_just_pressed("Reset"):
		should_reset = true

func _integrate_forces(state):
	if should_reset:
		state.transform.origin = BlockStartPos
		state.linear_velocity = Vector2.ZERO
		state.angular_velocity = 0.0
		
		freeze = true
		
		should_reset = false
	
