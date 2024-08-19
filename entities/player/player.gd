extends CharacterBody2D
class_name Player

const MOVE_SPEED: float = 250
const ACCELERATION: float = 200
const DECELERATION: float = 150
const ROTATION_SPEED: float = 3
var rotation_direction: float = 0
var screen_size: Vector2 = Vector2(480, 640)
signal destroyed

func _physics_process(delta: float) -> void:
	handle_movement(delta)
	handle_wrapping()

func handle_movement(delta: float) -> void:
	rotation_direction = Input.get_axis("turn_left", "turn_right")
	rotation += rotation_direction * ROTATION_SPEED * delta
	
	if Input.is_action_pressed("thrust_forward"):
		velocity += transform.x * ACCELERATION * delta
	else:
		if velocity.length() > 0:
			velocity -= velocity.normalized() * DECELERATION * delta
			if velocity.length() < 0:
				velocity = Vector2.ZERO
	
	if velocity.length() > MOVE_SPEED:
		velocity = velocity.normalized() * MOVE_SPEED
	
	move_and_slide()

func handle_wrapping() -> void:
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		var bullet: Bullet = preload("res://entities/bullet/bullet.tscn").instantiate()
		bullet.global_position = $ShootingPoint.global_position
		bullet.global_rotation = $ShootingPoint.global_rotation
		$ShootingPoint.add_child(bullet)

# Method to destroy the player when hit by an asteroid.
func take_damage() -> void:
	queue_free()
	destroyed.emit()
