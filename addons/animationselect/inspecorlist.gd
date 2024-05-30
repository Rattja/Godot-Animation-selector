@tool
extends EditorInspectorPlugin

@export var test := ""

func _can_handle(object):
	return true

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if name == "animation":
		add_property_editor("animation", AnimationDropdown.new())
		return true
