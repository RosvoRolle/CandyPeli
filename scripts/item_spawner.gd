extends Node2D
@export var item_scenes: Array[PackedScene]

@export var spawn_interval: float = 2.0
@onready var candy = $"."
var spawn_timer := 0.0

func _ready():
	randomize()

func _process(delta):
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_timer = 0.0
		spawn_item()

func spawn_item():
	if item_scenes.size() == 0:
		return
	
	var random_scenes = item_scenes[randi() % item_scenes.size()]
	var item_instance = random_scenes.instantiate()

		# Set the X position randomly
	var screen_width = get_viewport_rect().size.x
	var random_x = randf_range(0, screen_width)

	item_instance.position = Vector2(random_x, global_position.y)
	get_tree().current_scene.add_child(item_instance)
