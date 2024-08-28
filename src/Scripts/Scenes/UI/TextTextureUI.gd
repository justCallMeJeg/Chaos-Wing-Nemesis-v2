extends Control

@onready var upperShineGradient = $UpperText/UpperText/ShineGradient
@onready var lowerShineGradient = $LowerText/LowerText/ShineGradient

@onready var upperText = $UpperText/UpperText
@onready var lowerText = $LowerText/LowerText
@onready var animPlayer = $AnimPlayer

var UIText = UIUtil.Text["SelectionScene"].TextTextureUI

func _ready() -> void:
	if GameManager.currentGameState == GameManager.GameStates.SideSelection:
		setText(UIText.SideSelection.UpperText, GameManager.PlayableSides.TOP)
		setText(UIText.SideSelection.LowerText, GameManager.PlayableSides.BOTTOM)
	elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
		if GameManager.currentP1Side == GameManager.PlayableSides.TOP:
			setText(UIText.ShipSelection.P1Text, GameManager.PlayableSides.TOP)
			setText(UIText.ShipSelection.P2Text, GameManager.PlayableSides.BOTTOM)
		elif GameManager.currentP2Side == GameManager.PlayableSides.BOTTOM:
			setText(UIText.ShipSelection.P2Text, GameManager.PlayableSides.TOP)
			setText(UIText.ShipSelection.P1Text, GameManager.PlayableSides.BOTTOM)
		else:
			setText(UIText.ShipSelection.P1Text, GameManager.PlayableSides.TOP)
			setText(UIText.ShipSelection.P2Text, GameManager.PlayableSides.BOTTOM)

func setText(_str: String, pos: GameManager.PlayableSides) -> void:
	if pos == GameManager.PlayableSides.TOP:
		upperText.text = _str
	elif pos == GameManager.PlayableSides.BOTTOM:
		lowerText.text = _str

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")
	await animPlayer.animation_finished
	animPlayer.play("idleScroll")

func playShineAnim(pos: GameManager.PlayableSides) -> void:
	var tween: Tween = create_tween()
	if pos == GameManager.PlayableSides.TOP:
		tween.tween_property(upperShineGradient, "position", Vector2(upperShineGradient.position.x, 512), 0.5).from(Vector2(upperShineGradient.position.x, -256))
	elif pos == GameManager.PlayableSides.BOTTOM:
		tween.tween_property(lowerShineGradient, "position", Vector2(lowerShineGradient.position.x, -256), 0.5).from(Vector2(lowerShineGradient.position.x, 512))
	else: 
		tween.kill()

func sceneTextTextureHandler() -> void:
	var tooltipText = UIText
	if GameManager.currentGameState == GameManager.GameStates.SideSelection:
		if GameManager.P1Selected and GameManager.P2Selected:
			setText(tooltipText.ShipSelection.P1Text, GameManager.currentP1Side)
			setText(tooltipText.ShipSelection.P2Text, GameManager.currentP2Side)
		elif GameManager.P1Selected and not GameManager.P2Selected:
			setText(tooltipText.ShipSelection.P1Text, GameManager.currentP1Side)
		elif not GameManager.P1Selected and GameManager.P2Selected:
			setText(tooltipText.ShipSelection.P2Text, GameManager.currentP2Side)
		elif not GameManager.P1Selected and not GameManager.P2Selected:
			setText(tooltipText.SideSelection.UpperText, GameManager.PlayableSides.TOP)
			setText(tooltipText.SideSelection.LowerText, GameManager.PlayableSides.BOTTOM)
	elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
		setText(tooltipText.ShipSelection.P1Text, GameManager.currentP1Side)
		setText(tooltipText.ShipSelection.P2Text, GameManager.currentP2Side)
