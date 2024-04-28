extends CharacterBody2D

class_name Character

@export var skill: PackedScene

#he thong tan cong
@export var speed: int
var speed_original = speed
@export var knockback: int = 150
@export var attack_range: int = 100
@export var attack_speed: float = 0.5

@export var character_stats: CharacterStats

var stats_current: StatsCurrent

var can_attack: bool = false
#thoi gian hoi chieu attack cơ ban
# = true: da hoi chieu xong, có the danh 
var is_cooldown: bool = true

const JUMP_VELOCITY = -400.0

@export var skills: Array[String] = []

@onready var state: StateChart = $StateChart
@export var bulletPath: PackedScene

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animation_tree = $AnimationTree
@onready var animation_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var pivot = $Pivot
@onready var damageable: Damageable = $Damageabled
@onready var element_rect_ui = $ElementRectContainer

@export var grow_up: PackedScene

@export var damage: int
@export var defense: int = 9
@export var avoid: int = 90
@export var accurate: int = 70
@export var health_regen: int = 5
@export var range_type: String
@export var team: String
@export var slot: int 
@export var range: int 

signal add_elements(name: String)
signal clear_elements

var element_reactions = []
# blue: 9 10 11 12
# red: 13 14 15 16

var max_health = 10
@export var health = 10
var knockback_vector: Vector2 = Vector2()
var facing_direction: String
var direction

@onready var stack_element_timer: Timer = $StackElement
var is_stack = true

var enemy

func fire(position, skill_name):
	var skill_fire = skill.instantiate()
	skill_fire.play(skill_name)
	skill_fire.position = position
	skill_fire.player = self
	skill_fire.team = 'blue' if team == 'red' else 'red'
	skill_fire.direction = Vector2.RIGHT if team == "blue" else Vector2.LEFT
	get_tree().current_scene.call_deferred("add_child", skill_fire)

func _ready():
	speed_original = speed
	self.set_collision_layer_value(slot, true)
	if team == "blue":
		facing_direction = "right"
		direction = 1
	else: 
		facing_direction = "left"
		direction = -1
	flip(facing_direction)

func _physics_process(delta):
	no_sat_thuong()
	if element_reactions.size() == 2:
		element_reactions = []
	velocity.x = direction * speed
	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector
	moving(delta)
	if health <= 0:
		state.send_event("to_dead")
	if can_attack == true and range_type == 'range':
		speed = 0
	if can_attack == true and is_cooldown == true:
		state.send_event("to_attack")
	else:
		pass
		#speed = 100

func moving(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
func flip(facing_direction):
	if facing_direction == "left":
		pivot.scale.x = -1
		collision_shape.scale.x = -1
		animation_sprite.flip_h = true
	else:
		pivot.scale.x = 1
		collision_shape.scale.x = 1
		animation_sprite.flip_h = false
	
		
func take_damage(knockback_force, duration = 0.3):
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		var knockback_tween = get_tree().create_tween()
		knockback_tween.tween_property(self, "knockback_vector", Vector2.ZERO, duration)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'hurt':
		state.send_event("to_run")
	if anim_name == 'attack':
		state.send_event("to_run")
	if anim_name == 'dead':
		queue_free()


func _on_dead_state_entered():
	speed = 0
	
func shoot():
	var bullet = bulletPath.instantiate()
	bullet.team = team
	bullet.player = self
	self.add_child(bullet)
	bullet.position = $BulletPosition.global_position
	
	
func attack_ranged():
	if range_type == 'range':
		if can_attack == true and is_cooldown == true:
			shoot()
			speed = 0


func _on_pivot_hurtbox_detech_hibox():
	state.send_event("to_hurt")
	
func no_sat_thuong():
	if element_reactions.size() == 2:
		var el1 = element_reactions[0]
		var el2 = element_reactions[1]
		if el1 == "Wood" and el2 == "Wood":
			health -= 50
			SignalBus.on_health_changed.emit(self, "- 50")
		if el1 == "Metal" and el2 == "Metal":
			health -= 30
			SignalBus.on_health_changed.emit(self, "- 30")
