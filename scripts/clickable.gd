class_name Clickable
extends Node

func _on_area_3d_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_HELP)


func _on_area_3d_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
