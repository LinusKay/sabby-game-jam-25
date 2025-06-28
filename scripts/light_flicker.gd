extends Light3D

@export var noise: NoiseTexture3D
@export var flicker_min: float = 1.0
@export var flicker_max: float = 10.0
var time_passed := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_passed += delta
	var sampled_noise = noise.noise.get_noise_1d(time_passed)
	sampled_noise = abs(sampled_noise)
	light_energy = clamp(sampled_noise * 20, flicker_min, flicker_max)
