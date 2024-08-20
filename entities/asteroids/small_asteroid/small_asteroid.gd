extends BaseAsteroid
class_name SmallAsteroid

func take_damage() -> void:
    queue_free()
    ScoreManager.add_score()