extends Node2D


@onready var BlockLoad = load("res://Scenes/block.tscn")

@onready var RandNr = RandomNumberGenerator.new()

var SimpleCountdownTimer

var SpawnNegX = -490
var SpawnPosX = 534
var SpawnPosY = -170

var RandX

@export var RespawnTime = 0.5
@export var BlocksPerSpawn = 3

func _ready():
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
		
		
