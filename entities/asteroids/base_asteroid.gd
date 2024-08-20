extends Area2D
class_name BaseAsteroid

@export var min_move_speed: float = 100
@export var max_move_speed: float = 250
var direction: Vector2 = Vector2.RIGHT
var move_speed: float

@export var min_rotation_speed: float = -2.0
@export var max_rotation_speed: float = 2.0
var rotation_speed: float

var screen_size: Vector2 = Vector2(480, 640)
var margin: float = 128

func _ready() -> void:
    var random_angle: float = randf() * TAU
    direction = Vector2(cos(random_angle), sin(random_angle))
    move_speed = randf_range(min_move_speed, max_move_speed)

    rotation_speed = randf_range(min_rotation_speed, max_rotation_speed)

func _physics_process(delta: float) -> void:
    position += direction * move_speed * delta
    rotation += rotation_speed * delta

    if position.x < -margin or position.x > screen_size.x + margin or position.y < -margin or position.y > screen_size.y + margin:
        queue_free()

func _on_body_entered(body: Node2D) -> void:
    if body.has_method("take_damage"):
        body.take_damage()