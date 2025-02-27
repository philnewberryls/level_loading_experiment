extends CharacterBody2D
class_name Enemy


signal died()


func _ready():
	position.x = randi_range(0, int(get_viewport_rect().size.x))
	position.y = randi_range(0, int(get_viewport_rect().size.y))


func die():
	died.emit()
	queue_free()
