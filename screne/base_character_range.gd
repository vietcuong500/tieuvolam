extends CharacterBody2D


var speed = 300.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animation_tree = $AnimationTree
@onready var animation_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var pivot = $Pivot

@export var blood: PackedScene

@export var range_type: String
@export var team: String
@export var slot: int 
# blue: 9 10 11 12
# red: 13 14 15 16

var knockback_vector: Vector2 = Vector2()
var facing_direction: String
var direction
@export var damage: int

var can_attack: bool = false

@export var is_attack: bool = false


func _ready():
	self.set_collision_layer_value(slot, true)
	animation_tree.active = true
	if team == "blue":
		facing_direction = "right"
		direction = 1
	else: 
		facing_direction = "left"
		direction = -1
	flip(facing_direction)

func _physics_process(delta):
	# Add the gravity.
	
	velocity.x = direction * speed
	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector
		#shoot()
	moving(delta)
	

func moving(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	#animation_tree.set("parameters/moving/blend_position", velocity.x)
	
func flip(facing_direction):
	if facing_direction == "left":
		pivot.scale.x = -1
		collision_shape.scale.x = -1
		animation_sprite.flip_h = true
	else:
		pivot.scale.x = 1
		collision_shape.scale.x = 1
		animation_sprite.flip_h = false
		
func shoot():
	var bullet = blood.instantiate()
	bullet.team = team
	bullet.range_type = range_type
	bullet.character = self
	self.add_child(bullet)
	bullet.position = $Marker2D.global_position
	
