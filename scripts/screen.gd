extends Control

@export var scene_select: TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#func _unhandled_key_input(event: InputEvent) -> void:
	#if Input.is_action_just_pressed("enhance"):
		#scene_select.scene.enhance()
	#if Input.is_action_just_pressed("pullback"):
		#scene_select.scene.pullback()
	#if Input.is_action_just_pressed("pan_up"):
		#scene_select.scene.pan("up")
	#if Input.is_action_just_pressed("pan_right"):
		#scene_select.scene.pan("right")
	#if Input.is_action_just_pressed("pan_down"):
		#scene_select.scene.pan("down")
	#if Input.is_action_just_pressed("pan_left"):
		#scene_select.scene.pan("left")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	print("click Control")
