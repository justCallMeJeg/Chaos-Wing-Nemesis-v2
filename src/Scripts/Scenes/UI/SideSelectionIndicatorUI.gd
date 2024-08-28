extends Control

@onready var P1Indicator: PanelContainer = $P1Indicator
@onready var P2Indicator: PanelContainer = $P2Indicator

@onready var animPlayer = $AnimPlayer

# Constants for side select indicator positions
const DEFAULT_POSITION = 620
const TOP_POSITION = 265
const BOTTOM_POSITION = 965

signal animFinished(anim: StringName)

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")

# Updates side selection position and handles tween animation
func playerSideInputHandler(player: GameManager.Player, event: InputEventKey, keyUp: int, keyDown: int) -> void:
	var playerIndicator = P1Indicator if player == GameManager.Player.P1 else P2Indicator
	var currenPlayerSide := GameManager.currentP1Side if playerIndicator == P1Indicator else GameManager.currentP2Side
	var tween: Tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	
	match event.keycode:
		keyUp:
			match currenPlayerSide:
				GameManager.PlayableSides.DEFAULT:
					setPlayerSide(player, GameManager.PlayableSides.TOP)
					tween.tween_property(playerIndicator, "position", Vector2(playerIndicator.position.x, TOP_POSITION), 0.1).from(Vector2(playerIndicator.position.x, DEFAULT_POSITION))
				GameManager.PlayableSides.BOTTOM:
					setPlayerSide(player, GameManager.PlayableSides.DEFAULT)
					tween.tween_property(playerIndicator, "position", Vector2(playerIndicator.position.x, DEFAULT_POSITION), 0.1).from_current()
				_:
					tween.kill()
		keyDown:
			match currenPlayerSide:
				GameManager.PlayableSides.DEFAULT:
					setPlayerSide(player, GameManager.PlayableSides.BOTTOM)
					tween.tween_property(playerIndicator, "position", Vector2(playerIndicator.position.x, BOTTOM_POSITION), 0.1).from(Vector2(playerIndicator.position.x, DEFAULT_POSITION))
				GameManager.PlayableSides.TOP:
					setPlayerSide(player, GameManager.PlayableSides.DEFAULT)
					tween.tween_property(playerIndicator, "position", Vector2(playerIndicator.position.x, DEFAULT_POSITION), 0.1).from_current()
				_:
					tween.kill()

func setPlayerSide(player: GameManager.Player, newSide: GameManager.PlayableSides) -> void:
	if player == GameManager.Player.P1:
		GameManager.currentP1Side = newSide
	elif player == GameManager.Player.P2:
		GameManager.currentP2Side = newSide

func playIndicatorErrorAnim(player: GameManager.Player) -> void:
	var playerIndicator = P1Indicator if player == GameManager.Player.P1 else P2Indicator
	setTimeoutStatus(player, true)
	var tween: Tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(playerIndicator, "position", Vector2(playerIndicator.position.x + 25, playerIndicator.position.y), 0.0667)
	tween.tween_property(playerIndicator, "position", Vector2(playerIndicator.position.x - 25, playerIndicator.position.y), 0.0667)
	tween.tween_property(playerIndicator, "position", Vector2(playerIndicator.position.x + 25, playerIndicator.position.y), 0.0667)
	tween.tween_property(playerIndicator, "position", Vector2(playerIndicator.position.x, playerIndicator.position.y), 0.0667)
	await tween.finished
	setTimeoutStatus(player, false)

func setTimeoutStatus(player: GameManager.Player, disabled: bool) -> void:
	if player == GameManager.Player.P1:
		InputManager.P1InputsDisabled = disabled
	elif player == GameManager.Player.P2		:
		InputManager.P2InputsDisabled = disabled

func playReadyAnim() -> void:
	animPlayer.play("stageTransitionAnim")
	await animPlayer.animation_finished
	animFinished.emit("stageTransitionAnim")
	
