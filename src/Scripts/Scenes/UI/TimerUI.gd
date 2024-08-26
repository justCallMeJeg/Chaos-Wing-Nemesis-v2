extends Control

@onready var countdownHandler = $CountdownHandler
@onready var countdownText = $Text

@onready var animPlayer = $AnimPlayer

@export var Countdown: int = 60
var currentTime: int = 0

signal shipSelectionTimeout()

func _ready() -> void:
	currentTime = Countdown
	countdownText.text = formatTimer(currentTime)

func countdown() -> void:
	await countdownHandler.timeout
	if currentTime <= 0:
		countdownHandler.stop()
		countdownText.visible = false
		
		countdownHandler.wait_time = 3 # Delays signal emit for additional 3 secs
		countdownHandler.start()
		await countdownHandler.timeout
		shipSelectionTimeout.emit()
		return
	else:
		currentTime -= 1
		countdownText.text = formatTimer(currentTime)
		countdown()

func formatTimer(time: int) -> String:
	if time == 10:
		animPlayer.play("countdownAnimEmphazied")
		
	if time <= 9 and time >= 0:
		return "0" + str(time)
	else:
		return str(time)

func stopTimer() -> void:
	countdownHandler.stop()
	countdownText.visible = false

func playIntroAnim() -> void:
	animPlayer.play("introAnim")
	await animPlayer.animation_finished
	countdownHandler.start()
	countdown()
	animPlayer.play("countdownAnim")
