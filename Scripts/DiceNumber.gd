extends Label


func _process(_delta):
	self.set_text(str(GlobalVars.dice_array.size()))
