extends Label

@export var float_speed: Vector2 = Vector2(0, -50)
@onready var timer: Timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += float_speed * delta



func _on_timer_timeout():
	queue_free()
