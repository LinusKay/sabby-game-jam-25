extends ItemList

@onready var icon_atlas_tex: CompressedTexture2D = preload("res://sprites/image-tango-feet.png")
@onready var WindowDirectoryList: PackedScene = preload("res://scenes/windows/window_directory_list.tscn")
@onready var WindowCamera: PackedScene = preload("res://scenes/windows/window_camera.tscn")

var icon_pc_online = AtlasTexture.new()
var icon_pc_offline = AtlasTexture.new()
var icon_directory = AtlasTexture.new()
var icon_camera = AtlasTexture.new()

var items = [
	{
		"name": "PC-1",
		"type": "computer",
		"icon": icon_pc_online,
		"action": "connect to PC-1",
		"online": true
	},
	{
		"name": "DESKTOP-A9F45",
		"type": "computer",
		"icon": icon_pc_offline,
		"action": "connect to DESKTOP-A9F45",
		"online": false
	},
	{
		"name": "fs23590",
		"type": "directory",
		"icon": icon_directory,
		"action": "connect to fs23590",
		"files": [
			{
				"name": "file_1",
				"type": "txt",
				"content": "This is a text file :3"
			},
			{
				"name": "PASSWORDS",
				"type": "txt",
				"content": "hunter\ncr0c0dile"
			},
			{
				"name": "Holiday",
				"type": "img",
				"photo": preload("res://sprites/sunday.jpg")
			}
		],
	},
	{
		"name": "DVRS-iCam",
		"type": "camera",
		"icon": icon_camera,
		"action": "connect to DVRS-iCam",
		"scene": preload("res://scenes/scene_street.tscn")
	},
	{
		"name": "ProView-84fh7236",
		"type": "camera",
		"icon": icon_camera,
		"action": "connect to DVRS-iCam",
		"scene": preload("res://scenes/scene_doorbell.tscn")
	},
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon_pc_online.atlas = icon_atlas_tex
	icon_pc_online.region = Rect2(225, 280, 16, 16)
	icon_pc_offline.atlas = icon_atlas_tex
	icon_pc_offline.region = Rect2(249, 280, 16, 16)
	icon_directory.atlas = icon_atlas_tex
	icon_directory.region = Rect2(57, 232, 16, 16)
	icon_camera.atlas = icon_atlas_tex
	icon_camera.region = Rect2(57, 184, 16, 16)
	
	clear()
	for item in items:
		if item.type == "computer":
			if item.online:
				add_item(item.name, item.icon)
			else:
				add_item(item.name, item.icon, false)
		else: 
			add_item(item.name, item.icon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_activated(index: int) -> void:
	if get_selected_items().size() > 0:
		#Artificial lag
		await get_tree().create_timer(randf_range(0.1, 0.3)).timeout
		
		var item_type = items[get_selected_items()[0]].type
		
		if item_type == "computer":
			print("gombudor")
		
		elif item_type == "camera":
			var camera_name = items[get_selected_items()[0]].name
			var camera_scene = items[get_selected_items()[0]].scene.instantiate()
			var window_camera = WindowCamera.instantiate()
			window_camera.camera_name = camera_name
			window_camera.add_child(camera_scene)
			var scene_screen = window_camera.get_node("SubViewportContainer/SubViewport/SceneScreen")
			scene_screen.scene = window_camera.get_node("Scene")
			get_parent().add_child(window_camera)
			
		elif item_type == "directory":
			var directory_files = items[get_selected_items()[0]].files
			var directory_name = items[get_selected_items()[0]].name
			var window_directory_list = WindowDirectoryList.instantiate()
			window_directory_list.files = directory_files
			window_directory_list.directory_name = directory_name
			window_directory_list.initial_position = 2
			get_parent().add_child(window_directory_list)
