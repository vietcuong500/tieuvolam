extends Node
class_name Damageable

@export var healthbar: HealthBar
@onready var timer = $Timer
		
func _ready():
	owner.max_health = owner.health
	timer.start()

func hit(damage):
	owner.health -= damage
	healthbar.update_healthbar(owner.health, owner.max_health)


func _on_timer_timeout():
	owner.health += owner.health_regen
	#SignalBus.on_health_changed.emit(owner, "+ {}".format([owner.health_regen], "{}"))
