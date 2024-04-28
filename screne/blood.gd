extends Node2D

class_name Bullet

var direction = Vector2(1, 0)
var speed = 250
var team: String
var player: CharacterBody2D

func _ready():
	set_as_top_level(true)
	if team == "blue":
		direction = Vector2(1, 0)
	else:
		direction = Vector2(-1, 0)

func _physics_process(delta):
	position += direction * speed * delta
