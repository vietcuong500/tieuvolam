extends Node2D

class_name Screen

var count_blue: int
var count_red: int

var team_win: String

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_dead.connect(dead)
	for child in get_children():
		if child is Character:
			if child.team == 'blue':
				count_blue += 1
			else:
				count_red += 1

func dead(player, team):
	if team == 'blue':
		count_blue -= 1
	else:
		count_red -= 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if count_blue == 0:
		team_win = 'red'
	if count_red == 0:
		team_win = 'blue'
	if count_blue == 0 || count_red == 0:
		SignalBus.on_winner.emit(team_win)
