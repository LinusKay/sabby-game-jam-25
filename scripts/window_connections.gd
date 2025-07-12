extends Window


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_requested() -> void:
	var desktop_icons_connect = get_tree().current_scene.get_node("SubViewportContainer/SubViewport/DesktopIconConnect")
	desktop_icons_connect.connections_open = false
	desktop_icons_connect.set_item_disabled(0, false)
	queue_free()
