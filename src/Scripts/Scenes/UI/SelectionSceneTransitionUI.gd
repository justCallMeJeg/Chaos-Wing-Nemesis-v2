extends Control

@onready var animPlayer = $AnimPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer.play("sceneSlamTransition")

func changeTransitionTo(_str: StringName) -> void:
	get_tree().change_scene_to_file(_str)
