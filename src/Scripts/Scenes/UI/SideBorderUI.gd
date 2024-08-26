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
	leftAnimPlayer.play("introAnim")
	rightAnimPlayer.play("introAnim")

func setReadyState(player: GameManager.Player) -> void:
	if player == GameManager.Player.P1:
		setSideText("PLAYER 1 READY!", BorderDir.Left)
		leftAnimPlayer.play("setReadyStateAnim")
	elif player == GameManager.Player.P2:
		setSideText("PLAYER 2 READY!", BorderDir.Right)
		rightAnimPlayer.play("setReadyStateAnim")

func removeReadyState(player: GameManager.Player) -> void:
	if player == GameManager.Player.P1:
		if GameManager.currentGameState == GameManager.GameStates.SideSelection:
			setSideText("P1 SELECT A SIDE!", BorderDir.Left)
		elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
			setSideText("P1 SELECT A SHIP!", BorderDir.Left)
		leftAnimPlayer.play("removeReadyStateAnim")
	elif player == GameManager.Player.P2:
		if GameManager.currentGameState == GameManager.GameStates.SideSelection:
			setSideText("P2 SELECT A SIDE!", BorderDir.Right)
		elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
			setSideText("P2 SELECT A SHIP!", BorderDir.Right)
		rightAnimPlayer.play("removeReadyStateAnim")

func setSideText(_str: String, side: BorderDir) -> void:
	if side == BorderDir.Left:
		leftText.text = _str
	else:
		rightText.text = _str
