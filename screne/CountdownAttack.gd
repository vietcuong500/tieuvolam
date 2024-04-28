extends Timer

class_name CountdownAttack

func _ready():
	self.wait_time = owner.attack_speed

func set_expried():
	self.start()
	owner.is_cooldown = false

func _on_timeout():
	owner.is_cooldown = true

