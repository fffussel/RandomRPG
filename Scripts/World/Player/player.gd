extends CharacterBody2D

@onready var playerSprite: AnimatedSprite2D = $PlayerSprite

@export var stats: PlayerStats

var animDir: int = 0
var animWalk: bool = false


func _physics_process(delta: float) -> void:
	var  directionWE := Input.get_axis("worldSceneWalkWest", "worldSceneWalkEast")
	var  directionNS := Input.get_axis("worldSceneWalkNorth", "worldSceneWalkSouth")
	
	if directionWE:
		velocity.x = directionWE * stats.speed
		animWalk = true
		if directionWE > 0:
			animDir = 3
		if directionWE < 0:
			animDir = 1
	else:
		velocity.x = 0
	
	if directionNS:
		velocity.y = directionNS * stats.speed
		animWalk = true
		if directionNS > 0:
			animDir = 0
		if directionNS < 0:
			animDir = 2
	else:
		velocity.y = 0
		
	if directionNS == 0 && directionWE == 0:
		animWalk = false
	
	move_and_slide()

func _process(delta: float) -> void:
	animProcess()

func animProcess():
	var animName
	if animWalk:
		animName = "walk_"
	else:
		animName = "idle_"
	
	if animDir == 0:
		animName += "S"
	elif animDir == 1:
		animName += "E"
	elif animDir == 2:
		animName += "N"
	elif animDir == 3:
		animName += "W"
	
	playerSprite.play(animName)
