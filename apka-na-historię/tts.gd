extends Control

var Voices: Array[Dictionary] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Label4.visible = false
	var all_voices = DisplayServer.tts_get_voices()
	for v in all_voices:
		if v["language"].begins_with("pl"):
			Voices.append(v)
			# Split the name by underscores and extract the voice name
			var name_parts = v["name"].split("_")
			if name_parts.size() > 3:
				var voice_name = name_parts[3]  # The part after "PL-PL" (like "PAULINA")
				$VBoxContainer/OptionButton.add_item(voice_name)
			else:
				# Handle the case where the name format is different
				var voice_name = name_parts[0] if name_parts.size() > 0 else "Unknown"
				$VBoxContainer/OptionButton.add_item(voice_name)




	if Voices.is_empty():
		$VBoxContainer/Label4.visible = true
		print("Error: Brak dostępnych głosów TTS w języku polskim. Sprawdź ustawienia systemowe.")
		print("Dostępne dłosy to: ", DisplayServer.tts_get_voices())

func _on_button_pressed():
	var text: String = $VBoxContainer/TextEdit.text
	var VID: int = $VBoxContainer/OptionButton.get_selected_id()
	if VID >= 0 and VID < Voices.size():
		var speaker: String = Voices[VID]["id"]
		DisplayServer.tts_speak(text, speaker)


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
