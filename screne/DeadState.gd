extends State

class_name DeadState

@onready var timer = $Timer

func enter():
	timer.start()
	owner.can_attack = false
	owner.speed = 0

func _on_timer_timeout():
	SignalBus.on_dead.emit(owner, owner.team)
	owner.queue_free()
