extends Node

enum GameStates { Idle, MainMenu, SideSelection, ShipSelection, SceneSection }
enum PlayableSides { DEFAULT = -1, TOP, BOTTOM }

var currentGameState: GameStates = GameStates.MainMenu

var currentP1Side: PlayableSides = PlayableSides.DEFAULT
var currentP2Side: PlayableSides = PlayableSides.DEFAULT

func _ready():
	print("[DEBUG] GameManager ready...")
