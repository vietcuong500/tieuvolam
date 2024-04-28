extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var team = get_parent().team
	if team == "blue":
		self.set_collision_mask_value(4, true)
	else:
		self.set_collision_mask_value(2, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "Hurtbox":
		owner.queue_free()
