extends AudioStreamPlayer

var song_list = [load("res://Sound/Stepping Stones.mp3"),
load("res://Sound/A Conversation with Saul (Rough Demo.mp3"),
load("res://Sound/Beyond The Clouds (Theme for Modern Broadcast).mp3")]
var song_count = 0


func _ready():
	if not self.is_playing():
		self.stream = song_list[song_count % 3]
		self.play()

func _process(_delta):
	if not self.is_playing():
		song_count += 1
		self.stream = song_list[song_count % 3]
		self.play()
