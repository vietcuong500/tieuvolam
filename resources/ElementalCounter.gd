extends Node

class_name ElementalCouter

var element_couter_db = {
	"Wood": {
		"Metal": 2,
	},
	"Metal": {
		"Wood": 1
	}
}

func damage_converter(from, to):
	return element_couter_db.get(from).get(to)
