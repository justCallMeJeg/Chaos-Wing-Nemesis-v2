extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	InputManager.inputHandler.connect(inputHandler)

func inputHandler() -> void:
	pass
