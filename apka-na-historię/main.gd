extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://caculator.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://wykrywacz.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Tts.tscn")


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://kalendarz.tscn")


func _on_button_6_pressed():
	get_tree().change_scene_to_file("res://szukaj_posagu.tscn")


func _on_button_7_pressed() -> void:
	get_tree().change_scene_to_file("res://mapa.tscn")
