extends Window

var camera_name = "PLACEHOLDER"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title = "Camera - " + camera_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_requested() -> void:
	queue_free()

# Manually pass click to child SubViewportContainer
func _on_window_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print("click WindowCamera")
		$SubViewportContainer._on_gui_input(event)
