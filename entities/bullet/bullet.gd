extends Area2D
class_name Bullet

const MOVE_SPEED: float = 500
const TRAVEL_RANGE: float = 1000
var travelled_distance: float = 0

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * MOVE_SPEED * delta
	
	travelled_distance += MOVE_SPEED * delta
	if travelled_distance > TRAVEL_RANGE:
		queue_free()

# When an asteroid enters the collision shape of the bullet,
# Run take_damage method on the asteroid.
func _on_area_entered(area: Area2D) -> void:
	queue_free()
	if area.has_method("take_damage"):
		area.take_damage()
