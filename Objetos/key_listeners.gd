extends Sprite2D

@onready var falling_key = preload("res://Objetos/falling_key.tscn")
@onready var score_text = preload("res://Objetos/score_text.tscn")
@export var key_name: String = "" 

var falling_key_queue = []

var perfect_press_threshold: float = 30
var great_press_threshold: float = 50
var good_pres_threshold: float = 60
var ok_press_threshold: float = 80

var perfect_press_score: float = 400
var great_press_score: float = 200
var good_press_score:float  = 100
var ok_press_score:float = 50




func _process(delta):
	# Asegurarse de que haya una Key para presionar
	if falling_key_queue.size() > 0:
		
		# Si se paso, removerla del queue
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()
			
		
		# Si la apretaron, calcular distancie
		if Input.is_action_just_pressed(key_name):
			var key_to_pop = falling_key_queue.pop_front()
			if key_to_pop != null:
				var distace_from_pass = abs(key_to_pop.pass_threshold - key_to_pop.global_position.y)
				if distace_from_pass !=null:
					if distace_from_pass < perfect_press_threshold:
						Senales.IncrementScore.emit(perfect_press_score)
					elif distace_from_pass < great_press_threshold:
						Senales.IncrementScore.emit (great_press_score)
					elif distace_from_pass < good_pres_threshold:
						Senales.IncrementScore.emit (good_press_score)
					elif distace_from_pass < ok_press_threshold:
						Senales.IncrementScore.emit (ok_press_score)
					else:
						pass
				
			
				
			
				
			
			
			
			
			
			
			
			key_to_pop.queue_free()
			
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.global_position = global_position
		
func CreateFallingKey():
	var Fk_inst = falling_key.instantiate()
	get_tree().get_root().call_deferred("add_child", Fk_inst)
	Fk_inst.Setup(position.x, frame + 4)
	
	falling_key_queue.push_back(Fk_inst)


func _on_random_spawn_timer_timeout() -> void:
	CreateFallingKey()
	$RandomSpawnTimer.wait_time = randf_range(0.4, 3)
	$RandomSpawnTimer.start()
