extends CheckBox

func _ready():
	# Adjust checkmark size and spacing
	add_theme_constant_override("check_v_offset", 10)  # Moves checkmark down
	add_theme_constant_override("hseparation", 15)  # Adjusts spacing
