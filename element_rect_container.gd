extends Panel

@export var element_rect: PackedScene = preload("res://elemental_react.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_samurai_archer_add_elements(name):
	var temp = element_rect.instantiate()
	temp.element_name = name
	$ElementRectContainer.add_child(temp)
	
