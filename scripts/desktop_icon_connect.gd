extends ItemList

@onready var WindowConnections = preload("res://scenes/windows/window_connections.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_activated(index: int) -> void:
	var window_connections = WindowConnections.instantiate()
	get_parent().add_child(window_connections)
