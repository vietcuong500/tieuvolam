extends Node

signal on_health_changed(node: Node, amount: int)

signal on_attack(source: Node, target: Node, amount: int)

signal on_dead(player: Node, team: String)

signal on_winner(team: String)

signal on_skill()

signal set_skills(list: Array)

signal calc_attack(from, to)
