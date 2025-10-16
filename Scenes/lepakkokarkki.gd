extends RigidBody2D

@export var damage: int = 0    

func _ready():
	contact_monitor = true
	max_contacts_reported = 3
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("pelaaja"):
		if damage > 0 and body.has_method("take_damage"):
			body.take_damage(damage)
		queue_free()
