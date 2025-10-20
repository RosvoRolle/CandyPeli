# HUD.gd
extends Control #nappaa kurpitsakuvat
@onready var icons := [$HBoxContainer/Kurpitsa1, $HBoxContainer/Kurpitsa2, $HBoxContainer/Kurpitsa3]


func set_health(current: int, max_hp: int):
	for i in range(icons.size()): #Käydään ikonit läpi
	
		if i < current: #määrittää miten kurpitsa haalenee, ja kuinka monta
			icons[i].modulate = Color(1, 1, 1, 1)
		else:
			icons[i].modulate = Color(1, 1, 1, 0.3)
