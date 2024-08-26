extends Node

enum GameStates { Idle, MainMenu, SideSelection, ShipSelection, SceneSection }
enum Player { P1, P2 }

enum PlayableSides { DEFAULT = -1, TOP, BOTTOM }

var currentGameState: GameStates = GameStates.MainMenu

var P1Selected: bool = false
var P2Selected: bool = false

var currentP1Side: PlayableSides = PlayableSides.DEFAULT
var currentP2Side: PlayableSides = PlayableSides.DEFAULT

var currentP1Ship
var currentP2Ship

var SceneSelector: Player = Player.P1

func _ready():
	print("[DEBUG] GameManager ready...")

func resetGameState() -> void:
	currentGameState = GameStates.MainMenu
	currentP1Side = PlayableSides.DEFAULT
	currentP2Side = PlayableSides.DEFAULT
	P1Selected = false
	P2Selected = false

func randomizePlayerSceneSelector() -> void:
	SceneSelector = Player.P1 if randi_range(0 ,1) == 0 else Player.P2
	
