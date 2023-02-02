extends Label
var current_height = 0
var highest_height = 0
var max_height = 0
var highscore = 0
var timer = Timer.new()
onready var progress = $Bar
onready var highscore_node = $Highscore

func _ready():
	timer.connect("timeout", self, "update_current_height")
	timer.wait_time = 2
	timer.one_shot = true
	add_child(timer)

func _process(_delta):
	for die in GlobalVars.dice_array:
		if not die.dragging and abs(die.get_linear_velocity().y) < 1 and die.global_position.y < max_height:
			max_height = die.global_position.y
	
	if highest_height != floor(-max_height/6):
		highest_height = floor(-max_height/6)
		timer.stop()
	elif timer.is_stopped():
		timer.start()
	else: progress.set_value(timer.get_time_left())
	max_height = 0
	
	self.set_text(str(current_height) + " km")
	highscore_node.set_text("Highscore: " + str(highscore) + " km")
	
	if progress.get_value() >= 1 or current_height == highest_height:
		progress.hide()
	else: progress.show()
	
func update_current_height():
	current_height = highest_height
	if current_height > highscore:
		highscore = current_height
	if highscore > (GlobalVars.screens * 100) - 50:
		GlobalVars.screens += 1
