extends Control

@onready var title_label: Label = $CenterContainer/TitlePanel/Title
@onready var subtitle_label: Label = $CenterContainer/TitlePanel/SubTitle
@onready var play_button: Button = $CenterContainer/Buttons/PlayButton
@onready var settings_button: Button = $CenterContainer/Buttons/SettingsButton
@onready var info_button: Button = $CenterContainer/Buttons/InfoButton
@onready var exit_button: Button = $CenterContainer/Buttons/ExitButton

func _ready() -> void:
	update_texts()
	connect_signals()
	setup_background()

func setup_background() -> void:
	var panel := ColorRect.new()
	panel.color = Color(0.03, 0.02, 0.05, 1.0)
	panel.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(panel)
	move_child(panel, 0)

func connect_signals() -> void:
	play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	info_button.pressed.connect(_on_info_pressed)
	exit_button.pressed.connect(_on_exit_pressed)

func update_texts() -> void:
	title_label.text = tr("GAME_TITLE")
	subtitle_label.text = tr("GAME_SUBTITLE")
	play_button.text = tr("MENU_PLAY")
	settings_button.text = tr("MENU_SETTINGS")
	info_button.text = tr("MENU_INFO")
	exit_button.text = tr("MENU_EXIT")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GameScene.tscn")

func _on_settings_pressed() -> void:
	print("Settings opened")
	# This can later open a settings scene.
	# Example: get_tree().change_scene_to_file("res://scenes/SettingsScene.tscn")

func _on_info_pressed() -> void:
	print("Info opened")
	# This can later open a credits/info scene.

func _on_exit_pressed() -> void:
	get_tree().quit()
