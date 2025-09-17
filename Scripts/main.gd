extends Node2D


@onready var BlockLoad = load("res://Scenes/block.tscn")

@onready var RandNr = RandomNumberGenerator.new()

var SimpleCountdownTimer

var SpawnNegX = -4070
var SpawnPosX = 4070
var SpawnPosY = -3000

var RandX

@export var RespawnTime = 0.5
@export var BlocksPerSpawn = 3

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	SimpleCountdownTimer = RespawnTime
	
	randomize()

func generate_Randx():
	RandX = RandNr.randf_range(SpawnNegX, SpawnPosX)

func _physics_process(delta):
	if SimpleCountdownTimer >= 0:
		SimpleCountdownTimer = SimpleCountdownTimer -1 * delta
		
	else:
		for i in range(BlocksPerSpawn):
			generate_Randx()
			
			var new_block = BlockLoad.instantiate()
			new_block.position = Vector2(RandX, SpawnPosY)
			add_child(new_block)
		
		SimpleCountdownTimer = RespawnTime
		
		
