extends CanvasLayer

onready var text = get_node('language/english').text 
var part = 'part1'
var opt_menu = false
var rand = 1

func _ready():
	gen_opts(part)
	command_exec({'type' : 'next', 'args' : part})

func _process(delta):
	if get_node("Dialog/Label").visible_characters >= text[part].dialog.length():
		get_node('AnimationPlayer').play('Open')
		opt_menu = true
		if Input.is_action_just_pressed('ui_accept'):
			get_node('Options').get_child(select)._on_Button_button_down()
			get_node('bt_sfx2').play()
	else:
		get_node('AnimationPlayer').play('Close')
		opt_menu = false
		if Input.is_action_just_pressed('ui_accept') or Input.is_action_just_released('ui_mouse_right'):
			get_node("Dialog/Label").visible_characters = text[part].dialog.length()
			get_node('bt_sfx2').play()
		if not get_node('Speaking').get_child(rand).is_playing():
			randomize()
			rand = int(rand_range(1,6))
			get_node('Speaking').get_child(rand)._set_playing(true)

var select = 0
var previous = 0
var speed = 1

func _input(event):
	chooser()

func chooser():
	previous = select
	if Input.is_action_just_pressed("ui_up"):
		if opt_menu:
			get_node('bt_sfx1').play()
		if not select >= get_node('Options').get_child_count()-1:
			select += speed
		else:
			select = 0
	if Input.is_action_just_pressed("ui_down"):
		if opt_menu:
			get_node('bt_sfx1').play()
		if not select <= 0:
			select -= speed
		else:
			select = get_node('Options').get_child_count()-1
			
	for i in range(0, get_node('Options').get_child_count()):
		if i == select:
			get_node('Options').get_child(i).get_node('AnimationPlayer').set_current_animation('Close')
		else:
			get_node('Options').get_child(i).get_node('AnimationPlayer').set_current_animation('Open')


func gen_opts(next):
	part = next
	get_node("Character").texture = load('res://Characters/' + text[part].character + '/' + text[part].emotion + '.png')
	get_node("background").texture = load('res://background/' + text[part].background + '.png')
	if text[part].flip:
		get_node("Character").set_flip_h(false)
		get_node("Character").set_position(Vector2(200,350))
	else:
		get_node("Character").set_flip_h(true)
		get_node("Character").set_position(Vector2(840,350))
	for i in range(0, get_node("Options").get_child_count()):
		get_node("Options").get_child(i).queue_free()
	for i in range(0, text[part].options.size()):
		var duplicate = load('res://Opt1.tscn').instance()
		duplicate.get_node('text').set_text(text[part].options[i].text)
		duplicate.set_position(Vector2(0,(-(i)*50)))
		duplicate.connect("opt_button", self, "_on_opt_opt_button")
		duplicate.id = i
		get_node("Options").add_child(duplicate)
#	pass

func _on_opt_opt_button(data):
	var check = part
	for i in range(0, text[check].options.size()):
		if text[check].options[i].text == data:
			command_exec(text[check].options[i].command)
	pass # Replace with function body.

func _on_Timer_timeout():
	get_node("Dialog/Label").visible_characters += 1
	pass # Replace with function body.

func command_exec(args):
	if args.type == 'next':
		get_node("Dialog/Label").visible_characters = 0
		
		get_node("Dialog/Timer").wait_time = text[args.args].scrool_speed
		for i in range(0,6):
			get_node('Speaking').get_child(i).pitch_scale = text[args.args].voce_pitch
		get_node("Dialog/Label").set_text(text[args.args].dialog)
		gen_opts(args.args)