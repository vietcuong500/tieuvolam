extends State

class_name AttackState
@onready var hitbox = $"../../Pivot/Hitbox"

signal on_shoot

func enter():
	super()
	


func exit():
	super()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":
		state_machine.change_state("RunState")
		
