extends Control

@onready var topText = $TopTooltipContainer/Margin/Text
@onready var bottomText = $BottomTooltipContainer/Margin/Text
@onready var animPlayer = $AnimPlayer

func setText(_str: String, side: int) -> void:
	if side == 0:
		topText.text = _str
	else:
		bottomText.text = _str

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")
