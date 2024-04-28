extends Area2D

class_name Hurtbox

signal hitbox_detect

func _ready():
	var team = owner.player.team
	if team == "blue":
		self.set_collision_layer_value(2, true)
		self.set_collision_mask_value(5, true)
	else:
		self.set_collision_layer_value(4, true)
		self.set_collision_mask_value(3, true)

func _on_area_entered(area):
	var source;
	if area.name == 'Skill':
		source = area.player
	else:
		source = area.owner.player
	var target = owner.player
	hitbox_detect.emit()
	SignalBus.calc_attack.emit(source, target)
