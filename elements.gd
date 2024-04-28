extends Resource
class_name Element

@export_category("Element")
@export var icon: Texture2D
@export_enum("Metal", "Wood", "Water", "Fire", "Earth", "Ice", "Electro", "Ice", "Wind")
var name: String = "Metal"

signal element_used

func use_element():
	element_used.emit()
	
