extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@export var gravity: float = 980.0  # pixels per second squared (same as default 2D gravity)

@export var nopeus: float = 600.0
# movement range
var min_position = Vector2(-155, 0)
var max_position = Vector2 (1400, 1080)

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
		
		
	position.x = clamp(position.x, min_position.x, max_position.x)
	position.y = clamp(position.y, min_position.y, max_position.y)
	
	
# HP Systeemit
@export var max_hp := 3   #Asettaa HP, ja hp muuttumisen
var health := max_hp
signal health_muuttunut(nykyinen, max) #lähettää viestin kun hp on muuttunut

func _ready():
	add_to_group("pelaaja") #viesti laukaistaan nykyisesta HP tilanteesta
	health_muuttunut.emit(health, max_hp)
	
func take_damage(amount :=1):    #Vähentää HPta
	health = max(health - amount, 0)
	health_muuttunut.emit(health, max_hp)
	if health == 0:
		print ("Game over!")
		
	
	
	
