extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var range = owner.player.range_type
	var box: RectangleShape2D = RectangleShape2D.new()
	if range == 'range':
		box.size.x = 800
	else:
		box.size.x = owner.player.attack_range
		self.position.x = owner.player.attack_range / 2 - 10
	box.size.y = 30
	self.shape = box


