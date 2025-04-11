extends Control

# Perfect c58301
# Genial 00a828
# Bien 009ea6
# Miss 000000
# Called when the node enters the scene tree for the first time.
func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	
	match text:
		"PERFECTO!":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("c58301"))
		"Genial!":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("00a828"))
		"Bien":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("009ea6"))
		"Meh...":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("a14550"))
		":/":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("000000"))
