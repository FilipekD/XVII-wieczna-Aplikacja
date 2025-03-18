extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
func _process(delta: float) -> void:
	$Button.set_size(Vector2(get_viewport_rect().size.x/5, get_viewport_rect().size.x/5))
