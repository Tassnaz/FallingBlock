extends Node2D

@onready var BlockLoad = load("res://Scenes/block.tscn")

@onready var RandNr = RandomNumberGenerator.new()

var SimpleCountdownTimer

var SpawnNegX = -490
var SpawnPosX = 534
var SpawnPosY = -170

var RandX

@export var RespawnTime = 0.5

func _ready():
	SimpleCountdownTimer = RespawnTime

func generate_Randx():
	RandX = RandNr.randf_range(SpawnNegX, SpawnPosX)

func _physics_process(delta):
	if SimpleCountdownTimer >= 0:
		SimpleCountdownTimer = SimpleCountdownTimer -1 * delta
		
	else:
		
		generate_Randx()
		
		var NewBlock = BlockLoad.instantiate()
		
		NewBlock.position.x = RandX
		NewBlock.position.y = SpawnPosY
		
		add_child(NewBlock)
		
		SimpleCountdownTimer = RespawnTime
