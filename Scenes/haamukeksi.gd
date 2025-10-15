extends RigidBody2D

@export var damage: int = 0    # 0 = ei vahinkoa HP baariin, 1 = tekee vahinkoa

func _ready():
	contact_monitor = true #saadaan törmäyksen seuranta rigidbodyyn
	max_contacts_reported = 2
	body_entered.connect(_on_body_entered) #yhdistää signaalit

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("pelaaja"):
		if damage > 0 and body.has_method("take_damage"): #varmistaa funktion ja ottaa vahinkoa
			body.take_damage(damage)
		queue_free()
		#poistaa karkin skenestä
		
