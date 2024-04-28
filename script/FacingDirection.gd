extends Marker2D


@onready var raycastleft = $left
@onready var raycastright = $right



# Called when the node enters the scene tree for the first time.
func _ready():
	var team = owner.team
	if team == "blue":
		raycastleft.set_collision_mask_value(13, true)
		raycastleft.set_collision_mask_value(14, true)
		raycastleft.set_collision_mask_value(15, true)
		raycastleft.set_collision_mask_value(16, true)
		
		raycastright.set_collision_mask_value(13, true)
		raycastright.set_collision_mask_value(14, true)
		raycastright.set_collision_mask_value(15, true)
		raycastright.set_collision_mask_value(16, true)
	else:
		raycastleft.set_collision_mask_value(9, true)
		raycastleft.set_collision_mask_value(10, true)
		raycastleft.set_collision_mask_value(11, true)
		raycastleft.set_collision_mask_value(12, true)
		
		raycastright.set_collision_mask_value(9, true)
		raycastright.set_collision_mask_value(10, true)
		raycastright.set_collision_mask_value(11, true)
		raycastright.set_collision_mask_value(12, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
