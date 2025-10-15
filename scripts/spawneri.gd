
extends Node2D

@export var karkki_scene: PackedScene
@export var karkki_textures: Array[Texture2D]



@export var spawni_ajat: float = 2.0
@onready var container := get_parent() 
@onready var timer: Timer =  $Timer
var rng := RandomNumberGenerator.new()

func _ready():
	timer.wait_time = spawni_ajat
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
	
func _on_timer_timeout():
	spawn_karkki()
	
	
func spawn_karkki():
	if not karkki_scene or karkki_textures.is_empty():
		return

	var inst = karkki_scene.instantiate()
	var tex = karkki_textures.pick_random()
	inst.setup(tex)

  
	inst.position = Vector2(rng.randf_range(0, 800), -50)

	container.add_child.call_deferred(inst)
	
	
