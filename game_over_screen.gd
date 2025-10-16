extends Control

func _ready():
	$AudioStreamPlayer.play()
	$ReplayButton.pressed.connect(_on_replay_pressed)
	$QuitButton.pressed.connect(_on_quit_pressed)

func _on_replay_pressed():
	get_tree().change_scene_to_file("res://PääScene/Main.tscn")

func _on_quit_pressed():
	get_tree().quit()
