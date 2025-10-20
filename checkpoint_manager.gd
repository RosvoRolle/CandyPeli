extends Node2D
var current_level := 1
var highest_level := 1

func enter_level(level_num: int):
	current_level = level_num
	if level_num > highest_level:
		highest_level = level_num
		save_checkpoint()
	
	
	
func save_checkpoint():
	var save_data = {"highest_level": highest_level}
	var file = FileAccess.open("user://save_dat",FileAccess.WRITE)
	file.store_var(save_data)
	file.close()
	
func load_checkpoint():
	if FileAccess.file_exists("user://save_dat"):
		var file = FileAccess.open("user://save_dat", FileAccess.READ)
		var data = file.get_var()
		file.close()
		highest_level = data.get("highest_level", 3)
