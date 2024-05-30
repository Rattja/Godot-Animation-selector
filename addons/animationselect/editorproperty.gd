extends EditorProperty
class_name AnimationDropdown

var dropdown := OptionButton.new()
var node : Node
var property : String

var tree_finder = AnimationTreeFinder.new()
var animation_tree : AnimationTree
var animation_list := []

func _init()  -> void:
	label = "Animation"
	dropdown.item_selected.connect(set_animation)
	add_child(dropdown)

## Sets the animation property to the selected animation.
func set_animation(animation) -> void:
	node = get_edited_object()
	property = get_edited_property()
	var animation_string = dropdown.get_item_text(animation)
	emit_changed(property, animation_string)

## Updates the dropdownlist and selects the current animation.[br]
## If selected animation no longer exists, then the dropdown will show blank.
func _update_property()  -> void:
	node = get_edited_object() as Action
	property = get_edited_property() as String
	if !node:
		return
	animation_tree = AnimationTreeFinder.get_animation_tree(node)
	if !animation_tree:
		return
	_get_animation_state_list()
	dropdown.clear()
	for each in animation_list:
		dropdown.add_item(each)
	var animation_index = animation_list.find(node[property])
	dropdown.select(animation_index)

## Gets the animations placed in the AnimationTree.
func _get_animation_state_list() -> void:
	var prop_list = animation_tree.tree_root.get_property_list()
	animation_list = []
	for each in prop_list:
		if each["class_name"] == "AnimationNode":
			animation_list.append(each["name"].split("/")[1])
