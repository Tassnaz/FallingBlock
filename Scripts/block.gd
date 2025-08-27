extends CharacterBody2D

# Variables
var Gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var BlockStartPos = Vector2()
var CanDrop = false
@export var DropSpeed = 1
@export var MoveSpeed = 10

func _ready():
	# Gets the initial position
	BlockStartPos = self.position

func _physics_process(delta):
	# Makes it drop
	if Input.is_action_just_pressed("Drop"):
		CanDrop = true
	
	if CanDrop == true:
		velocity.y += Gravity * DropSpeed * delta
	
	# Reset and making block stay in place after
	if Input.is_action_just_pressed("Reset"):
		CanDrop = false
	
	if CanDrop == false:
		position.y = BlockStartPos
	
	
	
	move_and_slide()
