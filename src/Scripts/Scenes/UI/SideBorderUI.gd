extends Control

@onready var leftAnimPlayer = $LeftBorderColor/AnimPlayer
@onready var rightAnimPlayer = $RightBorderColor/AnimPlayer
@onready var leftText = $LeftBorderColor/Texture/Container/Margin/Text
@onready var rightText = $RightBorderColor/Texture/Container/Margin/Text

func playIntroAnim() -> void:
	var currentGameState := GameManager.getCurrentGameState()
	match currentGameState:
		GameManager.GameStates.SideSelection:
			setSideText("P1 SELECT A SIDE!", 0)
			setSideText("P2 SELECT A SIDE!", 1)
		GameManager.GameStates.ShipSelection:
			setSideText("P1 SELECT A SHIP!", 0)
			setSideText("P2 SELECT A SHIP!", 1)
	leftAnimPlayer.play("IntroAnim")
	rightAnimPlayer.play("IntroAnim")

func setReadyState(side: int) -> void:
	if side == 0:
		setSideText("PLAYER 1 READY!", 0)
		leftAnimPlayer.play("PlayerReadyState")
	else:
		setSideText("PLAYER 2 READY!", 1)
		rightAnimPlayer.play("PlayerReadyState")

func setSideText(_str: String, side: int) -> void:
	if side == 0:
		leftText.text = _str
	else:
		rightText.text = _str
