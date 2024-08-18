extends Control
class_name Main

func _ready() -> void:
	$VBoxContainer/StartGameButton.grab_focus()

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/game.tscn")

func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
