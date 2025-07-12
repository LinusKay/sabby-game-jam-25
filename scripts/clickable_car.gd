extends Clickable


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("clicked car")
		var car = get_parent().get_parent()
		if car.alarm_activated:
			car.alarm_activated = false
		else:
			car.alarm_activated = true
