extends Control

enum TextPositions { TOP, CENTER, BOTTOM }

@onready var upperText = $UpperTextContainer/UpperText
@onready var middleText = $CenterTextContainer/MiddleText
@onready var lowerText = $LowerTextContainer/LowerText
@onready var animPlayer = $AnimPlayer

func _ready() -> void:
	if GameManager.currentGameState == GameManager.GameStates.SideSelection:
		setText("TOP\nSIDE\nTOP\nSIDE", TextPositions.TOP)
		setText("BOTTOM\nSIDE\nBOTTOM\nSIDE", TextPositions.BOTTOM)
	elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
		if GameManager.currentP1Side == GameManager.PlayableSides.TOP:
			setText("PLAYER 1\nPLAYER 1\nPLAYER 1\nPLAYER 1", TextPositions.TOP)
			setText("PLAYER 2\nPLAYER 2\nPLAYER 2\nPLAYER 2", TextPositions.BOTTOM)
		elif GameManager.currentP2Side == GameManager.PlayableSides.BOTTOM:
			setText("PLAYER 2\nPLAYER 2\nPLAYER 2\nPLAYER 2", TextPositions.TOP)
			setText("PLAYER 1\nPLAYER 1\nPLAYER 1\nPLAYER 1", TextPositions.BOTTOM)
		else:
			setText("PLAYER 1\nPLAYER 1\nPLAYER 1\nPLAYER 1", TextPositions.TOP)
			setText("PLAYER 2\nPLAYER 2\nPLAYER 2\nPLAYER 2", TextPositions.BOTTOM)

func setText(_str: String, pos: TextPositions) -> void:
	if pos == TextPositions.TOP:
		upperText.text = _str
	elif pos == TextPositions.CENTER:
		middleText.text = _str
	elif pos == TextPositions.BOTTOM:
		lowerText.text = _str

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")
