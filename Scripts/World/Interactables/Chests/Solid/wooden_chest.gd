extends Node2D

@export var res: ChestResource
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	if res.wasOpened:
		animated_sprite_2d.animation = res.animNameClosed
	else :
		animated_sprite_2d.animation = res.animNameClosed
