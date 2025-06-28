extends Window

var file_name = "PLACEHOLDER"
var content = "PLACEHOLDER - U SHOULD NT BE SEOING THIS.>! "

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title = "Notepad - " + file_name + "[Read Only]"
	$NotepadContent.text = content


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_requested() -> void:
	queue_free()
