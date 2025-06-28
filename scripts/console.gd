extends TextEdit

var focused: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter") and focused:
		var command = text


func _on_focus_entered() -> void:
	focused = true

func _on_focus_exited() -> void:
	focused = false
