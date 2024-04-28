extends State

class_name HurtState

@onready var timer = $Timer
@export var raycastright: RayCast2D
@export var raycastleft: RayCast2D
@export var damageable: Damageable

func probability(n):
	return randf() < n

#
func _ready():
	SignalBus.on_attack.connect(attack_calc)

func attack_calc(source, target, damage, accurate):
	if target == owner:
		state_machine.change_state('HurtState')
		if character.team == "blue":
			take_damage(Vector2(0 - character.knockback, 0))
		else:
			take_damage(Vector2(character.knockback, 0))
		
		var miss: float = float(accurate) / character.avoid
		if probability(miss):
			var damage_current = damage - character.defense
			damageable.hit(damage_current)
			SignalBus.on_health_changed.emit(character, "- {}".format([damage_current], "{}"))
		else:
			SignalBus.on_health_changed.emit(character, "Miss")
	if owner.health <= 0:
		state_machine.change_state("DeadState")

func enter():
	pass
	#super()
	#timer.start()

		
func take_damage(knockback_force, duration = 0.3):
	if knockback_force != Vector2.ZERO:
		character.knockback_vector = knockback_force
		var knockback_tween = get_tree().create_tween()
		knockback_tween.tween_property(character, "knockback_vector", Vector2.ZERO, duration)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "hurt":
		state_machine.change_state("RunState")
