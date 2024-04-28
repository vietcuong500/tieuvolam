extends Node

class_name StatsCurrent

var damage: int
var defense: int
var avoid: int
var accurate: int
var health_regen: int
# Called when the node enters the scene tree for the first time.
func _ready():
	var init = owner.character_stats
	damage = init.atk
	defense = init.def
	avoid = init.avoid
	accurate = init.accurate
	health_regen = init.health_regen
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
