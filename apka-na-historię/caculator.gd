extends Control

@onready var wynik: LineEdit = $VBoxContainer/LineEdit2
@onready var from_option: OptionButton = $VBoxContainer/OptionButtonFrom
@onready var to_option: OptionButton = $VBoxContainer/OptionButtonTo
@onready var result_label: Label = $VBoxContainer/Label

var animal_values = {
	"Kury": 1,
	"Krowy": 10,
	"Świnie": 5,
	"Owce": 7,
	"Kozy": 6,
	"Konie": 15,
	"Kaczki": 2,
	"Kobieta": 100
};


func _ready():
	wynik.text = "1"
	wynik.text_changed.connect(_on_input_changed)
	from_option.item_selected.connect(_on_input_changed)
	to_option.item_selected.connect(_on_input_changed)
	_on_input_changed()  # Przeliczenie na starcie

func _on_input_changed(_new_text = ""):
	
	var from_type = from_option.get_item_text(from_option.selected)
	var to_type = to_option.get_item_text(to_option.selected)
	var input_value = wynik.text.to_int()
	
	if from_type in animal_values and to_type in animal_values:
		var from_value = animal_values[from_type]
		var to_value = animal_values[to_type]
		var result = round(input_value * from_value / to_value)
		result_label.text = "Wynik: " + str(result)
		
	else:
		result_label.text = "Brak przelicznika"


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
func _process(delta: float) -> void:
	$Button.set_size(Vector2(get_viewport_rect().size.x/5, get_viewport_rect().size.x/5))
