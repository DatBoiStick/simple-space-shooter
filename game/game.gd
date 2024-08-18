extends Node2D
class_name Game

var game_over: bool = false

func _ready() -> void:
	ScoreManager.reset_score()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and not game_over:
		get_tree().paused = !get_tree().paused
		$UserInterfaces/PauseUI.visible = get_tree().paused
		$UserInterfaces/PauseUI.paused()

func _on_player_destroyed() -> void:
	game_over = true
	$GameOverTimer.start()

func _on_game_over_timer_timeout() -> void:
	get_tree().paused = true
	$UserInterfaces/GameOverUI.visible = true
	$UserInterfaces/GameOverUI.game_ended()
