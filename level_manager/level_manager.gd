extends Node2D


var current_level_id: int = 0


var level_list: Array[PackedScene] = [
	preload("res://level_manager/levels/level_1.tscn"),
	preload("res://level_manager/levels/level_2.tscn"),
	preload("res://level_manager/levels/level_3.tscn")
]


func _ready():
	change_level(current_level_id)


func change_level(id: int):
	id = id%(level_list.size())
	get_tree().call_deferred("change_scene_to_packed", level_list[id])


func progress_to_next_level():
	current_level_id += 1
	change_level(current_level_id)
