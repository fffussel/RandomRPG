extends CharacterBody2D


const SPEED = 100


func _physics_process(delta: float) -> void:
	var  directionWE := Input.get_axis("worldSceneWalkWest", "worldSceneWalkEast")
	var  directionNS := Input.get_axis("worldSceneWalkNorth", "worldSceneWalkSouth")
	
	if directionWE:
		velocity.x = directionWE * SPEED
	else:
		velocity.x = 0
	
	if directionNS:
		velocity.y = directionNS * SPEED
	else:
		velocity.y = 0
	
	move_and_slide()
