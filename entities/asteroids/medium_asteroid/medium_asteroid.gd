extends BaseAsteroid
class_name MediumAsteroid

func take_damage() -> void:
    const ASTEROID = preload("res://entities/asteroids/small_asteroid/small_asteroid.tscn")

    for i in range(3):
        var asteroid = ASTEROID.instantiate()
        asteroid.position = global_position + Vector2(randf_range(-20, 20), randf_range(-20, 20))
        get_parent().call_deferred("add_child", asteroid)
        
    queue_free()