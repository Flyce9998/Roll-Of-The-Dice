extends Node

onready var screen_size = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
var screens = 1
var dice_array = []
var max_speed = 1500
