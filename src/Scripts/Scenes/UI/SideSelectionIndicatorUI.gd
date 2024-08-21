extends Control

@onready var P1Indicator = $P1Indicator
@onready var P2Indicator = $P2Indicator

@onready var animPlayer = $AnimPlayer

func playIntroAnim() -> void:
	animPlayer.play("IntroAnim")

func playErrorAnim(pos: int) -> void:
	if pos == 0:
		errorAnim(P1Indicator)
	elif pos == 1:
		errorAnim(P2Indicator)

func errorAnim(actor: Control) -> void:
	var tween: Tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(actor, "position", Vector2(actor.position.x + 25, actor.position.y), 0.0667)
	tween.tween_property(actor, "position", Vector2(actor.position.x - 25, actor.position.y), 0.0667)
	tween.tween_property(actor, "position", Vector2(actor.position.x + 25, actor.position.y), 0.0667)
	tween.tween_property(actor, "position", Vector2(actor.position.x, actor.position.y), 0.0667)
