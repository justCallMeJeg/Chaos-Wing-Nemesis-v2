extends Control

@onready var upperText = $UpperTextContainer/UpperText
@onready var middleText = $CenterTextContainer/MiddleText
@onready var lowerText = $LowerTextContainer
@onready var animPlayer = $AnimPlayer

func setText(_str: String, pos: int) -> void:
	if pos == 0:
		upperText.text = _str
	elif pos == 1:
		middleText.text = _str
	elif pos == 2:
		lowerText.text = _str

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")
