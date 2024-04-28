extends Control

@export var skills = []

signal skills_list(list: Array)

@onready var skills_bar = $SkillsBar

# Called when the node enters the scene tree for the first time.
func _ready():
	skills_bar.skills = skills


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_script_changed():
	print("change", skills)


func _on_property_list_changed():
	print("change", skills)
