extends Control
@onready var pajaros: AudioStreamPlayer2D = %Pajaros
var current_level_name = "LECHUZA_TANGUERA"

var level_info = {
	"LECHUZA_TANGUERA" = {
		"click": load("res://Main/Musica/Menu_Click_001.wav")
	}
}


	


func _on_empezar_pressed() -> void:
	pajaros.stream = level_info.get(current_level_name).get("click")
	pajaros.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Main/Niveles/game_level.tscn")
	
