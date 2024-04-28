extends TextureRect

@export var element: Element

# Called when the node enters the scene tree for the first time.
func _ready():
	var texture = element.icon
	self.texture = texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
