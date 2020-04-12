extends Button

var graphics = "low"
const SAVE_PATH = "res://settings.cfg"

func _ready():
	load_settings()
	graphics()

func graphics():
	if graphics == "high":
		get_node("graphics2").set_text("low") 
		save()
	elif graphics == "low":
		get_node("graphics2").set_text("high")
		save()

func save():
	var configFile = ConfigFile.new()
	configFile.set_value("graphics:", "quality" , graphics ) 
	configFile.save(SAVE_PATH)
	pass

func load_settings():
	var configFile = ConfigFile.new()
	var error = configFile.load(SAVE_PATH)
	if error != OK:
		print(error)
		return []
	var configLoad = ConfigFile.new()
	configLoad.load(SAVE_PATH)
	graphics =configLoad.get_value("graphics:", "quality" , graphics ) 
	pass

func _on_Button_button_down():
	if graphics == "high":
		graphics = "low"
	elif graphics == "low":
		graphics = "high"
	graphics()
	pass # Replace with function body.
