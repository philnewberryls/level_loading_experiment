extends Node2D
class_name Level


signal last_enemy_died()

const PLAYER_SCENE: PackedScene = preload("res://player/player.tscn")
const ENEMY_SCENE: PackedScene = preload("res://enemy/enemy.tscn")

@export var enemies_to_spawn: int = 1


func _ready():
	last_enemy_died.connect(LevelManager.progress_to_next_level)
	var player: Player = PLAYER_SCENE.instantiate()
	add_child(player)

	for enemy in enemies_to_spawn:
		var new_enemy: Enemy = ENEMY_SCENE.instantiate()
		new_enemy.died.connect(_on_enemy_died)
		add_child(new_enemy)


func _on_enemy_died():
	print("Enemy died!")
	if get_tree().get_node_count_in_group("enemy") <= 1:
		last_enemy_died.emit()
