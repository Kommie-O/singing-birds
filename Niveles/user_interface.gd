extends Control

var score: int= 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Senales.IncrementScore.connect(IncrementScore)


func  IncrementScore(incr: int):
	score += incr
	%ScoreLabel.text = str(score) + "pts" 
