extends Control

@onready var topText = $TopTooltipContainer/Margin/Text
@onready var bottomText = $BottomTooltipContainer/Margin/Text
@onready var animPlayer = $AnimPlayer

var UIText = UIUtil.Text["SelectionScene"].SideTooltipUI

func _ready() -> void:
	if GameManager.currentGameState == GameManager.GameStates.SideSelection:
		setText(UIText.SideSelection.P1TooltipText, GameManager.PlayableSides.TOP)
		setText(UIText.SideSelection.P2TooltipText, GameManager.PlayableSides.BOTTOM)
	elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
		if GameManager.currentP1Side == GameManager.PlayableSides.TOP:
			setText(UIText.SideSelection.P1TooltipText, GameManager.PlayableSides.TOP)
			setText(UIText.SideSelection.P2TooltipText, GameManager.PlayableSides.BOTTOM)
		elif GameManager.currentP1Side == GameManager.PlayableSides.BOTTOM:
			setText(UIText.SideSelection.P2TooltipText, GameManager.PlayableSides.TOP)
			setText(UIText.SideSelection.P1TooltipText, GameManager.PlayableSides.BOTTOM)
		else:
			setText(UIText.SideSelection.P1TooltipText, GameManager.PlayableSides.TOP)
			setText(UIText.SideSelection.P2TooltipText, GameManager.PlayableSides.BOTTOM)

func setText(_str: String, side: GameManager.PlayableSides) -> void:
	if side == GameManager.PlayableSides.TOP:
		topText.text = _str
	elif side == GameManager.PlayableSides.BOTTOM:
		bottomText.text = _str

func sceneTooltipHandler() -> void:
	var tooltipText = UIText
	
	if GameManager.currentGameState == GameManager.GameStates.SideSelection:
		if GameManager.P1Selected and GameManager.P2Selected:
			setText(tooltipText.SideSelection.IdleText, GameManager.PlayableSides.TOP)
			setText(tooltipText.SideSelection.IdleText, GameManager.PlayableSides.BOTTOM)
		elif GameManager.P1Selected and not GameManager.P2Selected:
			setText(tooltipText.SideSelection.P1IdleText, GameManager.currentP1Side)
		elif not GameManager.P1Selected and GameManager.P2Selected:
			setText(tooltipText.SideSelection.P2IdleText, GameManager.currentP2Side)
		elif not GameManager.P1Selected and not GameManager.P2Selected:
			setText(tooltipText.SideSelection.P1TooltipText, GameManager.PlayableSides.TOP)
			setText(tooltipText.SideSelection.P2TooltipText, GameManager.PlayableSides.BOTTOM)
	elif GameManager.currentGameState == GameManager.GameStates.ShipSelection:
		if GameManager.currentP1Side == GameManager.PlayableSides.TOP:
			setText(tooltipText.ShipSelection.P1TooltipText, GameManager.PlayableSides.TOP)
			setText(tooltipText.ShipSelection.P2TooltipText, GameManager.PlayableSides.BOTTOM)
		elif GameManager.currentP1Side == GameManager.PlayableSides.BOTTOM:
			setText(tooltipText.ShipSelection.P2TooltipText, GameManager.PlayableSides.TOP)
			setText(tooltipText.ShipSelection.P1TooltipText, GameManager.PlayableSides.BOTTOM)

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")
