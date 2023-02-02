extends RigidBody2D

const drag_margin = 32
var dragging = false



func _integrate_forces(state):
	var mouse_pos = get_global_mouse_position()
	var dist = (mouse_pos - self.global_position)
	var pressing_left = Input.is_mouse_button_pressed(BUTTON_LEFT)
	
	if pressing_left and dist.length() < drag_margin and mouse_pos.y < -44:
		dragging = true
	if dragging:
		state.set_linear_velocity(dist * drag_margin)
		state.angular_velocity = self.get_linear_velocity().angle()
		if not pressing_left or dist.length() > drag_margin:
			dragging = false
	if abs(self.get_linear_velocity().x) > GlobalVars.max_speed or abs(self.get_linear_velocity().y) > GlobalVars.max_speed:
		var new_speed = get_linear_velocity().normalized()
		new_speed *= GlobalVars.max_speed
		set_linear_velocity(new_speed)


func _process(_delta):
	if dragging == false and abs(self.get_linear_velocity().length()) < 1:
		self.set_linear_velocity(Vector2.ZERO)
	if self.position.x < 0 or self.position.x > GlobalVars.screen_size.x:
		GlobalVars.dice_array.erase(self)
		queue_free()
