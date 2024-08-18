extends Node

var score: int = 0
signal score_changed(new_score: int)

func reset_score() -> void:
	score = 0
	score_changed.emit(score)

func add_score() -> void:
	score += 1
	score_changed.emit(score)
