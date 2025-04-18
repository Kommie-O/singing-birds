extends Sprite2D

@onready var falling_key = preload("res://Main/Objetos/falling_key.tscn")
@onready var score_text = preload("res://Main/Objetos/score_text.tscn")
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

func _ready():
	$"Glow Overlay".frame = frame + 4
	Senales.CreateFallingKey.connect(CreateFallingKey)


func _process(delta):
	
	if Input.is_action_just_pressed(key_name):
		Senales.KeyListenerPress.emit(key_name, frame)
	
	
	# Asegurarse de que haya una Key para presionar
	if falling_key_queue.size() > 0:
		
		# Si se paso, removerla del queue
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.SetTextInfo(":/")
			Senales.ResetCombo.emit()
			st_inst.global_position = global_position + Vector2(0, -20)
		
		# Si la apretaron, calcular distancie
		if Input.is_action_just_pressed(key_name):
			var key_to_pop = falling_key_queue.pop_front()
			var press_score_text: String = ""
			$KeyFade.play("Clicked")
			if key_to_pop != null:
				var distace_from_pass = abs(key_to_pop.pass_threshold - key_to_pop.global_position.y)
				
				if distace_from_pass !=null:
					
					
					if distace_from_pass < perfect_press_threshold:
						Senales.IncrementScore.emit(perfect_press_score)
						press_score_text = "PERFECTO!"
						Senales.IncrementCombo.emit()
					elif distace_from_pass < great_press_threshold:
						Senales.IncrementScore.emit (great_press_score)
						press_score_text = "Genial!"
						Senales.IncrementCombo.emit()
					elif distace_from_pass < good_pres_threshold:
						Senales.IncrementScore.emit (good_press_score)
						press_score_text = "Bien"
						Senales.IncrementCombo.emit()
					elif distace_from_pass < ok_press_threshold:
						Senales.IncrementScore.emit (ok_press_score)
						press_score_text = "Meh..."
						Senales.IncrementCombo.emit()
					else:
						pass
						press_score_text = ":/"
						Senales.ResetCombo.emit()
				
			
				
			
				
			
			
			
			
			
			
			if key_to_pop !=null:
				key_to_pop.queue_free()
			
			
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.SetTextInfo(press_score_text)
			st_inst.global_position = global_position + Vector2(0, -20)
		
func CreateFallingKey(button_name: String):
	if button_name == key_name:
		var fk_inst = falling_key.instantiate()
		get_tree().get_root().call_deferred("add_child", fk_inst)
		fk_inst.Setup(position.x, frame + 4)
		
		falling_key_queue.push_back(fk_inst)
	
	
	
	
	


func _on_random_spawn_timer_timeout() -> void:
	# CreateFallingKey()
	$RandomSpawnTimer.wait_time = randf_range(0.4, 3)
	$RandomSpawnTimer.start()
