extends Control

@onready var selectionSceneTransitionHandler = $SelectionSceneTransitionUI

# Called when the node enters the scene tree for the first time.
func _ready():
	InputManager.inputHandler.connect(inputHandler)

func inputHandler(event: InputEvent) -> void:
	# Checks if event is keyPress
	if event is InputEventKey and event.is_pressed():
		# Checking event keycode press (Switch Case)
		match event.keycode:
			KEY_SPACE, KEY_ENTER:
				GameManager.currentGameState = GameManager.GameStates.SideSelection
				selectionSceneTransitionHandler.changeTransitionTo("res://src/Scenes/GameStates/GameSideSelection.tscn")
			
