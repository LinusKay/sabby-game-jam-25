extends ItemList

@onready var icon_atlas_tex: CompressedTexture2D = preload("res://sprites/image-tango-feet.png")
@onready var WindowDirectoryList: PackedScene = preload("res://scenes/windows/window_directory_list.tscn")
@onready var WindowCamera: PackedScene = preload("res://scenes/windows/window_camera.tscn")
@onready var WindowPassword: PackedScene = preload("res://scenes/windows/window_password.tscn")

var icon_pc_online = AtlasTexture.new()
var icon_pc_offline = AtlasTexture.new()
var icon_directory = AtlasTexture.new()
var icon_camera = AtlasTexture.new()

var items = [
	{
		"name": "PC-1",
		"type": "computer",
		"icon": icon_pc_offline,
		"action": "Connect to PC-1",
		"online": false,
		"visible": true
	},
	{
		"name": "fs23590",
		"type": "directory",
		"icon": icon_directory,
		"action": "Connect to fs23590",
		"password": "cr0codile",
		"files": [
			{
				"name": "file_1",
				"type": "txt",
				"content": "\"the storm which brewed on the horizon spat and flicked its many tongues with a rabid ferocity. cowering, awe-struck, horrified. from the ground the behemoth looming before us, towering above us, showered us with the feeling of a grand insignificance.\""
			},
			{
				"name": "PASSWORDS",
				"type": "txt",
				"content": "hunter\ncr0c0dile"
			},
			{
				"name": "sfgsdf",
				"type": "img",
				"photo": preload("res://sprites/Photo_2022-09-12_214526.png")
			},
			{
				"name": "stolk3",
				"type": "img",
				"photo": preload("res://sprites/stolk3.png")
			},
			{
				"name": "face",
				"type": "img",
				"photo": preload("res://sprites/hbfjghbjsd.jpg")
			},
		],
		"visible": true
	},
	{
		"name": "DVRS-iCam",
		"type": "camera",
		"icon": icon_camera,
		"action": "Connect to DVRS-iCam",
		"scene": preload("res://scenes/scene_street.tscn"),
		"visible": true
	},
	{
		"name": "ProView-84fh7236",
		"type": "camera",
		"icon": icon_camera,
		"action": "Connect to ProView-84fh7236",
		"scene": preload("res://scenes/scene_doorbell.tscn"),
		"visible": true
	},
	{
		"name": "TrailNE-CAM1",
		"type": "camera",
		"icon": icon_camera,
		"action": "Connect to TrailNE-CAM1",
		"scene": preload("res://scenes/scene_trailcam.tscn"),
		"visible": true
	},
	{
		"name": "HOME-CAM",
		"type": "camera",
		"icon": icon_camera,
		"action": "Connect to HOME-CAM",
		"scene": preload("res://scenes/scene_webcam.tscn"),
		"visible": true
	},
	{
		"name": "2dtest",
		"type": "camera",
		"icon": icon_camera,
		"action": "Connect to HOME-CAM",
		"scene": preload("res://scenes/scene_2dtest.tscn"),
		"visible": true
	},
	{
		"name": "qrleft",
		"type": "camera",
		"icon": icon_camera,
		"action": "Connect to qrleft",
		"scene": preload("res://scenes/scene_qrleft.tscn"),
		"visible": true
	},
	{
		"name": "qrright",
		"type": "camera",
		"icon": icon_camera,
		"action": "Connect to qrright",
		"scene": preload("res://scenes/scene_qrright.tscn"),
		"visible": true
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
	
	render_items()

func render_items() -> void:
	clear()
	for item in items:
		if item.visible:
			if item.type == "computer":
				if item.online:
					add_item(item.name, item.icon)
				else:
					add_item(item.name, item.icon, false)
			else: 
				add_item(item.name, item.icon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		print("reload")
		#items[0].visible = true
		render_items()


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
			var window_camera_subviewport = window_camera.get_node("SubViewportContainer/SubViewport")
			window_camera_subviewport.add_child(camera_scene)
			get_parent().add_child(window_camera)
			
		elif item_type == "directory":
			var directory_password = items[get_selected_items()[0]].password
			var directory_name = items[get_selected_items()[0]].name
			if directory_password != null:
				var window_password = WindowPassword.instantiate()
				window_password.password = directory_password
				window_password.title = "Locked: " + directory_name
				get_parent().add_child(window_password)
				var result = await window_password.password_result
				if result == false:
					return
					
			var directory_files = items[get_selected_items()[0]].files
			var window_directory_list = WindowDirectoryList.instantiate()
			window_directory_list.files = directory_files
			window_directory_list.directory_name = directory_name
			window_directory_list.initial_position = 2
			get_parent().add_child(window_directory_list)
