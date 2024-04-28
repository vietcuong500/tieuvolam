extends State

class_name IdleState

func transition():
	# && character.knockback_vector == Vector2.ZERO
	if character.velocity.x != 0:
		state_machine.change_state("RunState")
#	elif owner.can_attack:
#		state_machine.change_state("AttackState")
