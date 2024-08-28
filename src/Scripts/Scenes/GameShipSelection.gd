extends Control

@onready var textTextureHandler = $TextTextureUI
@onready var sideTooltipHandler = $SideTooltipUI

@onready var animPlayer = $AnimPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	textTextureHandler.sceneTextTextureHandler()
	sideTooltipHandler.sceneTooltipHandler()
	print("[DEBUG]: GameShipSelection scene ready...")
	animPlayer.play("IntroAnim")
