extends Area2D

@onready var sprite: Sprite2D = $Sprite2D 

@export var tippuminen: float = 400.0


func _ready():
	print("Karkki READY:", self)

func setup(tekstuuri: Texture2D) -> void:
   
	if sprite == null:
		await ready
	sprite.texture = tekstuuri

func _physics_process(delta: float) -> void:
	position.y += tippuminen * delta
