extends AnimatedSprite2D
@onready var notas: AudioStreamPlayer2D = %Notas
@onready var pajaros: AudioStreamPlayer2D = %Pajaros

var current_level_name = "LECHUZA_TANGUERA"
var level_info = {
	"LECHUZA_TANGUERA" = {
		"tango_1": load("res://Main/Musica/Music_Note_Tango_001.wav"),
		"tango_2": load("res://Main/Musica/Music_Note_Tango_002.wav"),
		"tango_3": load("res://Main/Musica/Music_Note_Tango_003.wav"),
		"tango_4": load("res://Main/Musica/Music_Note_Tango_004.wav"),
		"pajaro_1": load("res://Main/Musica/Music_Bird_Benteveo_001.wav"),
		"pajaro_2": load("res://Main/Musica/Music_Bird_Gorrion_002.wav"),
		"pajaro_3": load("res://Main/Musica/Music_Bird_Hornero_003.wav"),
		"pajaro_4": load("res://Main/Musica/Music_Bird_Tero_004.wav")
	}
}

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("button_A"):
		play("izquierda")
		notas.stream = level_info.get(current_level_name).get("tango_1")
		notas.play()
		pajaros.stream = level_info.get(current_level_name).get("pajaro_1")
		pajaros.play()
	if Input.is_action_just_pressed("button_S"):
		play("abajo")
		notas.stream = level_info.get(current_level_name).get("tango_2")
		notas.play()
		pajaros.stream = level_info.get(current_level_name).get("pajaro_2")
		pajaros.play()
	if Input.is_action_just_pressed("button_D"):
		play("derecha")
		notas.stream = level_info.get(current_level_name).get("tango_3")
		notas.play()
		pajaros.stream = level_info.get(current_level_name).get("pajaro_3")
		pajaros.play()
	if Input.is_action_just_pressed("button_F"):
		play("arriba")
		notas.stream = level_info.get(current_level_name).get("tango_4")
		notas.play()
		pajaros.stream = level_info.get(current_level_name).get("pajaro_4")
		pajaros.play()
