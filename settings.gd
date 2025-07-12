extends Control

@onready var volume_master: HSlider = $MarginContainer/VBoxContainer/HBoxContainer/VolumeMaster
@onready var volume_music: HSlider = $MarginContainer/VBoxContainer/HBoxContainer3/VolumeMusic
@onready var volume_sfx: HSlider = $MarginContainer/VBoxContainer/HBoxContainer2/VolumeSFX


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	volume_master.value = AudioServer.get_bus_volume_db(0)
	volume_music.value = AudioServer.get_bus_volume_db(1)
	volume_sfx.value = AudioServer.get_bus_volume_db(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volume_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)


func _on_volume_master_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)


func _on_volume_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)


func _on_volume_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, value)


func _on_button_pressed() -> void:
	queue_free()
