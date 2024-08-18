extends Control
class_name GameOverUI

func game_ended() -> void:
	$VBoxContainer/RestartButton.grab_focus()

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_game_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main/main.tscn")
