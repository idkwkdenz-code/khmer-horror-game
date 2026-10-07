extends Node3D

@onready var hud: CanvasLayer = $HUD
@onready var dialogue_label: Label = $HUD/DialoguePanel/DialogueText
@onready var inventory_label: Label = $HUD/InventoryPanel/InventoryText
@onready var name_label: Label = $HUD/NamePanel/PlayerName
@onready var environment: Node3D = $Environment

var ghost_count := 4
var ghost_positions: Array[Vector3] = []
var player_node: CharacterBody3D

func _ready() -> void:
	generate_environment()
	spawn_player()
	spawn_ghosts()
	show_dialogue("DIALOGUE_INTRO")
	update_inventory("Flashlight\nKey\nMatches")
	name_label.text = "Player: %s" % GameManager.load_player_name()

func generate_environment() -> void:
	var ground := MeshInstance3D.new()
	var ground_mesh := BoxMesh.new()
	ground_mesh.size = Vector3(120, 1, 120)
	ground.mesh = ground_mesh
	ground.position = Vector3(0, -1, 0)
	environment.add_child(ground)

	var fog := WorldEnvironment.new()
	var environment_data := Environment.new()
	environment_data.background_mode = Environment.BG_COLOR
	environment_data.background_color = Color(0.04, 0.04, 0.06, 1.0)
	environment_data.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	environment_data.ambient_light_color = Color(0.15, 0.15, 0.18, 1.0)
	environment_data.fog_enabled = true
	environment_data.fog_light_color = Color(0.10, 0.10, 0.12, 1.0)
	environment_data.fog_density = 0.025
	fog.environment = environment_data
	add_child(fog)

func spawn_player() -> void:
	var player_scene := preload("res://scenes/Player.tscn")
	player_node = player_scene.instantiate()
	player_node.position = Vector3(0, 1.2, 10)
	add_child(player_node)

func spawn_ghosts() -> void:
	for idx in range(ghost_count):
		var ghost := Node3D.new()
		ghost.name = "Ghost_%d" % idx
		ghost.position = Vector3(randf_range(-22, 22), 0.8, randf_range(-20, 20))
		var body := MeshInstance3D.new()
		var sphere := SphereMesh.new()
		sphere.radius = 0.6
		sphere.height = 1.4
		body.mesh = sphere
		body.material_override = StandardMaterial3D.new()
		body.material_override.albedo_color = Color(0.9, 0.9, 1.0, 1.0)
		body.material_override.emission_enabled = true
		body.material_override.emission = Color(0.20, 0.30, 0.60, 1.0)
		body.material_override.emission_energy_multiplier = 2.5
		ghost.add_child(body)
		add_child(ghost)
		ghost_positions.append(ghost.position)

func show_dialogue(key: String) -> void:
	dialogue_label.text = tr(key)

func update_inventory(items: String) -> void:
	inventory_label.text = "%s\n%s" % [tr("INVENTORY"), items]
