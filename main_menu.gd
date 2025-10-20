extends Control

func _ready():
	$StartButton.pressed.connect(_on_play_pressed)
	$QuitButton.pressed.connect(_on_quit_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://level/level_1.tscn")

func _on_quit_pressed():
	get_tree().quit()
