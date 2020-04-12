extends HSlider

var volume
var volume_mute = false
var volume_reduct = 90
var volume_divider = 0.6

func _input(event):
	if get_parent().check_id():
		if Input.is_action_pressed("ui_right"):
			var x = self.get_value()
			self.set_value(x+10)
		elif Input.is_action_pressed("ui_left"):
			var x = self.get_value()
			self.set_value(x-10)

func _on_Volume_value_changed(value):
	if volume_mute == false:
		volume = self.get_value()
		volume -= volume_reduct
		volume = volume * volume_divider
		AudioServer.set_bus_volume_db(0 , volume)
	pass # Replace with function body.
