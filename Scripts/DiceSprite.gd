extends Sprite

var side
var hit_sfx_node
const pitch_array = [0.8, 1, 1.2, 1.4]
onready var die = get_parent()

func _ready():
	hit_sfx_node = get_parent().get_node("HitSFX")
	randomize()
	side = (randi() % 6)
	self.set_frame(side)

func _on_Die_body_entered(body):
	if abs(die.get_linear_velocity().length()) > 50 and (not die.dragging):
		side = (randi() % 6)
		self.set_frame(side)
	if not body.is_in_group("Dice"):
		hit_sfx_node.set_pitch_scale(pitch_array[randi() % pitch_array.size()])
		hit_sfx_node.play()
