extends Node2D
class_name AsteroidSpawner

func spawn_asteroid() -> void:
	const SMALL_ASTEROID: Resource = preload("res://entities/asteroids/small_asteroid/small_asteroid.tscn")
	const MEDIUM_ASTEROID: Resource = preload("res://entities/asteroids/medium_asteroid/medium_asteroid.tscn")
	const LARGE_ASTEROID: Resource = preload("res://entities/asteroids/large_asteroid/large_asteroid.tscn")
	
	var asteroid_types: Array[Resource] = [SMALL_ASTEROID, MEDIUM_ASTEROID, LARGE_ASTEROID]
	var selected_asteroid: Resource = asteroid_types[randi_range(0, asteroid_types.size() - 1)]
	var asteroid = selected_asteroid.instantiate()
	
	$Path2D/PathFollow2D.progress_ratio = randf()
	asteroid.global_position = $Path2D/PathFollow2D.global_position
	add_child(asteroid)

func _on_timer_timeout() -> void:
	spawn_asteroid()
