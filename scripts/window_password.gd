extends Window

@export var password: String
@export var max_attempts: int

var attempts = 0

signal password_result(success: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		submit()


func submit() -> void:
	var password_try = $VBoxContainer/PasswordInput.text
	if password_try == password:
		success()
	else:
		failure()

func success() -> void:
	emit_signal("password_result", true)
	queue_free()

func failure() -> void:
	attempts += 1
	if max_attempts != 0 and attempts > max_attempts:
		emit_signal("password_result", false)
		queue_free()


func _on_button_enter_pressed() -> void:
	submit()


func _on_button_cancel_pressed() -> void:
	emit_signal("password_result", false)
	queue_free()


func _on_close_requested() -> void:
	queue_free()
