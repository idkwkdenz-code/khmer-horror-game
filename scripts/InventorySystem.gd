extends Node

const MAX_ITEMS := 6
var inventory: Array[String] = []

func add_item(item_name: String) -> bool:
	if inventory.size() >= MAX_ITEMS:
		return false
	inventory.append(item_name)
	return true

func remove_item(item_name: String) -> void:
	inventory.erase(item_name)

func get_inventory_text() -> String:
	if inventory.is_empty():
		return "Empty"
	var result := ""
	for item in inventory:
		result += item + "\n"
	return result.trim_suffix("\n")
