extends CollisionShape3D

@onready var radio_cube = get_parent().get_parent()
@onready var audio_player = radio_cube.get_node("AudioStreamPlayer3D")
@onready var playback_pos = audio_player.get_playback_position()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(playback_pos)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("clicked radio")
		if audio_player.playing:
			playback_pos = audio_player.get_playback_position()
			audio_player.stop()
			radio_cube.material = null
		else:
			audio_player.play()
			audio_player.seek(playback_pos)
			radio_cube.material = preload("res://materials/cube_glow.tres")
			
			
func _on_area_3d_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_HELP)


func _on_area_3d_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
