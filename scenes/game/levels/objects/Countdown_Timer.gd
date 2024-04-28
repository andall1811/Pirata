extends Node

#@onready var label = $Label
@onready var timer = $Timer
@onready var dash = $"../HealthDashboard"

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.stop()
	timer.wait_time = 8
	timer.start()

func time_left_in_level():
	var seconds = (ceil)(timer.time_left)
	dash._update_timer(seconds)
	#var _time_left = timer.time_left
	#var seconds = ceil(_time_left)
	#return seconds
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
