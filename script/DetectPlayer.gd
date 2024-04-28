extends Area2D

class_name DetectPlayer

@onready var detect: CollisionShape2D = $CollisionShapeDetect

func _ready():
	var team = owner.player.team
	var range = owner.player.range_type
	monitorable = false
	if team == "blue":
		self.set_collision_mask_value(4, true)
	else:
		self.set_collision_mask_value(2, true)
