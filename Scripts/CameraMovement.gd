extends Camera2D

const speed = 480

func _process(delta):
	var up = Input.is_action_just_released("ui_up") or Input.is_action_pressed("ui_up")
	var down = Input.is_action_just_released("ui_down") or Input.is_action_pressed("ui_down")
	if up and self.position.y > -(GlobalVars.screen_size.y * GlobalVars.screens):
		self.position.y -= speed * delta
	if down and self.position.y < 0:
		self.position.y += speed * delta
