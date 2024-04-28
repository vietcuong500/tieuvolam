extends Area2D

class_name HitboxSkill
var speed: float = 200
var direction: Vector2 = Vector2.RIGHT:
	set(value):
		direction = value

@export var team: String
@export var player: Character
# Called when the node enters the scene tree for the fist time.
func _ready():
	if team == "blue":
		self.set_collision_layer_value(5, true)
	else:
		self.set_collision_layer_value(3, true)

func _physics_process(delta):
	pass
	#position += speed * direction * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play(name):
	$AnimationPlayer.play(name)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_animated_sprite_2d_animation_finished():
	queue_free()


func _on_animation_player_animation_finished(anim_name):
	queue_free()
