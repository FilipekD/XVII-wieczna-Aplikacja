extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	$Button.set_size(Vector2(get_viewport_rect().size.x/5, get_viewport_rect().size.x/5))





func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
