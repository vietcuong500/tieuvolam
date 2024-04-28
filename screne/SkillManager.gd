extends Node

var list_character: Array = []
var blue_team: Array[Character] = []
var red_team: Array[Character] = []
var skills : Array[String] = []

@onready var action_bar = $ActionBar
# Called when the node enters the scene tree for the first time.

func clean(dirty_array: Array) -> Array:
	var clean_array := []
	for item in dirty_array:
		if is_instance_valid(item):
			clean_array.append(item)
	return clean_array

func _ready():
	SignalBus.on_skill.connect(attack_skill)
	var characters = owner.get_children()
	for character in characters:
		if character is Character:
			#skills.push_back(character.skills[0])
			if character.team == 'blue':
				blue_team.push_back(character)
			else:
				red_team.push_back(character)
			list_character.push_back(character)
	action_bar.skills = skills
	SignalBus.set_skills.emit(skills)

func attack_skill(name):
	var list_clean = clean(list_character)
	var char_attack = list_clean.map(func(el): return el.name)
	var player1_id = char_attack.find('Player1')
	var player1 = list_character[player1_id]
	var team_curr = player1.team
	var char_team_op = blue_team if team_curr == 'red' else red_team
	var char_op_position = char_team_op[0].global_position
	player1.fire(char_op_position, name)


func _on_action_bar_skills_list(list):
	pass # Replace with function body.
