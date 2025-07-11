extends Clickable

var clicks = 0

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("clicked doorbell")
		var audio_player = get_parent().get_parent().get_node("DoorbellAudio")
		clicks += 1
		if clicks > 2: 
			audio_player.stream = preload("res://audio/sfx/doorbell2.ogg")
			clicks = 0
		audio_player.play()
