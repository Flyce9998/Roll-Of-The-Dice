extends Node

onready var bg_music_node = $"BG Music"
onready var cam_node = $"Camera2D"
onready var UI_node = $Camera2D/UI
const DicePreset = preload("res://Scenes/Die.tscn")


func _ready():
	create_dice()


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"): #Space or Enter
		create_dice()
	
	if Input.is_action_just_pressed("hide_ui"): #H
		if UI_node.is_visible():
			UI_node.hide()
		else:
			UI_node.show()
	
	if Input.is_action_just_pressed("mute_all"): #M
		if not AudioServer.is_bus_mute(0):
			AudioServer.set_bus_mute(0, true)
		else:
			AudioServer.set_bus_mute(0, false)
			
	if Input.is_action_just_pressed("mute_sfx"): #N
		if not AudioServer.is_bus_mute(1):
			AudioServer.set_bus_mute(1, true)
		else:
			AudioServer.set_bus_mute(1, false)
			
	if Input.is_action_just_pressed("mute_song"): #B
		if not AudioServer.is_bus_mute(2):
			AudioServer.set_bus_mute(2, true)
		else:
			AudioServer.set_bus_mute(2, false)



func create_dice():
	var instance = DicePreset.instance()
	instance.position = Vector2(62, 96)
	self.add_child(instance)
	GlobalVars.dice_array.append(instance)


func _on_Button_pressed():
	create_dice()
