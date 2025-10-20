extends RigidBody2D

@export var damage: int = 0   # 0 = ei vahinkoa HP baariin, 1 = tekee vahinkoa
@export var pointit: int = 1 
@export var missattu_karkki: int = 1


var _napattu := false



func _ready():
	contact_monitor = true #saadaan törmäyksen seuranta rigidbodyyn
	max_contacts_reported = 2
	body_entered.connect(_on_body_entered) #yhdistää signaalit
	
	
	var notifier := VisibleOnScreenNotifier2D.new()
	add_child(notifier)
	notifier.screen_exited.connect(_karkki_katosi)
	
	

func _on_body_entered(body: Node) -> void:
	
	
	if body.is_in_group("pelaaja"):
		if pointit > 0: 
			var game = get_tree().get_first_node_in_group("game")
			if game:
				game.add_score(pointit)
		var audio_player = body.get_node("AudioStreamPlayer2D")
		if audio_player:
			audio_player.play()
				
		
		
		if damage > 0 and body.has_method("take_damage"): #varmistaa funktion ja ottaa vahinkoa
			body.take_damage(damage)
			
		_napattu = true	
		queue_free()
		#poistaa karkin skenestä
func _karkki_katosi() -> void:
	if not _napattu and pointit > 0 and damage == 0:
		var player := get_tree().get_first_node_in_group("pelaaja")
		if player and player.has_method("take_damage"):
			player.take_damage(missattu_karkki)
		var audio_player = player.get_node("AudioStreamPlayer")
		if audio_player:
			audio_player.play()
	queue_free()		
