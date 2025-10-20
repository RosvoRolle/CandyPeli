extends BoxContainer

func _ready():
	$AudioStreamPlayer.play()
	$ReplayButton.pressed.connect(_on_replay_pressed)
	$QuitButton.pressed.connect(_on_quit_pressed)

func _on_replay_pressed():
	print("Replay pressed!")  # debug check
	CheckpointManager.load_checkpoint()
	var level_to_load = CheckpointManager.current_level
	print("Loading level:", level_to_load)
	get_tree().change_scene_to_file("res://level/level_%d.tscn" % level_to_load)

func _on_quit_pressed():
	get_tree().quit()
