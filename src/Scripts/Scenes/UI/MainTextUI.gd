extends Control

enum TextPositions { UPPER, CENTER, LOWER }

@onready var upperSubtitle = $UpperSubtitle
@onready var mainText = $MainText
@onready var lowerSubtitle = $LowerSubtitle

@onready var animPlayer = $AnimPlayer

func _ready() -> void:
	if GameManager.currentGameState == GameManager.GameStates.SideSelection:
		setText("SEELCT YOUR SIDE", TextPositions.UPPER)
		setText("SIDE SELECTION", TextPositions.CENTER)
		setText("SEELCT YOUR SIDE", TextPositions.LOWER)
	elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
		setText("SEELCT YOUR SHIP", TextPositions.UPPER)
		setText("SHIP SELECTION", TextPositions.CENTER)
		setText("SEELCT YOUR SHIP", TextPositions.LOWER)
	elif GameManager.currentGameState == GameManager.GameStates.SceneSection:
		setText("", TextPositions.UPPER)
		setText("SCENE SELECTION", TextPositions.CENTER)
		setText("", TextPositions.LOWER)
	else:
		setText("PLACEHOLDER", TextPositions.UPPER)
		setText("PLACEHOLDER", TextPositions.CENTER)
		setText("PLACEHOLDER", TextPositions.LOWER)

func setText(_str:String, pos: TextPositions) -> void:
	match pos:
		TextPositions.UPPER:
			upperSubtitle.text = _str
		TextPositions.CENTER:
			mainText.text = _str
		TextPositions.LOWER:
			lowerSubtitle.text = _str

func setCenterText() -> void:
	if GameManager.currentGameState == GameManager.GameStates.SideSelection:
		setText("SELECT A SIDE", TextPositions.CENTER)
	elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
		setText("SELECT A SHIP", TextPositions.CENTER)
	elif GameManager.currentGameState == GameManager.GameStates.SceneSection:
		setText("RANDOM", TextPositions.CENTER)
	else:
		setText("PLACEHOLDER", TextPositions.CENTER)

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")

func showErrorMessage(_str: String, pos: GameManager.PlayableSides) -> void:
	var textTween: Tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_parallel(true)
	var textSide = upperSubtitle if pos == GameManager.PlayableSides.TOP else lowerSubtitle
	textSide.text = _str
	textTween.tween_property(textSide, "visible", true, 0)
	textTween.tween_property(textSide, "self_modulate", Color("#ffffff00"), 1).from(Color("#ff0000"))
