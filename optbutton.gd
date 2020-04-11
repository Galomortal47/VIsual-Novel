extends Label

signal opt_button
var id

func _on_Button_button_down():
	if get_parent().get_parent().get_node('AnimationPlayer').get_current_animation() == 'Open':
		emit_signal("opt_button", get_node('text').get_text())
		get_parent().get_parent().get_node('bt_sfx2').play()
	pass # Replace with function body.

func _on_Button_mouse_entered():
	if get_parent().get_parent().get_node('AnimationPlayer').get_current_animation() == 'Open':
		get_parent().get_parent().get_node('bt_sfx1').play()
	get_parent().get_parent().select = id
	pass # Replace with function body.

