extends Label

@export var selected: bool
@onready var style_label_filetree = preload("res://style/label_filetree.tres")
@onready var style_label_filetree_selected = preload("res://style/label_filetree_selected.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected:
		label_settings = style_label_filetree_selected
	else:
		label_settings = style_label_filetree
