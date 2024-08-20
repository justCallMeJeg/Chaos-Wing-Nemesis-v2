extends Node

enum GameStates { Idle, MainMenu, SideSelection, ShipSelection, SceneSection }

var currentGameState = GameStates.MainMenu

func _ready():
	print("[DEBUG] GameManager ready...")

# GameState Functions ------------------------------
func getGameSates() -> GameStates:
	return GameStates

func getCurrentGameState() -> GameStates:
	return currentGameState

func setGameState(state: GameStates) -> void:
	currentGameState = state
