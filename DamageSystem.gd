extends Node

class_name DamageSystem

@onready var elemental_counter: ElementalCouter = $ElementalCounter
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.calc_attack.connect(get_attack)
	pass


func get_attack(from: Character, to: Character):
	if from.team == "red":
		to.take_damage(Vector2(0 - from.knockback, 0))
	else:
		to.take_damage(Vector2(from.knockback, 0))
	var miss: float = float(to.avoid) / 100
	var damage_convert = from.damage * elemental_counter.damage_converter(from.character_stats.element.name, to.character_stats.element.name)
	if probability(miss):
		var damage_current = damage_convert - to.defense if damage_convert - to.defense >= 0 else 0
		to.damageable.hit(damage_current)
		if to.is_stack == true:
			to.element_reactions.push_back(from.character_stats.element.name)
			to.add_elements.emit(from.character_stats.element.name)
		SignalBus.on_health_changed.emit(to, "- {}".format([damage_current], "{}"))
	else:
		SignalBus.on_health_changed.emit(to, "Né")

func probability(n):
	return randf() < n
