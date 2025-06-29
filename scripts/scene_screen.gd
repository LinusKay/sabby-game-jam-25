extends TextureRect

@export var scene: Node3D

var ray_from_world : Vector3
var ray_to_world : Vector3
var object_under_cursor : Node3D = null
var scene_subviewport: SubViewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#scene_subviewport = scene.get_node("SubViewport")
	#texture = scene_subviewport.get_texture()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("clicked SceneScreen")
