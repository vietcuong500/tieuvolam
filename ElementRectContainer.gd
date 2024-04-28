extends HBoxContainer

var elements = []

@onready var timer: Timer = $"../Timer"

@export var element_rect: PackedScene
func _ready():
	for i in elements:
		var temp = element_rect.instantiate()
		temp.element_name = i
		temp.scale.x = 0.3
		temp.scale.y = 0.3
		self.add_child(temp)

func _on_child_order_changed():
	if get_children().size() == 2:
		timer.start()
		


func _on_timer_timeout():
	for i in get_children():
		i.queue_free()
