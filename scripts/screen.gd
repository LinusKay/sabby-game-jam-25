extends Control

@export var scene_select: TextureRect
@onready var MenuSettings: PackedScene = preload("res://scenes/settings.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		var menu_settings = MenuSettings.instantiate()
		$SubViewportContainer/SubViewport.add_child(menu_settings)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	print("click Control")
