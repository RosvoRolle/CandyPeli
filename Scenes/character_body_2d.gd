extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

@export var nopeus: float = 600.0

func _process(delta):
	
	var suunta := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	position.x += suunta * nopeus * delta
	
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("run")
		_animated_sprite.flip_h = false
	
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("run")
		_animated_sprite.flip_h = true	
	
	else:
		_animated_sprite.stop()
		
		
	
