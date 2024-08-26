extends Control

@onready var topIndicator := $TopIndicator
@onready var bottomIndicator := $BottomIndicator

func setReadyIndicator(pos: GameManager.PlayableSides) -> void:
	var tween: Tween = create_tween().set_parallel(true).set_trans(Tween.TRANS_CUBIC)
	var selectedSide = topIndicator if pos == GameManager.PlayableSides.TOP else bottomIndicator
	tween.tween_property(selectedSide, "visible", true, 0)
	tween.tween_property(selectedSide, "modulate", Color("#ffffff64"), 0.6667).from(Color("#ffffff"))

func removeReadyIndicator(pos: GameManager.PlayableSides) -> void:
	var selectedSide := topIndicator if pos == GameManager.PlayableSides.TOP else bottomIndicator
	selectedSide.visible = false

func resetReadyIndicator(pos: GameManager.PlayableSides) -> void:
	var selectedSide = topIndicator if pos == GameManager.PlayableSides.TOP else bottomIndicator
	selectedSide.visible = false
