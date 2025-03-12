extends Control

@onready var name_input = $VBoxContainer/LineEdit
@onready var posag_label = $VBoxContainer/Label4
@onready var button = $VBoxContainer/Button

var last_name = "test"

func _ready():
	button.pressed.connect(generate_posag)
	
func generate_posag():
	var name = name_input.text.strip_edges()
	
	if name.is_empty():
		posag_label.text = "Podaj imię!"
		return
	if name == last_name:
		posag_label.text = "Podaj inne imię!"
		return
		
	print(last_name,name)
	last_name = name
	
	var posag = {
		"Kury": randi_range(5, 100),
		"Krowy": randi_range(0, 5),
		"Świnie": randi_range(0, 8),
		"Gęsi": randi_range(0, 15),
		"Ziemia (morgi)": randi_range(1, 10) #historyczna jednostka powierzchni, używana w rolnictwie. 
		#Początkowo oznaczała obszar, jaki jeden człowiek mógł zaorać lub skosić jednym zaprzęgiem w ciągu dnia roboczego (dokładnie: od rana do południa),
		#a jej wielkość wynosiła – zależnie od jakości gleby, zaprzęgu i narzędzi w Europie 0,33–1,07 hektara.
	}
	
	var posag_text = "Posag dla " + name + ":\n"
	for key in posag.keys():
		posag_text += key + ": " + str(posag[key]) + "\n"
	
	posag_label.text = posag_text
