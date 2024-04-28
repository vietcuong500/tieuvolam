extends Node
class_name FiniteStateMachine

var current_state: State
var previous_state: State

@onready var character: CharacterBody2D = $".."
@onready var animation_tree: AnimationTree = $"../AnimationTree"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var label: Label = $"../Label"

var playback

func _ready():
	for child in get_children():
		if child is State:
			child.character = character
			child.state_machine = self
	current_state = get_child(0) as State
	previous_state = current_state
	current_state.enter()
	
func change_state(state):
	current_state = find_child(state) as State
	current_state.enter()
	previous_state.exit()
	previous_state = current_state

func update_animation():
	match current_state.name:
		"IdleState":
			animation_player.play("idle")
		"RunState":
			animation_player.play("run")
		"JumpState":
			animation_player.play("jump")
		"FallState":
			animation_player.play("jump")
		"AttackState": 
			animation_player.play("attack")
		"DeadState":
			animation_player.play("dead")
		"HurtState":
			animation_player.play("hurt")
		
			
func _physics_process(delta):
	update_animation()
	label.text = current_state.name


func _on_hitbox_area_entered(area):
	pass
