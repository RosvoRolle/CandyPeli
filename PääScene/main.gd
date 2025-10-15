


extends Node
@onready var player := $Player
@onready var hud := $HPBaarit

func _ready():
	
	player.health_muuttunut.connect(hud.set_health) #yhdistää pelaajan signaalin hudiin

	hud.set_health(player.health, player.max_hp)
	
