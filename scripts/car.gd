extends MeshInstance3D

var alarm_activated = false
@onready var headlight_left = $HeadlightLeft
@onready var headlight_right = $HeadlightRight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if alarm_activated and $AlarmTimer.is_stopped():
		$AlarmTimer.start()
		$AlarmTimer/AlarmFlashTimer.start()
		$AlarmAudio.play()


func _on_alarm_timer_timeout() -> void:
	$AlarmTimer.stop()
	alarm_activated = false
	$AlarmAudio.stop()
	headlight_left.hide()
	headlight_right.hide()


func _on_alarm_flash_timer_timeout() -> void:
	if alarm_activated:
		if headlight_left.visible:
			headlight_left.hide()
			headlight_right.hide()
		else:
			headlight_left.show()
			headlight_right.show()
