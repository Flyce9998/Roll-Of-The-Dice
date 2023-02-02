extends Label


func _ready():
	self.set_text(str(self.get_parent().position.y/-6) + " km")
