extends Label

var time: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	var time = sin(time * .5) * 1
	#shadow_size
	label_settings.shadow_color = Color(time, time, time)
