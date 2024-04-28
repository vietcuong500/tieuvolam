extends Marker2D

#rule
#detech = attack_range
#position x xdetech = detect / 2 - 10
#hibox = detect - 20

@onready var hitbox: Area2D = $Hitbox
@export var player: CharacterBody2D

signal hurtbox_detech_hibox

func disabled_monitorable():
	if player.range_type == 'melee':
		hitbox.monitorable = false
func enabled_monitorable():
	if player.range_type == 'melee':
		hitbox.monitorable = true

func _process(delta):
	for i in $DetectPlayer.get_overlapping_areas():
		if i.name == 'Hurtbox' and player.is_cooldown == true:
			player.can_attack = true


func _on_child_entered_tree(node):
	pass


func _on_detect_player_area_entered(area):
	if player.is_cooldown == true:
		player.can_attack = true

func _on_detect_player_area_exited(area):
	if player.range_type == 'range':
		player.state.send_event("to_run")
		player.speed = player.speed_original
	player.can_attack = false



func _on_hurtbox_hitbox_detect():
	hurtbox_detech_hibox.emit()
