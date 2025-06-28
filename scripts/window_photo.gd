extends Window

@export var photo: CompressedTexture2D
var file_name = "PLACEHOLDER"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title = "Photo - " + file_name
	$TextureRect.texture = photo


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_requested() -> void:
	queue_free()
