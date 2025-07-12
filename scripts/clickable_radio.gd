extends Clickable

@onready var desktop_icons_connect = get_tree().current_scene.get_node("SubViewportContainer/SubViewport/DesktopIconConnect")
@onready var radio_cube = get_parent().get_parent()
@onready var audio_player = radio_cube.get_node("AudioStreamPlayer3D")
@onready var playback_pos = audio_player.get_playback_position()

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if audio_player.playing:
			playback_pos = audio_player.get_playback_position()
			audio_player.stop()
			radio_cube.material = null
			desktop_icons_connect.set_item_disabled(1, true)
		else:
			audio_player.play()
			audio_player.seek(playback_pos)
			radio_cube.material = preload("res://materials/cube_glow.tres")
			desktop_icons_connect.set_item_disabled(1, false)
