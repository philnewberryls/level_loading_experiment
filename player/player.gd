extends CharacterBody2D
class_name Player


const SPEED: int = 4


func _ready():
	position = get_viewport_rect().get_center()


func _physics_process(_delta):
	var movement_x: float = Input.get_axis("ui_left", "ui_right")
	var movement_y: float = Input.get_axis("ui_up", "ui_down")

	velocity = Vector2(movement_x, movement_y) * SPEED

	var collision: KinematicCollision2D = move_and_collide(velocity)
	if collision:
		if collision.get_collider() is Enemy:
			collision.get_collider().die()
