extends Control

@onready var sideSelectionIndicatorHandler = $SideSelectionIndicatorUI
@onready var mainTextHandler = $MainTextUI
@onready var confirmationIndicatorHandler = $ConfirmationIndicatorUI
@onready var sideBorderHandler = $SideBorderUI
@onready var sideTooltipHandler = $SideTooltipUI
@onready var textTextureHandler = $TextTextureUI

@onready var animPlayer = $AnimPlayer

var UIText =  UIUtil.Text["SelectionScene"].SideTooltipUI.SideSelection

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.currentGameState = GameManager.GameStates.SideSelection
	InputManager.InputsDisabled = true # Temp disable input till intro finished
	print("[DEBUG]: GameSideSelection scene ready...")
	InputManager.inputHandler.connect(inputHandler) # Connects InputManager to inputHandler
	print("[DEBUG]: (GameSideSelection) input handler connected...")
	animPlayer.play("IntroAnim") # Plays scene intro anim
	print("[DEBUG]: (GameSideSelection) scene intro played...")
	await animPlayer.animation_finished # Waits till anim finished
	InputManager.InputsDisabled = false # Inputs enabled

# Input listener for GameSideSelection Scene
func inputHandler(event: InputEvent) -> void:
	# Checks if event is keyPress
	if event is InputEventKey and event.is_pressed():
		# Checking event keycode press (Switch Case)
		match event.keycode:
			KEY_W, KEY_S: # P1 Movement Controls
				# Checks if Inputs or P1Input is disabled
				if InputManager.InputsDisabled or InputManager.P1InputsDisabled: return # If yes, ignore
				sideSelectionIndicatorHandler.playerSideInputHandler(GameManager.Player.P1, event, KEY_W, KEY_S) # Indicator Input Handler
			KEY_UP, KEY_DOWN: # P2 Movement Controls
				# Checks if Inputs or P2Input is disabled
				if InputManager.InputsDisabled or InputManager.P2InputsDisabled: return # If yes, ignore
				sideSelectionIndicatorHandler.playerSideInputHandler(GameManager.Player.P2, event, KEY_UP, KEY_DOWN) # Indicator Input Handler
			KEY_SPACE: # P1 Confirmation Input
				# Checks if both players already confirmed
				if GameManager.P1Selected and GameManager.P2Selected: return # If yes, ignore
				if InputManager.InputsDisabled or InputManager.P1InputsDisabled: # Checks if Inputs or P1Input is disabled
					if GameManager.P1Selected: # Checks if player wants to cancel confirmation
						removeReadyState(GameManager.Player.P1, GameManager.currentP1Side) # If yes, remove ready state
					return # Ignore confirmation by default
				setReadyState(GameManager.Player.P1) # Confirmation Handler; Sets state to ready
			KEY_ENTER: # P2 Confirmation Input
				# Checks if both players already confirmed
				if GameManager.P1Selected and GameManager.P2Selected: return # If yes, ignore
				if InputManager.InputsDisabled or InputManager.P2InputsDisabled: # Checks if Inputs or P1Input is disabled
					if GameManager.P2Selected: # Checks if player wants to cancel confirmation
						removeReadyState(GameManager.Player.P2, GameManager.currentP2Side) # If yes, remove ready state
					return # Ignore confirmation by default
				setReadyState(GameManager.Player.P2) # Confirmation Handler; Sets state to ready

# Confirmation Handler; Sets state to ready
func setReadyState(player: GameManager.Player):
	# Retrieving player data based on playerType
	var playerPos = GameManager.currentP1Side if player == GameManager.Player.P1 else GameManager.currentP2Side
	var altPlayerPos = GameManager.currentP1Side if player == GameManager.Player.P2 else GameManager.currentP2Side
	var altPlayerState = GameManager.P1Selected if player == GameManager.Player.P2 else GameManager.P2Selected
	
	# Checks if player's indicator current position is on default
	if playerPos == GameManager.PlayableSides.DEFAULT: 
		sideSelectionIndicatorHandler.playIndicatorErrorAnim(player) # If yes, play indicator error anim
		return # Ignore
	# Checks if player's indicator current position is equal to opponent; and when oponent is already on ready state
	elif playerPos == altPlayerPos and altPlayerState:
		sideSelectionIndicatorHandler.playIndicatorErrorAnim(player) # If yes, play indicator error anim
		mainTextHandler.showErrorMessage("SIDE ALREADY TAKEN", playerPos) # Display error message
		return # Ignore
	
	InputManager["P1InputsDisabled" if player == GameManager.Player.P1 else "P2InputsDisabled"] = true # Sets player inputs to disabled
	GameManager["P1Selected" if player == GameManager.Player.P1 else "P2Selected"] = true # Sets player state to ready
	
	# UI Indicators
	sideBorderHandler.setReadyState(player) # Plays player border ready anim
	confirmationIndicatorHandler.setReadyIndicator(playerPos) # Plays player confirmation indicator ready anim
	textTextureHandler.sceneTextTextureHandler() # Text Texture State Handler
	textTextureHandler.playShineAnim(playerPos) # Plays player side text texture shine anim
	sideTooltipHandler.sceneTooltipHandler() # Tooltip State Handler

# Confirmation State Remover; Removes current player's state to selecting
func removeReadyState(player: GameManager.Player, playerPos: GameManager.PlayableSides) -> void:
	InputManager["P1InputsDisabled" if player == GameManager.Player.P1 else "P2InputsDisabled"] = false  # Sets player inputs to enabled
	GameManager["P1Selected" if player == GameManager.Player.P1 else "P2Selected"] = false # Sets player state to selecting
	
	#UI Indicators
	sideBorderHandler.removeReadyState(player) # Plays backward player border ready anim
	confirmationIndicatorHandler.removeReadyIndicator(playerPos) # Removes player confirmation indicator
	textTextureHandler.sceneTextTextureHandler() # Text Texture State Handler
	sideTooltipHandler.sceneTooltipHandler() # Tooltip State Handler
