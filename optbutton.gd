extends Label

signal opt_button

func _on_Button_button_down():
	emit_signal("opt_button", get_node('text').get_text())
	pass # Replace with function body.
