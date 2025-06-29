extends CollisionShape3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("clicked car")
		var car = get_parent().get_parent()
		if car.alarm_activated:
			car.alarm_activated = false
		else:
			car.alarm_activated = true
		#var headlight_left = get_parent().get_parent().get_node("HeadlightLeft")
		#var headlight_right = get_parent().get_parent().get_node("HeadlightRight")
		#if headlight_left.visible:
			#headlight_left.hide()
			#headlight_right.hide()
		#else:
			#headlight_left.show()
			#headlight_right.show()


func _on_area_3d_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_HELP)


func _on_area_3d_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
