extends Node2D

var direction = Vector2(1, 0)
var speed = 150

var team

func _ready():
	team = get_parent().team

func _physics_process(delta):
	position += direction * speed * delta
