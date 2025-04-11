extends Node2D



const  in_edit_mode: bool = true
var current_level_name = "LECHUZA_TANGUERA"


var fk_fall_time: float = 2.2
var fk_output_arr = [[], [], [], []]

var level_info = {
	"LECHUZA_TANGUERA" = {
		"fk_times": "[[1],[2],[3],[4]]",
		"music":load("res://Main/Musica/Music_Tango_150BPM_001.wav")
	}
}

func _ready():
	
	$Musica.stream = level_info.get(current_level_name).get("music")
	$Musica.play()
	
	
	if in_edit_mode:
		Senales.KeyListenerPress.connect(KeyListenerPress)
	
	else:
		var fk_times = level_info.get(current_level_name).get("fk_times")
		var fk_times_arr = str_to_var(fk_times)
		
		
		var counter: int= 0
		for key in fk_times_arr:
			
			var button_name: String = ""
			match  counter:
				0:
					button_name = "button_A"
				1:
					button_name = "button_S"
				2:
					button_name = "button_D"
				3:
					button_name = "button_F"
			
			for delay in key:
				SpawnFallingKey(button_name, delay)
				
				counter += 1
		
func KeyListenerPress(button_name: String, array_num: int):
	print(str(array_num) + " " + str($Musica.get_playback_position()))
	fk_output_arr[array_num].append($Musica.get_playback_position() - fk_fall_time)
		
		
func SpawnFallingKey(button_name: String, delay: float):
	await  get_tree().create_timer(delay).timeout
	Senales.CreateFallingKey.emit(button_name)

func _on_musica_finished():
	print(fk_output_arr)
