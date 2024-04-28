extends TextureButton

@onready var progress_bar: TextureProgressBar = $TextureProgressBar
@onready var timer: Timer = $Timer
@onready var time: Label = $Time
@onready var key: Label = $Key
signal cast(spell_name)

@export var countdown_timer: int
 
var change_key = "":
	set(value):
		change_key = value
		key.text = value
 
		shortcut = Shortcut.new()
		var input_key = InputEventKey.new()
		input_key.keycode = value.unicode_at(0)
 
		shortcut.events = [input_key]
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = countdown_timer
	progress_bar.max_value = timer.wait_time
	set_process(false)

func _process(delta):
	time.text = "%3.1f" % timer.time_left
	progress_bar.value = timer.time_left



func _on_pressed():
	timer.start()
	disabled = true
	set_process(true)
	cast.emit(name)
	SignalBus.on_skill.emit(name)

func _on_timer_timeout():
	disabled = false
	time.text = ""
	set_process(false)
