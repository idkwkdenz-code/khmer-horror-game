extends Node

var current_scene_name := ""

func _ready() -> void:
	current_scene_name = get_tree().current_scene.name if get_tree().current_scene else ""

func save_player_name(name: String) -> void:
	var path := "user://player_name.save"
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file:
		file.store_string(name)
		file.close()

func load_player_name() -> String:
	var path := "user://player_name.save"
	if not FileAccess.file_exists(path):
		return ""
	var file := FileAccess.open(path, FileAccess.READ)
	if file:
		var data := file.get_as_text()
		file.close()
		return data.strip_edges()
	return ""
