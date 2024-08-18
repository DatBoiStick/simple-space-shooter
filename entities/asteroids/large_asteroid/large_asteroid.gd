extends Area2D
class_name LargeAsteroid

const MIN_MOVE_SPEED: float = 100
const MAX_MOVE_SPEED: float = 250
var move_speed: float
var direction: Vector2 = Vector2.RIGHT
const MIN_ROTATION_SPEED: float = -2.0
const MAX_ROTATION_SPEED: float = 2.0
var rotation_speed: float
var screen_size: Vector2
var margin: float = 128

func _ready() -> void:
	var random_angle: float = randf() * TAU
	direction = Vector2(cos(random_angle), sin(random_angle))
	move_speed = randf_range(MIN_MOVE_SPEED, MAX_MOVE_SPEED)
	
	rotation_speed = randf_range(MIN_ROTATION_SPEED, MAX_ROTATION_SPEED)
	
	screen_size = get_viewport().size

func _physics_process(delta: float) -> void:
	position += direction * move_speed * delta
	rotation += rotation_speed * delta
	
	if position.x < -margin or position.x > screen_size.x + margin or position.y < -margin or position.y > screen_size.y + margin:
		queue_free()

# If player enters the collision shape of this asteroid,
# Run take_damage method on the player.
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()

func take_damage() -> void:
	# Split the asteroid into multiple smaller asteroids.
	const MEDIUM_ASTEROID: Resource = preload("res://entities/asteroids/medium_asteroid/medium_asteroid.tscn")
	
	for i in range(3):
		var medium_asteroid: MediumAsteroid = MEDIUM_ASTEROID.instantiate()
		medium_asteroid.position = global_position + Vector2(randf_range(-20, 20), randf_range(-20, 20))
		get_parent().call_deferred("add_child", medium_asteroid)
	
	queue_free()
