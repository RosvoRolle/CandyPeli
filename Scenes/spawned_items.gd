extends Node2D
@onready var candy = $"."

func _ready():
	candy.scale = Vector2(0.3, 0.3)
