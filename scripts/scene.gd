extends Node3D

@onready var camera = $SubViewport/Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enhance() -> void:
	print("enhance")
	camera.fov -= 25

func pullback() -> void:
	print("pull back")
	camera.fov += 25
	if camera.fov > 75: camera.fov = 75

func pan(direction: String) -> void:
	if direction == "right": camera.position.x += 1
	elif direction == "left": camera.position.x -= 1
	elif direction == "up": camera.position.y += 1
	elif direction == "down": camera.position.y -= 1
