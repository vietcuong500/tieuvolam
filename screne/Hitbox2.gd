extends Area2D

func _ready():
	var team = get_parent().team
	
	if team == "blue":
		self.set_collision_layer_value(3, true)
	else:
		self.set_collision_layer_value(5, true)
