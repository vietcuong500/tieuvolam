extends TextureRect

var element_name: String = "Metal"
# Called when the node enters the scene tree for the first time.
func _ready():
	var element: Element = load("res://core/Element/%sElement.tres" % element_name)
	self.texture = element.icon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
