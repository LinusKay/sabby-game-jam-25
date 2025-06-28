extends TextureRect

@export var scene: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(scene)
	var scene_camera = scene.get_node("SubViewport")
	texture = scene_camera.get_texture()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
