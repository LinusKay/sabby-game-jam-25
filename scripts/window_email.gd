extends Window

@onready var EmailPreview: PackedScene = preload("res://scenes/windows/components/email_preview.tscn")

var emails = [
	{
		"subject": "Placeholder Subject",
		"time": "23/06/2025 2:24PM",
		"from": "sender@placeholders.com",
		"to": "recipient@placeholders.com",
		"cc": ["cc@placeholders.com"],
		"content": "This is a PLACEHOLDER EMAIL. You should not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
	{
		"subject": "Second Subject",
		"time": "28/06/2025 7:04PM",
		"from": "sender2@placeholders.com",
		"to": "recipient2@placeholders.com",
		"cc": ["cc2@placeholders.com"],
		"content": "This is ALSO a PLACEHOLDER EMAIL. You should ALSO not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
	{
		"subject": "Second Subject",
		"time": "28/06/2025 7:04PM",
		"from": "sender2@placeholders.com",
		"to": "recipient2@placeholders.com",
		"cc": ["cc2@placeholders.com"],
		"content": "This is ALSO a PLACEHOLDER EMAIL. You should ALSO not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
	{
		"subject": "Second Subject",
		"time": "28/06/2025 7:04PM",
		"from": "sender2@placeholders.com",
		"to": "recipient2@placeholders.com",
		"cc": ["cc2@placeholders.com"],
		"content": "This is ALSO a PLACEHOLDER EMAIL. You should ALSO not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
	{
		"subject": "Second Subject",
		"time": "28/06/2025 7:04PM",
		"from": "sender2@placeholders.com",
		"to": "recipient2@placeholders.com",
		"cc": ["cc2@placeholders.com"],
		"content": "This is ALSO a PLACEHOLDER EMAIL. You should ALSO not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
	{
		"subject": "Second Subject",
		"time": "28/06/2025 7:04PM",
		"from": "sender2@placeholders.com",
		"to": "recipient2@placeholders.com",
		"cc": ["cc2@placeholders.com"],
		"content": "This is ALSO a PLACEHOLDER EMAIL. You should ALSO not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
	{
		"subject": "Second Subject",
		"time": "28/06/2025 7:04PM",
		"from": "sender2@placeholders.com",
		"to": "recipient2@placeholders.com",
		"cc": ["cc2@placeholders.com"],
		"content": "This is ALSO a PLACEHOLDER EMAIL. You should ALSO not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
	{
		"subject": "Second Subject",
		"time": "28/06/2025 7:04PM",
		"from": "sender2@placeholders.com",
		"to": "recipient2@placeholders.com",
		"cc": ["cc2@placeholders.com"],
		"content": "This is ALSO a PLACEHOLDER EMAIL. You should ALSO not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
	{
		"subject": "Second Subject",
		"time": "28/06/2025 7:04PM",
		"from": "sender2@placeholders.com",
		"to": "recipient2@placeholders.com",
		"cc": ["cc2@placeholders.com"],
		"content": "This is ALSO a PLACEHOLDER EMAIL. You should ALSO not be seeing this. Please delete. Thank u!",
		"attachments": []
	},
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for email in emails:
		var emailPreview = EmailPreview.instantiate()
		emailPreview.subject = email.subject
		emailPreview.from = email.from
		emailPreview.to = email.to
		emailPreview.time = email.time
		emailPreview.cc = email.cc
		emailPreview.content = email.content
		emailPreview.attachments = email.attachments
		$HSplitContainer/ScrollContainer/EmailList.add_child(emailPreview)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
