extends Control

enum BorderDir { Left, Right }

@onready var leftAnimPlayer = $LeftBorderColor/AnimPlayer
@onready var rightAnimPlayer = $RightBorderColor/AnimPlayer
@onready var leftText = $LeftBorderColor/Texture/Container/Margin/Text
@onready var rightText = $RightBorderColor/Texture/Container/Margin/Text

func playIntroAnim() -> void:
	match GameManager.currentGameState:
		GameManager.GameStates.SideSelection:
			setSideText("P1 SELECT A SIDE!", BorderDir.Left)
			setSideText("P2 SELECT A SIDE!", BorderDir.Right)
		GameManager.GameStates.ShipSelection:
			setSideText("P1 SELECT A SHIP!", BorderDir.Left)
			setSideText("P2 SELECT A SHIP!", BorderDir.Right)
	leftAnimPlayer.play("IntroAnim")
	rightAnimPlayer.play("IntroAnim")

func setReadyState(side: BorderDir) -> void:
	if side == BorderDir.Left:
		setSideText("PLAYER 1 READY!", BorderDir.Left)
		leftAnimPlayer.play("PlayerReadyState")
	else:
		setSideText("PLAYER 2 READY!", BorderDir.Right)
		rightAnimPlayer.play("PlayerReadyState")

func setSideText(_str: String, side: BorderDir) -> void:
	if side == BorderDir.Left:
		leftText.text = _str
	else:
		rightText.text = _str
