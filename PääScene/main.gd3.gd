


extends Node
@onready var player := $Player
@onready var hud: Control =  $HPBaarit
@export var score_board := 5
var score := 0

func _ready():
	add_to_group("game")
	player.health_muuttunut.connect(hud.set_health) #yhdistää pelaajan signaalin hudiin

	hud.set_health(player.health, player.max_hp)
	
func add_score(amount: int = 1) -> void:
	score += amount
	hud.set_score(score)
	if score >= score_board:
		_on_voitto()
		
func _on_voitto():
	get_tree().change_scene_to_file("res://PääScene/Main.tscn")
