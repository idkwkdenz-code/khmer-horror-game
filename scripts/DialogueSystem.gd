extends CanvasLayer

@onready var dialogue_text: Label = $DialoguePanel/DialogueText
@onready var inventory_text: Label = $InventoryPanel/InventoryText
@onready var player_name: Label = $NamePanel/PlayerName

func set_dialogue(message: String) -> void:
	dialogue_text.text = message

func set_inventory(items: String) -> void:
	inventory_text.text = items

func set_player_name(name: String) -> void:
	player_name.text = name
