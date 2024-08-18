extends Control
class_name PauseUI

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	visible = false
	
func paused() -> void:
	$VBoxContainer/ResumeButton.grab_focus()

func _on_quit_game_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main/main.tscn")
