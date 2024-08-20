extends Control

@onready var upperSubtitle = $UpperSubtitle
@onready var mainText = $MainText
@onready var lowerSubtitle = $LowerSubtitle

@onready var animPlayer = $AnimPlayer

func setText(_str:String, pos: int) -> void:
	match pos:
		0:
			upperSubtitle.text = _str
		1:
			mainText.text = _str
		2:
			lowerSubtitle.text = _str

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")
