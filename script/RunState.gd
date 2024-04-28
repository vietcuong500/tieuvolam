extends State

class_name RunState

func _ready():
	SignalBus.on_winner.connect(winner)
	
func winner(team):
	if team == owner.team:
		owner.speed = 0
		

func transition():
	if character.velocity.x == 0:
		state_machine.change_state("IdleState")
	elif owner.can_attack:
		state_machine.change_state("AttackState")
		
func enter():
	super()
	character.speed = 100


func _on_detect_player_area_entered(area):
	owner.can_attack = true


func _on_detect_player_area_exited(area):
	owner.can_attack = false


func _on_hurtbox_area_entered(area):
	SignalBus.on_attack.emit(owner, area.owner, owner.damage, owner.accurate)
