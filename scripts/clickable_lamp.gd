extends Clickable


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("clicked lamp")
		var lamp = get_parent().get_parent().get_node("OmniLight3D")
		if lamp.visible: lamp.hide()
		else: lamp.show()
