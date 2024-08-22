extends Control

@onready var animPlayer = $AnimPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	print("[DEBUG]: GameShipSelection scene ready...")
	animPlayer.play("IntroAnim")
	
func _input(event) -> void:
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_SPACE:
				if GameManager.currentGameState == GameManager.GameStates.SideSelection:
					GameManager.currentGameState = GameManager.GameStates.ShipSelection
					get_tree().change_scene_to_file("res://src/Scenes/GameStates/GameShipSelection.tscn")
				else:
					GameManager.currentGameState = GameManager.GameStates.SideSelection
					get_tree().change_scene_to_file("res://src/Scenes/GameStates/GameSideSelection.tscn")
