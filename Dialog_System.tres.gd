extends Node

var text = {
	'part1':{
		'dialog' : "Jonny: this is test dialog, part 1 [color=blue]blue[/color]",
		'character' : "Jonny",
		'emotion': "Happy",
		'scrool_speed' : 0.1,
		'flip' : false,
		'background' : 'Test1',
		'song' : 'Another_day_on_the_job',
		'voce_pitch' : 0.7,
		'options': [
		{'text':'go back to part 2','command':{'type': 'next', 'args': 'part2',},'type' : 'Opt1'},
		{'text':'Volume','command':{'type': 'null', 'args': 'null',},'type' : 'Sound/OptSound'},
		{'text':'Graphic:','command':{'type': 'null', 'args': 'null',},'type' : 'Graphic/OptGraphic'},
		{'text':'test14','command':{'type': 'null', 'args': 'null',},'type' : 'Opt1'},
		{'text':'test15','command':{'type': 'null', 'args': 'null',},'type' : 'Opt1'}
		]
	},
	'part2':{
		'dialog' : "Jonny: this is test dialog, part 2, it also way longer than part 1 to test the reading speed, also how are you doing, i'm living a nightmare now",
		'character' : "Jonny",
		'emotion': "Angry",
		'scrool_speed' : 0.01,
		'flip' : true,
		'background' : 'Test2',
		'song' : 'Rise_and_Shine',
		'voce_pitch' : 1.5,
		'options': [
		{'text':'test23','command':{'type': 'null', 'args': 'null',},'type' : 'Opt1'},
		{'text':'go back to part 1','command':{'type': 'next', 'args': 'part1',},'type' : 'Opt1'}
		]
	}
}
