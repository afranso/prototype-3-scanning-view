extends CanvasLayer


# If your FoundLabel is directly under UI and named exactly "FoundLabel":
@onready var label := $FoundLabel

func show_found_message():
	# Set the message
	label.text = "Found it!"
	label.visible = true

	# Hide after 2 seconds
	await get_tree().create_timer(2.0).timeout
	label.visible = false
