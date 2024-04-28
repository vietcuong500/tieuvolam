extends HBoxContainer

@export var skills: Array = []
var spell_skill_scene = preload("res://spell_button.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.set_skills.connect(setup)
	for skill in skills:
		var instance = spell_skill_scene.instantiate()
		instance.name = skill
		add_child(instance)

func setup(list):
	for skill in list:
		var instance = spell_skill_scene.instantiate()
		instance.name = skill
		add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
