extends Node

const DEFAULT_LANGUAGE := "km"

func _ready() -> void:
	set_language(DEFAULT_LANGUAGE)

func set_language(locale: String) -> void:
	var normalized := locale.strip_edges().to_lower()
	if normalized == "":
		normalized = DEFAULT_LANGUAGE
	if not normalized in ["en", "km"]:
		normalized = DEFAULT_LANGUAGE
	TranslationServer.set_locale(normalized)
	print("Language set to: ", normalized)

func localize(key: String) -> String:
	return tr(key)
