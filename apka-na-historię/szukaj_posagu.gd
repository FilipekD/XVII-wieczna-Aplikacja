extends Control

@onready var name_input = $VBoxContainer/LineEdit
@onready var posag_label = $VBoxContainer/Label4
@onready var button = $VBoxContainer/Button
var mnożnik = 7
var last_name = "test"
var kobieta = true
var młoda = false
var ładna  = false
func _mnożnik():
	pass
	
func _ready():
	button.pressed.connect(generate_posag)
func generate_posag():
	
	mnożnik = 7
	if kobieta == true:
		mnożnik = mnożnik - 2
	if ładna == true:
		mnożnik = mnożnik - 2
	if młoda == true:
		mnożnik = mnożnik -2
	var name = name_input.text.strip_edges()
	print(mnożnik)
	if name.is_empty():
		posag_label.text = "Podaj nazwisko rodowe!"
		return
	if name == last_name:
		posag_label.text = "Podaj inne nazwisko rodowe!"
		return
		
	print(last_name,name)
	last_name = name
	
	var posag = {
		"Kury": randi_range(1*mnożnik, 5*mnożnik),
		"Krowy": randi_range(0*mnożnik, 5*mnożnik),
		"Świnie": randi_range(0*mnożnik, 2*mnożnik),
		"Gęsi": randi_range(0*mnożnik, 5*mnożnik),
		"Ziemia (morgi)": randi_range(1*mnożnik, 3*mnożnik) #historyczna jednostka powierzchni, używana w rolnictwie. 
		#Początkowo oznaczała obszar, jaki jeden człowiek mógł zaorać lub skosić jednym zaprzęgiem w ciągu dnia roboczego (dokładnie: od rana do południa),
		#a jej wielkość wynosiła – zależnie od jakości gleby, zaprzęgu i narzędzi w Europie 0,33–1,07 hektara.
	}
	
	var posag_text = "Posag za poślubienie : " + name + ":\n"
	for key in posag.keys():
		posag_text += key + ": " + str(posag[key]) + "\n"
	
	posag_label.text = posag_text



func _on_kobieta_pressed() -> void:
	
	if kobieta == true:
		kobieta = false
	elif kobieta == false:
		kobieta = true
	print(kobieta)	


func _on_ładna_pressed() -> void:
	if ładna == true:
		ładna = false
	elif ładna == false:
		ładna =  true
	print(ładna)


func _on_młoda_pressed() -> void:
	if młoda == false:
		młoda = true
	elif młoda == true:
		młoda = false
	print(młoda)
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
