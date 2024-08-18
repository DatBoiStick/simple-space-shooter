extends Control
class_name ScoreUI

func _ready() -> void:
	$MarginContainer/HBoxContainer/ScoreLabel.text = str(ScoreManager.score)
	ScoreManager.connect("score_changed", on_score_changed)

func on_score_changed(new_score: int) -> void:
	$MarginContainer/HBoxContainer/ScoreLabel.text = str(new_score)
