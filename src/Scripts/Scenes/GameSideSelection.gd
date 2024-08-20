extends Control

@onready var side_border_ui = $SideBorderUI
@onready var side_tooltip_ui = $SideTooltipUi
@onready var main_text_ui = $MainTextUi

# Called when the node enters the scene tree for the first time.
func _ready():
	print("[DEBUG]: GameSideSelection scene ready...")
	GameManager.setGameState(GameManager.GameStates.SideSelection)
	print("[DEBUG]: GameState set to 'SideSelection'")
	side_border_ui.playIntroAnim()
	side_tooltip_ui.playIntroAnim()
	main_text_ui.playIntroAnim()
