extends Control

@onready var animPlayer = $AnimPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	print("[DEBUG]: GameSideSelection scene ready...")
	GameManager.setGameState(GameManager.GameStates.SideSelection)
	print("[DEBUG]: GameState set to 'SideSelection'")
	animPlayer.play("IntroAnim")
