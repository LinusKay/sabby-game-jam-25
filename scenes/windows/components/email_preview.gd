extends VBoxContainer

var subject: String = ""
var time: String = ""
var from: String = ""
var to: String = ""
var cc: Array = []
var content: String = ""
var attachments: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/LabelSubject.text = subject
	$HBoxContainer/LabelTime.text = time
	$LabelSender.text = from
	$LabelPreview.text = content


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
