extends Control

@onready var animPlayer = $AnimPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	print("[DEBUG]: GameShipSelection scene ready...")
	animPlayer.play("IntroAnim")
