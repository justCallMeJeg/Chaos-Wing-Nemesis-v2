extends Node

var InputsDisabled: bool = false
var P1InputsDisabled: bool = false
var P2InputsDisabled: bool = false

signal inputHandler(event: InputEvent)

func _input(event: InputEvent) -> void:
	if InputsDisabled: return
	if event is InputEventKey and event.is_pressed():
		inputHandler.emit(event)
		match event.keycode:
			KEY_R:
				get_tree().reload_current_scene()

func resetInputState() -> void:
	InputsDisabled = false
	P1InputsDisabled = false
	P2InputsDisabled = false
