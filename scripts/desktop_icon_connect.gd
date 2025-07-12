extends ItemList

@onready var WindowConnections = preload("res://scenes/windows/window_connections.tscn")
@onready var MenuSettings = preload("res://scenes/settings.tscn")

var connections_open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_activated(index: int) -> void:
	if index == 0:
		if !connections_open:
			var window_connections = WindowConnections.instantiate()
			get_parent().add_child(window_connections)
			connections_open = true
			set_item_disabled(0, true)
	elif index == 2:
		var menu_settings = MenuSettings.instantiate()
		get_parent().add_child(menu_settings)
