extends Control

var score: int= 0
var Combo_Count: int=0 
# Called when the node enters the scene tree for the first time.
func _ready():
	Senales.IncrementScore.connect(IncrementScore)
	Senales.IncrementCombo.connect(IncrementCombo)
	Senales.ResetCombo.connect(ResetCombo)
	
	ResetCombo()

func  IncrementScore(incr: int):
	score += incr
	%ScoreLabel.text = str(score) + "pts" 

func IncrementCombo():
	Combo_Count += 1
	%ComboLabel.text = str(Combo_Count) + "x combo"

func  ResetCombo():
	Combo_Count= 0
	%ComboLabel.text = ""
