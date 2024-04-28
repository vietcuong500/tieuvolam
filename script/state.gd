extends Node
class_name State

var character : CharacterBody2D
var state_machine
var playback

var can_attack: bool = false

func _ready():
	set_physics_process(false)
	
func enter():
	set_physics_process(true)
	
func exit():
	set_physics_process(false)
	
func transition():
	pass

func _physics_process(delta):
	transition()
