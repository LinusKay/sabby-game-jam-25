extends Window

@onready var WindowNotepad: PackedScene = preload("res://scenes/windows/window_notepad.tscn")
@onready var WindowPhoto: PackedScene = preload("res://scenes/windows/window_photo.tscn")

var directory_name = "PLACEHOLDER"
var files = [
		{
			"name": "PLACEHOLDER",
			"type": "txt",
			"content": "U SHOULD NOT B SEEING THIS"
		}
	]

var icon_atlas = preload("res://sprites/image-tango-feet.png")

var icon_file = AtlasTexture.new()
var icon_back = AtlasTexture.new()
var icon_img = AtlasTexture.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title = "Directory List -" + directory_name + " [Read Only]"
	
	icon_back.atlas = icon_atlas
	icon_back.region = Rect2(561, 232, 16, 16)
	
	icon_file.atlas = icon_atlas
	icon_file.region = Rect2(226, 232, 16, 16)
	
	icon_img.atlas = icon_atlas
	icon_img.region = Rect2(57, 256, 16, 16)
	
	
	for file in files:
		var icon = icon_file
		if file.type == "img": icon = icon_img
		else: icon = icon_file
		var file_name = file.name + "." + file.type
		$DirectoryList.add_item(file_name, icon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_requested() -> void:
	queue_free()


func _on_directory_list_item_activated(index: int) -> void:
	#Artificial lag
	await get_tree().create_timer(randf_range(0.0, 0.1)).timeout
	var item_type = files[index].type
	
	if item_type == "txt":
		var window_notepad = WindowNotepad.instantiate()
		window_notepad.content = files[index].content
		window_notepad.file_name = files[index].name + "." + files[index].type
		window_notepad.initial_position = WINDOW_INITIAL_POSITION_CENTER_MAIN_WINDOW_SCREEN
		add_child(window_notepad)
		
	elif item_type == "img":
		var window_photo = WindowPhoto.instantiate()
		window_photo.photo = files[index].photo
		window_photo.file_name = files[index].name + "." + files[index].type
		window_photo.initial_position = WINDOW_INITIAL_POSITION_CENTER_MAIN_WINDOW_SCREEN
		add_child(window_photo)
